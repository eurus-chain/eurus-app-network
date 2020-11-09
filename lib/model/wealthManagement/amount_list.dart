import '../retrieve.dart';
// enum EventType {
//   EventBeforeStart,
//   EventStarting,
//   EventAlreadyEnd}

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
class RetrieveAmountList extends Retrieve {

  final AmountListRequest data;

  RetrieveAmountList({this.data})
      : super(retrieve: 'amount_list');

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

    String str = 'appid=' + appId + '&data=map[]' + '&phone=' + phone + '&phone_code=' + phoneCode +
        '&retrieve=' + retrieve + '&seq=' + seq +
        '&sign_type=' + signType + '&token=' + tt;

    return str;
  }

  @override
  Future<RetrieveResponse> sendRequest(var payload) async {
    RetrieveResponse obj = await super.sendRequest(payload);
    if (obj == null) return null;
    if (obj.result == 0) {
     var resp = AmountListResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}

class AmountListRequest {
  AmountListRequest();

  Map<String, dynamic> toJson() => {};
}

class AmountListResponse extends RetrieveResponse {
  List<String> list;
  String retrieve;
  String seq;
  int result;
  String comment;

  AmountListResponse({this.list,this.retrieve, this.seq, this.result, this.comment});

  @override
  AmountListResponse.fromJson(Map<String, dynamic> json)
      : list = json['list'].cast<String>(),
        retrieve = json['retrieve'],
        seq = json['seq'],
        result = json['result'] as int,
        comment = json['comment'];
}
