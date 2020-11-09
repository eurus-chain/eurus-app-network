
import '../common.dart';
import 'retrieve.dart';
import 'signup.dart';

class RetrieveRegisterByEmail extends Retrieve {
    final RegisterByEmailRequest data;

    RetrieveRegisterByEmail({this.data})
        : super(retrieve: 'register_by_email');

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

            var resp = SignUpResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
    NickName  string `json:"nick_name"`
    Name      string `json:"name"`  // optional, but should unique
    Phone     string `json:"phone"`
    PhoneCode string `json:"phone_code"`
    SmsCode   string `json:"sms_code"`
    Password  string `json:"password"`
    DeviceId  string `json:"device_id"`
    PublicKey string `json:"public_key"`
	Pushid    string `json:"pushid"`    // new
   */
class RegisterByEmailRequest {
    final String nickName;
    final String email;
    final String emailCode;
    final String password;
    String deviceId = common.deviceId;
    final String publicKey;
    final String pushId;

    RegisterByEmailRequest({this.email,this.nickName,
        this.emailCode, this.password, this.publicKey, this.pushId});

    Map<String, dynamic> toJson() =>
        {
            'device_id': deviceId,
            'email': email??'',
            'nick_name': nickName??'',
            'password': password,
            'public_key': publicKey,
            'pushid': pushId??'',
            'email_code': emailCode
        };

    String toString() {
        String nick = nickName??'';

        String str = 'map[device_id:' + deviceId +
            ' email:' + email + ' email_code:' + emailCode + ' nick_name:' + nick + ' password:' + password +
            ' public_key:' + publicKey +
            ' pushid:' + (pushId??'') + ']';

        return str;
    }
}

