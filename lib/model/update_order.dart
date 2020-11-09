import 'retrieve.dart';



class RetrieveUpdateOrder extends Retrieve {
    final String name;

    final UpdateOrderRequest data;

    RetrieveUpdateOrder({this.data, this.name})
        : super(retrieve: 'upload_otc_ticket');

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
            var resp = UpdateOrderResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
	UserSymbol string `json:"user_symbol"`
	Id         string `json:"id"` //system order id of taker
	Body       string `json:"body"`
	Format     string `json:"format"`
	FileName   string `json:"file_name"`
	PayerName  string `json:"payer_name"`
 */
class UpdateOrderRequest {
    final String userSymbol;
    final String id;
    final String body;
    final String format;
    final String fileName;
    final String payerName;

    UpdateOrderRequest({this.userSymbol, this.id, this.body, this.format, this.fileName, this.payerName});

    Map<String, dynamic> toJson() =>
        {
            'body': body??'',
            'file_name': fileName??'',
            'format': format??'',
            'id': id,
            'payer_name': payerName??'',
            'user_symbol': userSymbol??'',
        };

    String toString() {
        String bb = body??'';
        String fm = format??'';
        String fn = fileName??'';
        String us = userSymbol??'';

        String str = 'map[body:' + bb + ' file_name:' + fn + ' format:' + fm +
            ' id:' + id + ' payer_name:' + (payerName??'') + ' user_symbol:' + us + ']';

        return str;
    }
}

/*
	UserSymbol string `json:"user_symbol"`
	Id         string `json:"id"`
	FileId     string `json:"fileid"`
	PayerName  string `json:"payer_name"`

	Retrieve       string         `json:"retrieve"`
	Seq            string         `json:"seq"`
	Result         reterr.ErrCode `json:"result"`
	Comment        string         `json:"comment"`
 */
class UpdateOrderResponse extends RetrieveResponse {
    final String userSymbol;
    final String id;
    final String fileId;
    final String payerName;
    String retrieve;
    String seq;
    int result;
    String comment;

    UpdateOrderResponse({this.userSymbol, this.id, this.fileId, this.payerName,
        this.retrieve, this.seq, this.result, this.comment});

    @override
    UpdateOrderResponse.fromJson(Map<String, dynamic> json)
        :   userSymbol = json['user_symbol'],
            id = json['id'],
            fileId = json['fileid'],
            payerName = json['payer_name'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
