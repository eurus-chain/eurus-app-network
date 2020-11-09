import 'retrieve.dart';

class RetrieveSignUp extends Retrieve {
    final SignUpRequest data;

    RetrieveSignUp({this.data})
        : super(retrieve: 'register_by_userno');

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
class SignUpRequest {
    final String nickName;
    final String name;
    final String phone;
    final String phoneCode;
    final String smsCode;
    final String password;
    String deviceId = common.deviceId;
    final String publicKey;
    final String pushId;

    SignUpRequest({this.nickName, this.name, this.phone, this.phoneCode,
        this.smsCode, this.password, this.publicKey, this.pushId});

    Map<String, dynamic> toJson() =>
        {
            'device_id': deviceId,
            'name': name??'',
            'nick_name': nickName??'',
            'password': password,
            'phone': phone,
            'phone_code': phoneCode,
            'public_key': publicKey,
            'pushid': pushId??'',
            'sms_code': smsCode
        };

    String toString() {
        String nn = name??'';
        String nick = nickName??'';

        String str = 'map[device_id:' + deviceId +
            ' name:' + nn + ' nick_name:' + nick + ' password:' + password +
            ' phone:' + phone + ' phone_code:' + phoneCode +
            ' public_key:' + publicKey +
            ' pushid:' + (pushId??'') +
            ' sms_code:' + smsCode + ']';

        return str;
    }
}


/*
	NickName string `json:"nick_name"`
	UserNo   string `json:"user_no"`//auto gen here aZ123456
	Retrieve string `json:"retrieve"`
	Seq      string `json:"seq"`
	Result   int    `json:"result"`
	Comment  string `json:"comment"`
 */
class SignUpResponse extends RetrieveResponse {
    String nickName;
    String userNo;
    String retrieve;
    String seq;
    int result;
    String comment;

    SignUpResponse({this.nickName, this.userNo,
        this.retrieve, this.seq, this.result, this.comment});

    @override
    SignUpResponse.fromJson(Map<String, dynamic> json) :
            nickName = json['nick_name'],
            userNo = json['user_no'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
