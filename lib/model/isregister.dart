import 'retrieve.dart';

class RetrieveIsRegister extends Retrieve {
    final IsRegisterRequest data;

    RetrieveIsRegister({this.data})
        : super(retrieve: 'isregister');

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
            var resp = IsRegisterResponse.fromJson(super.respJson);
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
class IsRegisterRequest {
    final String phone;
    final String email;
    final String phoneCode;
    final String userNo;

    IsRegisterRequest({this.email,this.phone,this.phoneCode,this.userNo});

    Map<String, dynamic> toJson() =>
        {
            'phone': phone,
            'email': email??'',
            'phone_code': phoneCode??'',
            'user_no':userNo??'',
        };

    String toString() {

        String str = 'map[email:' + email +
            ' phone:' + phone + ' phone_code:' + phoneCode + ' user_no:' + userNo + ']';

        return str;
    }
}

class IsRegisterResponse extends RetrieveResponse {
  String isRegister;
  String retrieve;
  String seq;
  int result;
  String comment;
  String nickName;
  String logoId;

  IsRegisterResponse({this.isRegister,
    this.retrieve, this.seq, this.result, this.comment,this.nickName,this.logoId});

  @override
  IsRegisterResponse.fromJson(Map<String, dynamic> json) :
        isRegister = json['is_registered'],
        retrieve = json['retrieve'],
        seq = json['seq'],
        result = json['result'] as int,
        comment = json['comment'],
        nickName = json['nick_name'],
        logoId = json['logo_id'];
}

