import 'dart:convert';
import '../common.dart';
import 'retrieve.dart';
enum LoginPageType {
  MainUI,
  VerifyCodeUI,
  GoogleAuthUI,
}

class RetrieveSignIn extends Retrieve {
    final SignInRequest data;
    final LoginPageType loginPageType;
    RetrieveSignIn({this.data,this.loginPageType})
        : super(retrieve:'login_by_phone_password');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType
        };

    String toString() {
        String str = 'appid=' + appId + '&data=' + data.toString() +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType;

        return str;
    }

    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;
        if (obj.result == 0) {

            var resp = SignInResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
    Phone      string `json:"phone"`
    PhoneCode  string `json:"phone_code"`
    SmsCode    string `json:"sms_code"` // if first time login
    Nonce      string `json:"nonce"`
    ClientType string `json:"client_type"`
    CaptchaId  string `json:"captcha_id"`
    Password   string `json:"password"`
    DeviceId   string `json:"device_id"` // if not empty&not first time, need sms
   */
class SignInRequest {
    final String phone;
    final String phoneCode;
    final String smsCode;
    final String nonce;
    String clientType = common.clientType;
    final String captchaId;
    final String password;
    String deviceId = common.deviceId;
    String openId;
    String userNo;
    String pinCode;
    String publicKey;
    String pushId;
    String googleCode;
    LoginPageType loginPageType;
    String name;
    String email;

    SignInRequest({this.phone, this.phoneCode, this.smsCode, this.nonce,
        this.captchaId,this.password,this.openId,this.userNo,this.pinCode,this.publicKey,this.pushId,this.googleCode,this.loginPageType,this.name,this.email});

    Map<String, dynamic> toJson() {
        if(loginPageType == LoginPageType.GoogleAuthUI){

       return {
            'email':email ?? '',
            'captcha_id': captchaId??'',
            'client_type': clientType,
            'device_id': deviceId,
            'google_code': googleCode??'',
            'nonce': nonce??'',
            'password': password??'',
            'phone': phone,
            'phone_code': phoneCode,
            'sms_code': smsCode??'',
//            'open_id': openId??'',
//            'user_no': userNo??'',
//            'pin_code': pinCode??'',
//            'public_key': publicKey??'',
//            'pushid': pushId??'',

//            'name': name??'',
//            'email':email??''
        };
        } else {
          return {
            'email':email,
            'captcha_id': captchaId ?? '',
            'client_type': clientType,
            'device_id': deviceId,
            'nonce': nonce ?? '',
            'password': password??'',
            'phone': phone,
            'phone_code': phoneCode,
            'sms_code': smsCode ?? '',
          };
        }
    }

    String toString() {
        String cap = captchaId??'';
        String non = nonce??'';
        String sms = smsCode??'';
        String pw = password??'';
        String oI = openId??'';
        String uN = userNo??'';
        String pc = pinCode??'';
        String pk = publicKey??'';
        String pI = pushId??'';
        String gc = googleCode??'';
        String n = name??'';
        String e = email??'';

        String str = 'map[captcha_id:' + cap + ' client_type:' + clientType +
            ' device_id:' + deviceId +' email:'+e;
        if(loginPageType == LoginPageType.GoogleAuthUI) {
          str = str +
//              ' open_id:' + oI + ' user_no:' + uN +
//              ' pin_code:' + pc + ' public_key:' + pk + ' pushid:' + pI+
              ' google_code:' + gc
//              +' name:' + n
              ;
        }
        str = str + ' nonce:' + non+ ' password:' + pw+
            ' phone:' + phone + ' phone_code:' + phoneCode + ' sms_code:' + sms + ']';

        return str;
    }
}

class SignInResponse extends RetrieveResponse {
    /*
    NickName string               `json:"nick_name"`
    UserNo  string                `json:"user_no"`
    Logoid   string               `json:"logoid"`
    Assets   []*UserAssets        `json:"assets"`
    TotalGz  string               `json:"total_gz"`
    Token    string               `json:"token"`
    Retrieve   string   		  `json:"retrieve"`
    Seq        string  			  `json:"seq"`
    Result   reterr.ErrCode       `json:"result"`
    Comment  string               `json:"comment"`
   */
    String nickName;
    String userNo;
    String logoId;
    List<UserAsset> userAssets;
    String totalGz;
    String kycStatus;
    String token;
    String retrieve;
    String twofaEnable;
    String paymentSetting;
    String seq;
    int result;
    String comment;

    SignInResponse({this.nickName, this.userNo, this.logoId, this.kycStatus,this.userAssets, this.totalGz,
        this.token, this.retrieve, this.seq, this.result, this.comment, this.twofaEnable , this.paymentSetting});

    @override
    SignInResponse.fromJson(Map<String, dynamic> json)
        :   nickName = json['nick_name'],
            userNo = json['user_no'],
            logoId = json['logoid'],
            totalGz = json['total_gz'],
            kycStatus = json['kyc_status'],
            token = json['token'],
            retrieve = json['retrieve'],
            twofaEnable = json['twofa_enable'],
            paymentSetting = json['payment_setting'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'] {
        userAssets = UserAsset.fromJsons(json['assets']);
    }
}

/*
    AssetName string `json:"asset_name"`
    Balance   string `json:"balance"`
    Frozen    string `json:"frozen"`
    Uuid      uint64 `json:"uuid"`
    Address   string `json:"address"`
   */
class UserAsset{
    String assetName;
    String balance;
    String frozen;
    int uuid;
    String address;

    UserAsset({this.assetName, this.balance, this.frozen, this.uuid, this.address});

    UserAsset.fromJson(Map<String, dynamic> json)
        : assetName = json['asset_name'],
            balance = json['balance'],
            frozen = json['frozen'],
            uuid = json['uuid'] as int,
            address = json['address'];

    static List<UserAsset> fromJsons(List<dynamic> jsons) {

        List<UserAsset> assets = new List<UserAsset>();

        jsons.forEach((item) {
            UserAsset ua = UserAsset.fromJson(item);
            assets.add(ua);
        });

        return assets;
    }

      Map<String, dynamic> toJson() =>
        {
            'asset_name': assetName,
            'balance': balance,
            'frozen': frozen,
            'address': address,
            'uuid': uuid
        };

    static String listToString(List<UserAsset> assets) {
        if (assets == null || assets.length == 0) {
            return '[]';
        }
        String jsonStr = '[';
        assets.forEach((item) {
            var myJson = item.toJson();
            String str = jsonEncode(myJson);
            jsonStr += str + ',';
        });
        jsonStr = jsonStr.substring(0, jsonStr.length-1);
        jsonStr += ']';
        return jsonStr;
    }

    static List<UserAsset> stringToList(String str) {
        if (str == null || str.length == 0)
            return null;
        var myJson = jsonDecode(str);
        List<UserAsset> mas = UserAsset.fromJsons(myJson);   
        return mas;
    }
}
