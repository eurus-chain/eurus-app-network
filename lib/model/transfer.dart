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
class RetrieveTransfer extends Retrieve {
    final String name;
    final String userNo;
    final TransferRequest data;

    RetrieveTransfer({this.data, this.name, this.userNo})
        : super(retrieve: 'transfer_by_userno');

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
            '&name=' + nn + '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + tt + '&user_no=' + userNo;

        return str;
    }


    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;
        if (obj.result == 0) {

            var resp = TransferResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
	AssetName   string `json:"asset_name"`
	OrderId     string `json:"order_id"` //third party order id for reference.
	ToUserNo     string `json:"to_user_no"`
	Amount      string `json:"amount"`
	PinCode     string `json:"pin_code"`
 */
class TransferRequest {
    final String assetName;
    final String orderId;
    final String toUserNo;
    final String toPhoneCode;
    final String toPhone;
    final String amount;
    final String pinCode;
    final String smsCode;
    final String googleCode;

    TransferRequest({this.assetName, this.orderId, this.toUserNo,
        this.toPhoneCode, this.toPhone, this.amount, this.pinCode,this.smsCode, this.googleCode});

    Map<String, dynamic> toJson() =>
        {
            'amount': amount,
            'asset_name': assetName,
            'order_id': orderId??'',
            'pin_code': pinCode,
            'to_phone': toPhone??'',
            'to_phone_code': toPhoneCode??'',
            'to_user_no': toUserNo??'',
            'sms_code': smsCode??'',
            'google_code': googleCode??'',
        };

    String toString() {
        String str = 'map[amount:' + amount + ' asset_name:' + assetName + ' google_code:' + (googleCode??'') +
            ' order_id:' + (orderId??'') + ' pin_code:' + (pinCode??'') + ' sms_code:' + (smsCode??'') + ' to_phone:' + (toPhone??'') +
            ' to_phone_code:' + (toPhoneCode??'') + ' to_user_no:' + (toUserNo??'')  + ']';

        return str;
    }
}

/*
	OrderId     string `json:"order_id"`
	AssetName   string `json:"asset_name"`
	ToUserNo      string `json:"to_user_no"`
	Amount      string `json:"amount"`
	Retrieve   string   `json:"retrieve"`
	Seq        string   `json:"seq"`
	Result      int    `json:"result"`
	Comment     string `json:"comment"`
 */
class TransferResponse extends RetrieveResponse {
    String orderId;
    String assetName;
    String toUserNo;
    String toPhoneCode;
    String toPhone;
    String amount;
    String retrieve;
    String seq;
    int result;
    String comment;

    TransferResponse({this.orderId, this.assetName,
        this.toUserNo, this.amount, this.retrieve, this.seq, this.result, this.comment});

    @override
    TransferResponse.fromJson(Map<String, dynamic> json)
        :   orderId = json['order_id'],
            assetName = json['asset_name'],
            toUserNo = json['to_user_no'],
            toPhone = json['to_phone'],
            toPhoneCode = json['to_phone_code'],
            amount = json['amount'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
