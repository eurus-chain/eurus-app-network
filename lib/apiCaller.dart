import 'package:apiHandler/apiHandler.dart';
import 'package:apiHandler/exception_info.dart';
import 'package:apiHandler/model/myuser.dart';
import 'package:apiHandler/model/retrieve.dart';
import 'package:apiHandler/model/signin.dart';
import 'package:apiHandler/model/signin_sms.dart';
import 'package:apiHandler/rsa_pem.dart';
import 'package:pointycastle/pointycastle.dart';



class ApiCaller {

  static final ApiCaller _instance = ApiCaller._internal();

  ApiCaller._internal();

  factory ApiCaller() {
    return _instance;
  }

  Future<MyUser> signIn({String phoneCode, String phone, String smsCode}) async {
    String loadingApi = 'login';

    RetrieveSignInSms retrieve = new RetrieveSignInSms(
        data: new SignInSmsRequest(
          phone: phone,
          phoneCode: phoneCode,
          smsCode: smsCode,
        ));

    RSAPrivateKey prvKey = null;
    // read private key
    MyUser user = MyUser(phoneCode: "86",phoneOrEmail: "12345678");
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