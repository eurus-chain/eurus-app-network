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
class RetrieveDealList extends Retrieve {

  final DealListRequest data;

  RetrieveDealList({this.data})
      : super(retrieve: 'deal_list');

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
     var resp = DealListResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}

class DealListRequest {
  final String type;
  final String cardType;

  DealListRequest({this.type,this.cardType});

  Map<String, dynamic> toJson() =>
      {
        'type': type,
        'card_type': cardType,
      };

  String toString() {
    String str = 'map[card_type'+ cardType + ' type:' + type + ']';

    return str;
  }
}

class DealListResponse extends RetrieveResponse{
  List<DealList> list;
  String retrieve;
  String seq;
  int result;
  String comment;

  DealListResponse(
      {this.list, this.retrieve, this.seq, this.result, this.comment});

  DealListResponse.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<DealList>();
      json['list'].forEach((v) {
        list.add(new DealList.fromJson(v));
      });
    }
    retrieve = json['retrieve'];
    seq = json['seq'];
    result = json['result'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['retrieve'] = this.retrieve;
    data['seq'] = this.seq;
    data['result'] = this.result;
    data['comment'] = this.comment;
    return data;
  }
}

class DealList {
  String id;
  String amount;
  String assetName;
  String cardid;
  String createTime;
  String type;
  String calcInterestAmount;
  String dayEndAmount;
  String afterAmount;

  DealList(
      {this.id,
        this.amount,
        this.assetName,
        this.cardid,
        this.createTime,
        this.type,
        this.calcInterestAmount,
        this.dayEndAmount,
        this.afterAmount});

  DealList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    assetName = json['asset_name'];
    cardid = json['cardid'];
    createTime = json['create_time'];
    type = json['type'];
    calcInterestAmount = json['calc_interest_amount'];
    dayEndAmount = json['day_end_amount'];
    afterAmount = json['after_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['asset_name'] = this.assetName;
    data['cardid'] = this.cardid;
    data['create_time'] = this.createTime;
    data['type'] = this.type;
    data['calc_interest_amount'] = this.calcInterestAmount;
    data['day_end_amount'] = this.dayEndAmount;
    data['after_amount'] = this.afterAmount;
    return data;
  }
}