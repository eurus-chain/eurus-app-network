import 'mytransaction.dart';
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
class RetrieveWealthTxList extends Retrieve {

  final WealthTxListRequest data;

  RetrieveWealthTxList({this.data})
      : super(retrieve: 'wealth_tx_list');

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
      var resp = WealthTxListResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}

class WealthTxListRequest {

  final int startTime;
  final int endTime;
  final int pageNumber;
  final int pageSize;

  WealthTxListRequest({this.startTime, this.endTime,this.pageNumber,this.pageSize});

  Map<String, dynamic> toJson() =>
      {
        'start_time': startTime,
        'end_time': endTime,
        'page_number': pageNumber,
        'page_size': pageSize,
      };

  String toString() {

    String str = 'map[end_time:' + (endTime==null?'0':endTime.toString()) +' page_number:' + (pageNumber==null?'0':pageNumber.toString()) +
        ' page_size:' + (pageSize==null?'0':pageSize.toString()) + ' start_time:' + (startTime==null?'0':startTime.toString()) + ']';

    // MyLog.d('RetrieveUpdateOrder toString=' + str);
    return str;
  }
}


class WealthTxListResponse extends RetrieveResponse {

  List<MyTransaction> txList;
  int startTime;
  int endTime;
  int pageNumber;
  int pageSize;
  int total;
  String retrieve;
  String seq;
  int result;
  String comment;

  WealthTxListResponse({this.txList,this.startTime, this.endTime,this.pageNumber,this.pageSize,this.total,
    this.retrieve, this.seq, this.result, this.comment});

  @override
  WealthTxListResponse.fromJson(Map<String, dynamic> json) {
       if (json['tx_list'] != null) {
          txList = new List<MyTransaction>();
          json['tx_list'].forEach((v) {
            txList.add(new MyTransaction.fromJson(v));
          });
        }
        startTime = json['start_time'];
        endTime = json['end_time'];
        pageNumber = json['page_number'];
        pageSize = json['page_size'];
        total = json['total'];
        retrieve = json['retrieve'];
        seq = json['seq'];
        result = json['result'] as int;
        comment = json['comment'];
  }
}
