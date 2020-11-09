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
class RetrieveSymbolList extends Retrieve {
    final String name;

    
    RetrieveSymbolList({this.name})
        : super(retrieve: "symbol_list");

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': {},
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

        String str = 'appid=' + appId + '&data=map[]' +
            '&name=' + nn + '&phone=' + phone + '&phone_code=' + phoneCode +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + tt;

        // MyLog.d('RetrieveGenAddress toString=' + str);
        return str;
    }


    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;

        if (obj.result == null ||  obj.result == 0) {
            // MyLog.d('GenAddressRequest:' + super.respJson.toString());
            var resp = SymboListResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}


/*
	Symbols []*symbols `json:"symbols"`
	Retrieve   string   `json:"retrieve"`
	Seq        string   `json:"seq"`
 */
class SymboListResponse extends RetrieveResponse {
    List symbols;
    String retrieve;
    String seq;
    int result;
    String comment;

    SymboListResponse({this.symbols, 
        this.retrieve, this.seq, this.result, this.comment});

    @override
    SymboListResponse.fromJson(Map<String, dynamic> json) :
            symbols = json['symbols'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
