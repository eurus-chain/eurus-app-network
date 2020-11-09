import 'retrieve.dart';



class RetrieveChangePWWithEmail extends Retrieve {
    final String name;
    final String email;
    final String token;
    final ChangePWWithEmail data;

    RetrieveChangePWWithEmail({this.data, this.name, this.email, this.token})
        : super(retrieve: 'change_password_by_email');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
            'name': name??'',
            'email': email,
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
class ChangePWWithEmail {
    final String newPassword;
    final String emailCode;

    ChangePWWithEmail({this.newPassword, this.emailCode});

    Map<String, dynamic> toJson() =>
        {
            'new_password': newPassword,
            'email_code': emailCode,
        };

    String toString() {
        String str = 'map[new_password:' + newPassword + ' email_code:' + emailCode + ']';

        return str;
    }
}
