import 'retrieve.dart';


/*
    Appid     string      `json:"appid"`
    Sign      string      `json:"sign"`
    SignType  string      `json:"sign_type"`

    Phone     string      `json:"phone"`
    PhoneCode string      `json:"phone_code"`
    Token     string      `json:"token"`

    Retrieve   string   `json:"retrieve"`
    Seq        string   `json:"seq"`
    Data      interface{} `json:"data"`
 */
class RetrieveGetOpenId extends Retrieve {


    RetrieveGetOpenId()
        : super(retrieve: 'get_openid');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'phone': phone,
            'phone_code': phoneCode,
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType,
            'token': token??''
        };

    String toString() {
        String tt = token??'';

        String str = 'appid=' + appId +
            '&phone=' + phone + '&phone_code=' + phoneCode +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + tt;

        return str;
    }

    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;
        if (obj.result == 0) {
            var resp = GetOpenIdResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}


class GetOpenIdResponse extends RetrieveResponse {
    final String openId;
    String retrieve;
    String seq;
    int result;
    String comment;

    GetOpenIdResponse({this.openId,
        this.retrieve, this.seq, this.result, this.comment});

    @override
    GetOpenIdResponse.fromJson(Map<String, dynamic> json)
        :   openId = json['openid'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
