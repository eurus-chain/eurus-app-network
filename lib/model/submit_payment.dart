import 'retrieve.dart';


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
class RetrieveSubmitPayment extends Retrieve {
    final String name;
    final String userNo;
    final SubmitPaymentRequest data;

    RetrieveSubmitPayment({this.data, this.name, this.userNo})
        : super(retrieve: 'submit_payment_by_userno');

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
            'user_no': userNo,
        };

    String toString() {
        String nn = name??'';
        String tt = token??'';

        String str = 'appid=' + appId + '&data=' + data.toString() +
            '&name=' + nn +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + tt + '&user_no=' + userNo;

        return str;
    }

    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;
        if (obj.result == 0) {
            var resp = SubmitPaymentResponse.fromJson(super.respJson);
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
class SubmitPaymentRequest {
    final String assetName;
    final String amount;
    final String feePaidBy;
    final String orderId;
    final String merchantId;
    final String callbackUrl;
    final String pinCode;
    final String googleCode;
    final String smsCode;


    SubmitPaymentRequest({this.assetName, this.amount, this.feePaidBy,
        this.orderId, this.merchantId, this.callbackUrl, this.pinCode, this.googleCode, this.smsCode});

    Map<String, dynamic> toJson() =>
        {
        'amount': amount,
        'asset_name': assetName,
        'callback_url': callbackUrl ?? '',
        'fee_paid_by': feePaidBy ?? '',
        'merchantid': merchantId,
        'order_id': orderId,
        'pin_code': pinCode,
        'google_code': googleCode ?? '',
        'sms_code': smsCode,
      };

    String toString() {
        String cu = callbackUrl??'';
        String fp = feePaidBy??'';

        String str = 'map[amount:' + amount + ' asset_name:' + assetName +
            ' callback_url:' + cu + ' fee_paid_by:' + fp + ' google_code:' + (googleCode??'') + ' merchantid:' + merchantId +
            ' order_id:' + orderId + ' pin_code:' + pinCode + ' sms_code:' + (smsCode??'') + ']';

        return str;
    }
}

/*
	Id  string `json:"id"`  // system order id
	Url string `json:"url"` // system payment url , used by merchant, redirect to user
	AssetName     string `json:"asset_name"`
	Amount        string `json:"amount"`
	Fee       string `json:"fee"`         // denominated by AssetName
	FeePaidBy string `json:"fee_paid_by"` // "FROM","TO", empty default "FROM"
	OrderId     string `json:"order_id"`      // order id from merchant
	Merchantid  string `json:"merchantid"`

	Retrieve       string         `json:"retrieve"`
	Seq            string         `json:"seq"`
	Result         reterr.ErrCode `json:"result"`
	Comment        string         `json:"comment"`
 */
class SubmitPaymentResponse extends RetrieveResponse {
    final String id;
    final String url;
    final String assetName;
    final String amount;
    final String fee;
    final String feePaidBy;
    final String orderId;
    final String merchantId;
    String retrieve;
    String seq;
    int result;
    String comment;

    SubmitPaymentResponse({this.id, this.url, this.assetName, this.amount, this.fee, this.feePaidBy,
        this.orderId, this.merchantId, this.retrieve, this.seq, this.result, this.comment});

    @override
    SubmitPaymentResponse.fromJson(Map<String, dynamic> json)
        :   id = json['id'],
            url = json['url'],
            assetName = json['asset_name'],
            amount = json['amount'],
            fee = json['fee'],
            feePaidBy = json['fee_paid_by'],
            orderId = json['order_id'],
            merchantId = json['merchantid'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
