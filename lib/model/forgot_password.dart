import 'retrieve.dart';



class RetrieveForgotPassword extends Retrieve {
    final String name;
    final String phone;
    final String phoneCode;
    final String token;
    final ForgotPasswordRequest data;

    RetrieveForgotPassword({this.data, this.name, this.phone, this.phoneCode, this.token})
        : super(retrieve: 'change_password');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
            'name': name??'',
            'phone': phone,
            'phone_code': phoneCode,
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType,
            'token': token??''
        };

    String toString() {
        String str = 'appid=' + appId + '&data=' + data.toString() +
            '&name=' + name??'' + '&phone=' + phone + '&phone_code=' + phoneCode +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + token??'';


        return str;
    }
}

/*
    NewPassword string `json:"new_password"`
    SmsCode     string `json:"sms_code"`
 */
class ForgotPasswordRequest {
    final String newPassword;
    final String smsCode;
    final String googleCode;

    ForgotPasswordRequest({this.smsCode, this.newPassword, this.googleCode});

    Map<String, dynamic> toJson() =>
        {
            'new_password': newPassword,
            'sms_code': smsCode,
            'google_code': googleCode
        };

    String toString() {
        String str = 'map[google_code:' + googleCode + ' new_password:' + newPassword + ' sms_code:' + smsCode + ']';

        return str;
    }
}
