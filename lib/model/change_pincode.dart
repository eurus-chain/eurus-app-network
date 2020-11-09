import 'retrieve.dart';
//


class RetrieveResetPinCode extends Retrieve {
    final String name;
    final String email;

    final ResetPinCodeRequest data;

    RetrieveResetPinCode({this.data,this.name,this.email})
        : super(retrieve: 'change_pin_code');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
            'name': name??'',
            'email':email,
            'phone': phone,
            'phone_code': phoneCode,
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType,
            'token': token??''
        };

    String toString() {
        String nn = name??'';
        String tt = token??'';

        String str = 'appid=' + appId + '&data=' + data.toString() + '&email=' + email +
            '&name=' + nn + '&phone=' + phone + '&phone_code=' + phoneCode +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + tt;

        return str;
    }
}

/*
	SmsCode    string `json:"sms_code"`
	NewPinCode string `json:"new_pin_code"`
 */
class ResetPinCodeRequest {
    final String smsCode;
    final String newPinCode;
    final String googleCode;

    ResetPinCodeRequest({this.smsCode, this.newPinCode, this.googleCode});

    Map<String, dynamic> toJson() =>
        {
            'new_pin_code': newPinCode,
            'sms_code': smsCode,
            'google_code': googleCode
        };

    String toString() {
        String str = 'map[google_code:' + googleCode  + ' new_pin_code:' + newPinCode + ' sms_code:' + smsCode + ']';
        return str;
    }
}
