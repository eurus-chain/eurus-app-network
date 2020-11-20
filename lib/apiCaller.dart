import 'package:apihandler/apiHandler.dart';
import 'package:apihandler/exception_info.dart';
import 'package:apihandler/model/myuser.dart';
import 'package:apihandler/model/retrieve.dart';
import 'package:apihandler/model/signin.dart';
import 'package:apihandler/model/signin_sms.dart';
import 'package:apihandler/model/update_device.dart';
import 'package:apihandler/rsa_pem.dart';
import 'package:pointycastle/pointycastle.dart';



class ApiCaller {

  static final ApiCaller _instance = ApiCaller._internal();

  ApiCaller._internal();

  factory ApiCaller() {
    return _instance;
  }

  Future<RetrieveResponse> updateDevice(
      {String phoneCode,
        String phone,
        String email,
        String userNo,
        String code}) async {
    String loadingApi = 'updateDevice';
    AsymmetricKeyPair<PublicKey, PrivateKey> keyPair =
    new RsaKeyHelper().generateKeyPair();
    var rsaHelper = new RsaKeyHelper();
    var pubPem = rsaHelper.encodePublicKeyToPem2(keyPair.publicKey);
    var prvPem = rsaHelper.encodePrivateKeyToPem2(keyPair.privateKey);
    RSAPrivateKey prvKey = keyPair.privateKey;

    RetrieveUpdateDevice retrieve = new RetrieveUpdateDevice(
        data: new UpdateDeviceRequest(
          publicKey: pubPem,
          smsCode: code,
          pushId: "123",
        ),
        email: email,
        userNo: userNo,
        phone: phone,
        phoneCode: phoneCode);

    retrieve.signature(prvKey); // signature

    RetrieveResponse resp = await retrieve.sendRequest(retrieve.toJson());
    handleRespError(resp, loadingApi);
    common.user = MyUser();
    common.user.phoneCode = retrieve.phoneCode;
    common.user.Phone = retrieve.phone;
    common.user.email = retrieve.email;
    common.user.pubKeyPem = pubPem;
    common.user.prvKeyPem = prvPem;

    return resp;
  }

  Future<MyUser> signIn({String phoneCode, String phone, String code}) async {
    String loadingApi = 'login';

    RetrieveSignInSms retrieve = new RetrieveSignInSms(
        data: new SignInSmsRequest(
          phone: phone,
          phoneCode: phoneCode,
          smsCode: code,
        ));

    RSAPrivateKey prvKey = null;
    // read private key
    MyUser user = MyUser(phoneCode: "86",Phone: "12345678");
    if (user == null || user.prvKeyPem == null) {
      throw NetHandlerException(errNo: NetHandlerError.errNoPrivateKey);
    }

    var rsaHelper = new RsaKeyHelper();
    prvKey = rsaHelper.parsePrivateKeyFromPem2(user.prvKeyPem);
    if (prvKey == null) {
      throw NetHandlerException(errNo: NetHandlerError.errNoPrivateKey);
    }

    retrieve.signature(prvKey); // signature
    RetrieveResponse resp = await retrieve.sendRequest(retrieve.toJson());
    handleRespError(resp, loadingApi);
    // update user
    SignInResponse siResp = resp;
    user = user.signInResponseToUser(siResp: siResp);

    return user;
  }

  handleRespError(resp, tag) {
    if (resp == null) {
      throw NetHandlerException(errNo: NetHandlerError.errResponseNull);
    } else if (resp.result != null && resp.result != 0) {
      var msg = resp.comment + '(' + resp.result.toString() + ')';
      throw NetHandlerException(
          errNo: NetHandlerError.errResponseFail,
          errNoSub: resp.result,
          errMessage: msg,
          pinCodeErrCount:
          resp.pinCodeErrCount != null ? resp.pinCodeErrCount : 0);
    }
  }

}

ApiCaller apiCaller = ApiCaller();