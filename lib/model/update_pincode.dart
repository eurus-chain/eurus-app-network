import 'retrieve.dart';



class RetrieveUpdatePinCode extends Retrieve {
    final String name;

    final UpdatePinCodeRequest data;

    RetrieveUpdatePinCode({this.data, this.name})
        : super(retrieve: 'update_pin_code');

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
        String nn = name??'';
        String tt = token??'';

        String str = 'appid=' + appId + '&data=' + data.toString() +
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
class UpdatePinCodeRequest {
    final String oldPinCode;
    final String newPinCode;

    UpdatePinCodeRequest({this.oldPinCode, this.newPinCode});

    Map<String, dynamic> toJson() =>
        {
            'new_pin_code': newPinCode,
            'old_pin_code': oldPinCode,
        };

    String toString() {
        String str = 'map[new_pin_code:' + newPinCode + ' old_pin_code:' + oldPinCode + ']';

        return str;
    }
}
