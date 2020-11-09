import 'isregister.dart';
import 'retrieve.dart';

class RetrieveGetTargetUserInfo extends Retrieve {
    final GetTargetUserInfoRequest data;

    RetrieveGetTargetUserInfo({this.data})
        : super(retrieve: 'get_target_user_info');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType,
            'token': token??''
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
class GetTargetUserInfoRequest {
    final String userNo;

    GetTargetUserInfoRequest({this.userNo});

    Map<String, dynamic> toJson() =>
        {

            'user_no':userNo??'',
        };

    String toString() {

        String str = 'map[user_no:' + userNo + ']';

        return str;
    }
}



