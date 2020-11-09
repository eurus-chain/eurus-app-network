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
class RetrieveCloseUser extends Retrieve {

  final CloseUserRequest data;

  RetrieveCloseUser({this.data})
      : super(retrieve: 'close_user');

  Map<String, dynamic> toJson() =>
      {
        'appid': appId,
        'data': data.toJson(),
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

    String str = 'appid=' + appId + '&data=' + data.toString() + '&phone=' + phone + '&phone_code=' + phoneCode +
        '&retrieve=' + retrieve + '&seq=' + seq +
        '&sign_type=' + signType + '&token=' + tt;

    return str;
  }
      @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;
        if (obj.result == 0) {
            var resp = CloseUserResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
	Status string `json:"status"`
 */
class CloseUserRequest {
  final int status;

  CloseUserRequest({this.status});

  Map<String, dynamic> toJson() =>
      {
        'status': status,
      };

  String toString() {
    String str = 'map[status:' + status.toString() + ']';

    return str;
  }
}

class CloseUserResponse extends RetrieveResponse {
    final int status;
    String retrieve;
    String seq;
    int result;
    String comment;

    CloseUserResponse({this.status,
        this.retrieve, this.seq, this.result, this.comment});

    @override
    CloseUserResponse.fromJson(Map<String, dynamic> json)
        :   status = json['status'] as int,
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}