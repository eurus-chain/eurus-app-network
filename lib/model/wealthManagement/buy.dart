

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
class RetrieveBuy extends Retrieve {
    final String name;
    final String userNo;
    final BuyRequest data;

    RetrieveBuy({this.data, this.name, this.userNo})
        : super(retrieve: 'buy');

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
            '&sign_type=' + signType + '&token=' + tt;

        // MyLog.d('RetrieveSubmitPayment toString=' + str);
        return str;
    }

    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;
        if (obj.result == 0) {
            var resp = RetrieveResponse.fromJson(super.respJson);
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
class BuyRequest {
    final String cardId;
    final String assetName;
    final String amount;
    final String pinCode;
    final String googleCode;
    final String smsCode;


    BuyRequest({this.assetName, this.amount, this.cardId, this.pinCode, this.googleCode, this.smsCode});

    Map<String, dynamic> toJson() =>
        {
        'amount': amount,
        'asset_name': assetName,
        'card_id':cardId,
        'pin_code': pinCode,
        'google_code': googleCode ?? '',
        'sms_code': smsCode,
      };

    String toString() {

        String str = 'map[amount:' + amount + ' asset_name:' + assetName + ' card_id:' + cardId + ' google_code:' + (googleCode??'') + ' pin_code:' + pinCode + ' sms_code:' + (smsCode??'') + ']';

        return str;
    }
}


