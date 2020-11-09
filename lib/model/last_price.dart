import 'retrieve.dart';


/*
  Appid     string      `json:"appid"`
	Sign      string      `json:"sign"`
	SignType  string      `json:"sign_type"`
	Name      string      `json:"name"`
	Phone     string      `json:"phone"`
	PhoneCode string      `json:"phone_code"`
	Token     string      `json:"token"`
	Retrieve   string   `json:"retrieve"`
	Seq        string   `json:"seq"`
	Data      interface{} `json:"data"`
 */
class RetrieveLastPrice extends Retrieve {
    final String name;

    final LastPriceRequest data;

    RetrieveLastPrice({this.data, this.name})
        : super(retrieve: 'last_price');

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

        if (obj.result == null || obj.result == 0) {
            var resp = LastPriceResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
   Symbol string `json:"symbol"`
 */
class LastPriceRequest {
    final String symbol;

    LastPriceRequest({this.symbol});

    Map<String, dynamic> toJson() =>
        {
            'symbol': symbol,
        };

    String toString() {
        String str = 'map[symbol:' + symbol + ']';

        return str;
    }
}

/*
	Retrieve   string `json:"retrieve"`
	Seq        string `json:"seq"`
	TickSeq    uint32 `json:"tick_seq"`
	Symbol     string `json:"symbol"`
	LastPrice  string `json:"last_price"`
	UpdateTime string `json:"update_time"`
 */
class LastPriceResponse extends RetrieveResponse {
    String symbol;
    String lastPrice;
    String retrieve;
    String seq;
    int result;
    String comment;
    int tickSeq;
    String updateTime;

    LastPriceResponse({this.symbol, this.lastPrice,this.tickSeq,this.updateTime,
        this.retrieve, this.seq, this.result, this.comment});

    @override
    LastPriceResponse.fromJson(Map<String, dynamic> json) :
            symbol = json['symbol'],
            lastPrice = json['last_price'],
            tickSeq = json['tick_seq'],
            updateTime = json['update_time'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
