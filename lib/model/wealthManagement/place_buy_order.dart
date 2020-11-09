
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
class RetrievePlaceBuyOrder extends Retrieve {
    final String name;
    final String userNo;
    final PlaceBuyOrderRequest data;

    RetrievePlaceBuyOrder({this.data, this.name, this.userNo})
        : super(retrieve: 'place_buy_order');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
            'name': name??'',
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType,
            'token': token??'',
            'user_no': userNo ?? '',
        };

    String toString() {
        String nn = name??'';
        String tt = token??'';

        String str = 'appid=' + appId + '&data=' + data.toString() +
            '&name=' + nn +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + tt;

        return str;
    }

    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;
        if (obj.result == 0) {
            var resp = PlaceBuyOrderResponse.fromJson(super.respJson);
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
class PlaceBuyOrderRequest {
    final String cardId;
    final String assetName;
    final String amount;



    PlaceBuyOrderRequest({this.assetName, this.amount, this.cardId});

    Map<String, dynamic> toJson() =>
        {
        'amount': amount,
        'asset_name': assetName,
        'card_id':cardId,
      };

    String toString() {

        String str = 'map[amount:' + amount + ' asset_name:' + assetName + ' card_id:' + cardId +']';

        return str;
    }
}


class PlaceBuyOrderResponse extends RetrieveResponse{
  String orderId;
  String amount;
  String assetName;
  String merchantName;
  String merchantId;
  String type;
  String retrieve;
  String seq;
  int result;
  String comment;

  PlaceBuyOrderResponse(
      {this.orderId,
        this.amount,
        this.assetName,
        this.merchantName,
        this.merchantId,
        this.type,
        this.retrieve,
        this.seq,
        this.result,
        this.comment});

  PlaceBuyOrderResponse.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    amount = json['amount'];
    assetName = json['asset_name'];
    merchantId = json['merchant_id'];
    merchantName = json['merchant_name'];
    type = json['type'];
    retrieve = json['retrieve'];
    seq = json['seq'];
    result = json['result'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['amount'] = this.amount;
    data['asset_name'] = this.assetName;
    data['merchant_name'] = this.merchantName;
    data['merchant_id'] = this.merchantId;
    data['type'] = this.type;
    data['retrieve'] = this.retrieve;
    data['seq'] = this.seq;
    data['result'] = this.result;
    data['comment'] = this.comment;
    return data;
  }
}