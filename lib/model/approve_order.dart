import 'retrieve.dart';



class RetrieveApproveOrder extends Retrieve {
    final String name;

    final ApproveOrderRequest data;

    RetrieveApproveOrder({this.data, this.name})
        : super(retrieve: 'otc_order_approve');

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
            var resp = ApproveOrderResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
	UserSymbol string `json:"user_symbol"`
	Id         string `json:"id"`
	Status     string `json:"status"` //STATUS_SUSPEND, default:STATUS_FINISHED
 */
class ApproveOrderRequest {
    final String userSymbol;
    final String id;
    final String status;

    ApproveOrderRequest({this.userSymbol, this.id, this.status,});

    Map<String, dynamic> toJson() =>
        {
            'id': id??'',
            'status': status??'',
            'user_symbol': userSymbol??'',
        };

    String toString() {
        String str = 'map[id:' + (id??'') + ' status:' + (status??'') + ' user_symbol:' + (userSymbol??'') + ']';
        return str;
    }
}

/*
	UserSymbol     string         `json:"user_symbol"`
	Id             string         `json:"id"`
	Status         string         `json:"status"`

	Retrieve       string         `json:"retrieve"`
	Seq            string         `json:"seq"`
	Result         reterr.ErrCode `json:"result"`
	Comment        string         `json:"comment"`
 */
class ApproveOrderResponse extends RetrieveResponse {
    final String userSymbol;
    final String id;
    final String status;
    String retrieve;
    String seq;
    int result;
    String comment;

    ApproveOrderResponse({this.userSymbol, this.id, this.status,
        this.retrieve, this.seq, this.result, this.comment});

    @override
    ApproveOrderResponse.fromJson(Map<String, dynamic> json)
        :   userSymbol = json['user_symbol'],
            id = json['id'],
            status = json['status'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
