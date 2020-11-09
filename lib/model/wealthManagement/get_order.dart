
import '../retrieve.dart';

/*
    Appid     string      `json:"appid"`
    Sign      string      `json:"sign"`
    SignType  string      `json:"sign_type"`

    Name      string      `json:"name"`
    UserNo     string      `json:"user_no"`
    Token     string      `json:"token"`

    Retrieve   string   `json:"retrieve"`
    Seq        string   `json:"seq"`
    Data      interface{} `json:"data"`
 */
class RetrieveGetOrder extends Retrieve {
    final GetOrderRequest data;

    RetrieveGetOrder({this.data})
        : super(retrieve: 'get_order');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType,
            'token': token??'',
        };

    String toString() {
        String tt = token??'';

        String str = 'appid=' + appId + '&data=' + data.toString() +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + tt;

        // MyLog.d('RetrieveSubmitPayment toString=' + str);
        return str;
    }

    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;
        if (obj.result == 0) {
            var resp = GetOrderResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
	AssetName     string `json:"asset_name"`
	Amount        string `json:"amount"`
	FeePaidBy     string `json:"fee_paid_by"`   // "FROM","TO", empty default "FROM"
	OrderId       string `json:"order_id"`      // order id from merchant
	Merchantid    string `json:"merchantid"`
	CallbackUrl   string `json:"callback_url"` // after pay fi, notify  to url for merchant
	PinCode       string `json:"pin_code"`
 */
class GetOrderRequest {
    final String orderId;
    final String merchantId;



    GetOrderRequest({this.orderId, this.merchantId});

    Map<String, dynamic> toJson() =>
        {
        'order_id': orderId,
        'merchantid':merchantId,
      };

    String toString() {

        String str = 'map[merchantid:' + merchantId + ' order_id:' + orderId +']';

        return str;
    }
}

class GetOrderResponse extends RetrieveResponse {
  String id;
  String appid;
  String assetName;
  String amount;
  String fee;
  String fromPhone;
  String fromPhoneCode;
  String fromUserNo;
  String fromAddress;
  String orderId;
  String feePaidBy;
  String createTime;
  String updateTime;
  String type;
  String status;
  String paidTotal;
  String merchantid;
  String merchantName;
  String retrieve;
  String seq;
  int result;
  String comment;

  GetOrderResponse(
      {this.id,
        this.appid,
        this.assetName,
        this.amount,
        this.fee,
        this.fromPhone,
        this.fromPhoneCode,
        this.fromUserNo,
        this.fromAddress,
        this.orderId,
        this.feePaidBy,
        this.createTime,
        this.updateTime,
        this.type,
        this.status,
        this.paidTotal,
        this.merchantid,
        this.merchantName,
        this.retrieve,
        this.seq,
        this.result,
        this.comment});

  GetOrderResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appid = json['appid'];
    assetName = json['asset_name'];
    amount = json['amount'];
    fee = json['fee'];
    fromPhone = json['from_phone'];
    fromPhoneCode = json['from_phone_code'];
    fromUserNo = json['from_user_no'];
    fromAddress = json['from_address'];
    orderId = json['order_id'];
    feePaidBy = json['fee_paid_by'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
    type = json['type'];
    status = json['status'];
    paidTotal = json['paid_total'];
    merchantid = json['merchantid'];
    merchantName = json['merchant_name'];
    retrieve = json['retrieve'];
    seq = json['seq'];
    result = json['result'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appid'] = this.appid;
    data['asset_name'] = this.assetName;
    data['amount'] = this.amount;
    data['fee'] = this.fee;
    data['from_phone'] = this.fromPhone;
    data['from_phone_code'] = this.fromPhoneCode;
    data['from_user_no'] = this.fromUserNo;
    data['from_address'] = this.fromAddress;
    data['order_id'] = this.orderId;
    data['fee_paid_by'] = this.feePaidBy;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['type'] = this.type;
    data['status'] = this.status;
    data['paid_total'] = this.paidTotal;
    data['merchantid'] = this.merchantid;
    data['merchant_name'] = this.merchantName;
    data['retrieve'] = this.retrieve;
    data['seq'] = this.seq;
    data['result'] = this.result;
    data['comment'] = this.comment;
    return data;
  }
}