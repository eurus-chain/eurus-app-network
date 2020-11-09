import 'retrieve.dart';
//


class RetrieveCancelOrder extends Retrieve {
    final String name;

    final CancelOrderRequest data;

    RetrieveCancelOrder({this.data, this.name})
        : super(retrieve: 'cancel_otc_order');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
            'name': name??'',
            'phone': phone,
            'phone_code': phoneCode,
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType,
            'token': token??''
        };

    String toString() {
        String nn = name??'';
        String tt = token??'';

        String str = 'appid=' + appId + '&data=' + data.toString() +
            '&name=' + nn + '&phone=' + phone + '&phone_code=' + phoneCode +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + tt;

        return str;
    }


    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;
        if (obj.result == 0) {
            var resp = CancelOrderResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
	UserSymbol string `json:"user_symbol"`
	Id         string `json:"id"` //system order id of taker
 */
class CancelOrderRequest {
    final String userSymbol;
    final String id;

    CancelOrderRequest({this.userSymbol, this.id});

    Map<String, dynamic> toJson() =>
        {
            'id': id,
            'user_symbol': userSymbol,
        };

    String toString() {
        String str = 'map[id:' + id + ' user_symbol:' + userSymbol + ']';

        return str;
    }
}

/*
	UserSymbol string `json:"user_symbol"`
	Id         string `json:"id"`

	Retrieve       string         `json:"retrieve"`
	Seq            string         `json:"seq"`
	Result         reterr.ErrCode `json:"result"`
	Comment        string         `json:"comment"`
 */
class CancelOrderResponse extends RetrieveResponse {
    final String userSymbol;
    final String id;
    String retrieve;
    String seq;
    int result;
    String comment;

    CancelOrderResponse({this.userSymbol, this.id,
        this.retrieve, this.seq, this.result, this.comment});

    @override
    CancelOrderResponse.fromJson(Map<String, dynamic> json)
        :   userSymbol = json['user_symbol'],
            id = json['id'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
