import 'retrieve.dart';
enum EventType {
  EventBeforeStart,
  EventStarting,
  EventAlreadyEnd}

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
class RetrieveIsWealthSelected extends Retrieve {

  final IsWealthSelectedRequest data;

  RetrieveIsWealthSelected({this.data})
      : super(retrieve: 'is_wealth_selected');

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
      var resp = IsWealthSelectedResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}

class IsWealthSelectedRequest {
  IsWealthSelectedRequest();

  Map<String, dynamic> toJson() => {};
}

class IsWealthSelectedResponse extends RetrieveResponse {

  String userNo;
  String userName;
  String merchantId;
  String merchantName;
  String minAmount;
  String maxAmount;
  int startTime;
  int endTime;
  String activeTime;
  String activeRules;
  String activeHowTo;
  List<List<dynamic>> activeExamples;
  String retrieve;
  String seq;
  int result;
  String comment;
  int minAmountInt;
  int maxAmountInt;

  void convertAmountToInt(){
    if(minAmount!=null && maxAmount!=null){
      double  minAmountInt = int.parse(minAmount) / 1000000;
      this.minAmountInt = minAmountInt.toInt();
      double  maxAmountInt = int.parse(maxAmount) / 1000000;
      this.maxAmountInt = maxAmountInt.toInt();
    }
  }

  EventType checkEventStart(){
    double currentTimeStampDouble = DateTime.now().millisecondsSinceEpoch/1000;
    int currentTimeStamp =  currentTimeStampDouble.toInt();
        EventType eventType;
    if(currentTimeStamp < startTime ){
      eventType = EventType.EventBeforeStart;
    } else if(currentTimeStamp > startTime &&  currentTimeStamp < this.endTime){
      eventType = EventType.EventStarting;
    } else {
      eventType = EventType.EventAlreadyEnd;
    }
    //eventType
    return eventType;
  }


  IsWealthSelectedResponse(
      {this.userNo,
      this.userName,
      this.merchantId,
      this.merchantName,
      this.startTime,
      this.endTime,
      this.minAmount,
      this.maxAmount,
      this.activeTime,
      this.activeRules,
      this.activeHowTo,
      this.activeExamples,
      this.retrieve,
      this.seq,
      this.result,
      this.comment});

  @override
  IsWealthSelectedResponse.fromJson(Map<String, dynamic> json) {
        userNo = json['user_no'];
        userName = json['user_name'];
        merchantId = json['merchantid'];
        merchantName = json['merchant_name'];
        startTime = json['start_time'];
        endTime = json['end_time'];
        minAmount = json['min_amount'];
        maxAmount = json['max_amount'];
        activeTime = json['active_time'];
        activeRules = json['active_rules'];
        activeHowTo = json['active_howto'];
        if (json['active_examples'] != null) {
          activeExamples = new List<List<dynamic>>();
          json['active_examples'].forEach((v) { activeExamples.add(v); });
        }
        retrieve = json['retrieve'];
        seq = json['seq'];
        result = json['result'] as int;
        comment = json['comment'];
  }
}
