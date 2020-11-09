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
class RetrieveCardList extends Retrieve {

  final CardListRequest data;

  RetrieveCardList({this.data})
      : super(retrieve: 'card_list');

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
      var resp = CardListResponse.fromJson(super.respJson);
      return resp;

    }

    return obj;
  }
}

class CardListRequest {
  CardListRequest();

  Map<String, dynamic> toJson() => {};
}

class CardListResponse extends RetrieveResponse{
  List<DemandList> demandList;
  Balance demandBalance;
  List<DemandList> fixList;
  Balance fixBalance;
  Balance totalBalance;
  bool isShow;
  String retrieve;
  String seq;
  int result;
  String comment;

  CardListResponse(
      {this.demandList,
        this.demandBalance,
        this.fixList,
        this.fixBalance,
        this.totalBalance,
        this.isShow,
        this.retrieve,
        this.seq,
        this.result,
        this.comment});

  CardListResponse.fromJson(Map<String, dynamic> json) {
    if (json['demand_list'] != null) {
      demandList = new List<DemandList>();
      json['demand_list'].forEach((v) {
        demandList.add(new DemandList.fromJson(v));
      });
    }
    demandBalance = json['demand_balance'] != null
        ? new Balance.fromJson(json['demand_balance'])
        : null;
    if (json['fix_list'] != null) {
      fixList = new List<DemandList>();
      json['fix_list'].forEach((v) {
        fixList.add(new DemandList.fromJson(v));
      });
    }
    fixBalance = json['fix_balance'] != null
        ? new Balance.fromJson(json['fix_balance'])
        : null;
    totalBalance = json['total_balance'] != null
        ? new Balance.fromJson(json['total_balance'])
        : null;
    isShow = json['is_show'] ?? false;
    retrieve = json['retrieve'];
    seq = json['seq'];
    result = json['result'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.demandList != null) {
      data['demand_list'] = this.demandList.map((v) => v.toJson()).toList();
    }
    if (this.demandBalance != null) {
      data['demand_balance'] = this.demandBalance.toJson();
    }
    if (this.fixList != null) {
      data['fix_list'] = this.fixList.map((v) => v.toJson()).toList();
    }
    if (this.fixBalance != null) {
      data['fix_balance'] = this.fixBalance.toJson();
    }
    if (this.totalBalance != null) {
      data['total_balance'] = this.totalBalance.toJson();
    }
    data['retrieve'] = this.retrieve;
    data['seq'] = this.seq;
    data['result'] = this.result;
    data['comment'] = this.comment;
    return data;
  }
}

class DemandList {
  String id;
  String merchantid;
  String name;
  String assetName;
  int startTime;
  int endTime;
  String logoid;
  String displayInterestIntro;
  String ratePercentage;
  String displayRateIntro;
  String accessValue;
  String displayAccessIntro;
  Balance balance;
  bool isTotalBuyerFull;
  bool isTotalAmountFull;
  bool isBought;


  bool isHoldingThisCard() {
    return balance != null && balance.balance != "0";
  }

  DemandList(
      {this.id,
        this.merchantid,
        this.name,
        this.assetName,
        this.startTime,
        this.endTime,
        this.logoid,
        this.displayInterestIntro,
        this.ratePercentage,
        this.displayRateIntro,
        this.accessValue,
        this.displayAccessIntro,
        this.balance,
        this.isTotalAmountFull,
        this.isTotalBuyerFull,
        this.isBought});

  DemandList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchantid = json['merchantid'];
    name = json['name'];
    assetName = json['asset_name'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    logoid = json['logoid'];
    displayInterestIntro = json['display_interest_intro'];
    ratePercentage = json['rate_percentage'];
    displayRateIntro = json['display_rate_intro'];
    accessValue = json['access_value'];
    displayAccessIntro = json['display_access_intro'];
    balance =
    json['balance'] != null ? new Balance.fromJson(json['balance']) : null;
    isTotalAmountFull = json['is_total_amount_full'] ?? false;
    isTotalBuyerFull = json['is_total_buyer_full'] ?? false;
    isBought = json['is_bought'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['merchantid'] = this.merchantid;
    data['name'] = this.name;
    data['asset_name'] = this.assetName;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['logoid'] = this.logoid;
    data['display_interest_intro'] = this.displayInterestIntro;
    data['rate_percentage'] = this.ratePercentage;
    data['display_rate_intro'] = this.displayRateIntro;
    data['access_value'] = this.accessValue;
    data['display_access_intro'] = this.displayAccessIntro;
    if (this.balance != null) {
      data['balance'] = this.balance.toJson();
    }
    data['is_total_amount_full'] = this.isTotalAmountFull;
    data['is_total_buyer_full'] = this.isTotalBuyerFull;
    return data;
  }
}

class Balance {
  String balance;
  String cumulativeEarn;
  String lastEarn;
  String rate;

  Balance({this.balance, this.cumulativeEarn, this.lastEarn, this.rate});

  Balance.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    cumulativeEarn = json['cumulative_earn'];
    lastEarn = json['last_earn'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balance'] = this.balance;
    data['cumulative_earn'] = this.cumulativeEarn;
    data['last_earn'] = this.lastEarn;
    data['rate'] = this.rate;
    return data;
  }
}