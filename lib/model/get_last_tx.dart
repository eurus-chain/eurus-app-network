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
class RetrieveLastTX extends Retrieve {

//  final GenLastTXRequest data;

  RetrieveLastTX()
      : super(retrieve: 'last_tx');

  Map<String, dynamic> toJson() =>
      {
        'appid': appId,
//        'data': data.toJson(),
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

    String str = 'appid=' + appId + '&phone=' + phone + '&phone_code=' + phoneCode +
        '&retrieve=' + retrieve + '&seq=' + seq +
        '&sign_type=' + signType + '&token=' + tt;

    return str;
  }


  @override
  Future<RetrieveResponse> sendRequest(var payload) async {
    RetrieveResponse obj = await super.sendRequest(payload);
    if (obj == null) return null;
    if (obj.result == 0) {
      var resp = GenLastTXResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}

class GenLastTXRequest {

  GenLastTXRequest();
}

/*
	  Id string `json:"id"`
	  AssetName   string `json:"asset_name"`
	  Amount string `json:"amount"`
	  Type string `json:"type"`
	  Time string `json:"time"`
    Retrieve    string `json:"retrieve"`
    Seq         string `json:"seq"`
    Result      int    `json:"result"`
    Comment     string `json:"comment"`
 */
class GenLastTXResponse extends RetrieveResponse {
  String id;
  String assetName;
  String amount;
  String type;
  String time;
  String retrieve;
  String seq;
  int result;
  String comment;

  GenLastTXResponse({this.id,this.assetName, this.amount,this.type,this.time,
    this.retrieve, this.seq, this.result, this.comment});

  @override
  GenLastTXResponse.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        assetName = json['asset_name'],
        amount = json['amount'],
        type = json['type'],
        time = json['time'],
        retrieve = json['retrieve'],
        seq = json['seq'],
        result = json['result'] as int,
        comment = json['comment'];
}
