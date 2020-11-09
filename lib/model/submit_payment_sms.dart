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
class RetrieveSubmitPaymentSms extends Retrieve {
    final String name;
    final String userNo;
    final SubmitPaymentSmsRequest data;

    RetrieveSubmitPaymentSms({this.data, this.name, this.userNo})
        : super(retrieve: 'submit_payment_by_sms');

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
            var resp = SubmitPaymentSmsResponse.fromJson(super.respJson);
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
class SubmitPaymentSmsRequest {
     String assetName;
     String amount;
     String fromPhone;
     String fromPhoneCode;
     String feePaidBy;
     String orderId;
     String toPhone;
     String toPhoneCode;
     String merchantId;
     String merchantName;
     String smsCode;
     String pinCode;

    SubmitPaymentSmsRequest({this.assetName, this.amount,this.fromPhone,this.fromPhoneCode,this.feePaidBy,
        this.orderId,this.toPhone,this.toPhoneCode,this.merchantId,this.merchantName,this.smsCode, this.pinCode});

  Map<String, dynamic> toJson() => {
        'asset_name': assetName,
        'amount': amount,
        'from_phone': fromPhone ?? '',
        'from_phone_code': fromPhoneCode ?? '',
        'fee_paid_by': feePaidBy ?? '',
        'order_id': orderId,
        'to_phone': toPhone ?? '',
        'to_phone_code': toPhoneCode ?? '',
        'merchantid': merchantId,
        'merchant_name': merchantName ?? '',
        'sms_code': smsCode ?? '',
        'pin_code': pinCode ?? '',
      };

  String toString() {
    fromPhone = fromPhone ?? '';
    fromPhoneCode = fromPhoneCode ?? '';
    toPhone = toPhone ?? '';
    toPhoneCode = toPhoneCode ?? '';
    smsCode = smsCode ?? '';
    feePaidBy = feePaidBy ?? '';
    merchantId = merchantId ?? '';
    merchantName = merchantName ?? '';
    orderId = orderId ?? '';
    String str = 'map[amount:' + amount + ' asset_name:' + assetName + ' fee_paid_by:' + feePaidBy + ' merchantid:' + merchantId +
        ' order_id:' + orderId + ' pin_code:' + pinCode + ']';

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
class SubmitPaymentSmsResponse extends RetrieveResponse {
    final String id;
    final String url;
    final String assetName;
    final String amount;
    final String fee;
    final String feePaidBy;
    final String toPhone;
    final String toPhoneCode;
    final String orderId;
    final String merchantId;
    final String merchantName;
    String retrieve;
    String seq;
    int result;
    String comment;

    SubmitPaymentSmsResponse({this.id, this.url, this.assetName, this.amount, this.fee, this.feePaidBy,
        this.orderId,this.toPhone,this.toPhoneCode,this.merchantId,this.merchantName, this.retrieve, this.seq, this.result, this.comment});

    @override
    SubmitPaymentSmsResponse.fromJson(Map<String, dynamic> json)
        :   id = json['id'],
            url = json['url'],
            assetName = json['asset_name'],
            amount = json['amount'],
            fee = json['fee'],
            feePaidBy = json['fee_paid_by'],
            orderId = json['order_id'],
            toPhone = json['to_phone'],
            toPhoneCode = json['to_phone_code'],
            merchantId = json['merchantid'],
            merchantName = json['merchant_name'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
