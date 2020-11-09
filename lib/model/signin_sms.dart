import 'signin.dart';
import 'retrieve.dart';

class RetrieveSignInSms extends Retrieve {
    final SignInSmsRequest data;

    RetrieveSignInSms({this.data})
        : super(retrieve: 'login');

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
class SignInSmsRequest {
    final String phone;
    final String phoneCode;
    final String smsCode;
    final String nonce;
    String clientType = common.clientType;
    final String captchaId;
    String deviceId = common.deviceId;

    SignInSmsRequest({this.phone, this.phoneCode, this.smsCode, this.nonce,
        this.captchaId});

    Map<String, dynamic> toJson() =>
        {
            'captcha_id': captchaId??'',
            'client_type': clientType,
            'device_id': deviceId,
            'nonce': nonce??'',
            'phone': phone,
            'phone_code': phoneCode,
            'sms_code': smsCode??''
        };

    String toString() {
        String cap = captchaId??'';
        String non = nonce??'';
        String sms = smsCode??'';

        String str = 'map[captcha_id:' + cap + ' client_type:' + clientType +
            ' device_id:' + deviceId + ' nonce:' + non +
            ' phone:' + phone + ' phone_code:' + phoneCode + ' sms_code:' + sms + ']';

        return str;
    }
}
