import 'retrieve.dart';

/*
    Appid     string      `json:"appid"`
    Sign      string      `json:"sign"`
    SignType  string      `json:"sign_type"`
    Phone     string      `json:"phone"`
    PhoneCode string      `json:"phone_code"`
    Retrieve string      `json:"retrieve"`
    Data     interface{} `json:"data"`
    Seq      string      `json:"seq"`
 */
class RetrieveUpdateDevice extends Retrieve {
    final UpdateDeviceRequest data;
    final String phone;
    final String phoneCode;
    final String userNo;
    final String email;

    RetrieveUpdateDevice({this.data, this.email, this.phone, this.phoneCode, this.userNo})
        : super(retrieve: 'update_user_device');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
            'phone': phone,
            'email':email,
            'phone_code': phoneCode,
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType,
            'user_no': userNo??'',
        };

    String toString() {
        String str = 'appid=' + appId + '&data=' + data.toString() +
            '&phone=' + phone + '&phone_code=' + phoneCode +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&user_no=' + (userNo??'');

        return str;
    }
}

/*
  DeviceId  string `json:"device_id"`
  PublicKey string `json:"public_key"`
  SmsCode   string `json:"sms_code"`
  */
class UpdateDeviceRequest {
    String deviceId = common.deviceId;
    final String publicKey;
    final String smsCode;
    final String pushId;

    UpdateDeviceRequest({this.publicKey, this.smsCode, this.pushId});

    Map<String, dynamic> toJson() =>
        {
            'device_id': deviceId,
            'public_key': publicKey,
            'sms_code': smsCode,
            'pushid': pushId??'',
        };

    String toString() {
        String str = 'map[device_id:' + deviceId + ' public_key:' + publicKey +
            ' pushid:' + (pushId??'') +
            ' sms_code:' + smsCode + ']';

        return str;
    }
}
