import 'retrieve.dart';



class RetrieveGetTicket extends Retrieve {
    final String name;

    final GetTicketRequest data;

    RetrieveGetTicket({this.data, this.name})
        : super(retrieve: 'get_ticket');

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
        var resp = GetTicketResponse.fromJson(super.respJson);
        return resp;
    }
}

/*
	Fileid string `json:"fileid"`
 */
class GetTicketRequest {
    final String fileId;

    GetTicketRequest({this.fileId});

    Map<String, dynamic> toJson() =>
        {
            'fileid': fileId,
        };

    String toString() {
        String str = 'map[fileid:' + fileId + ']';

        return str;
    }
}

/*
	Fileid   string `json:"fileid"`
	Retrieve string `json:"retrieve"`
	Seq      string `json:"seq"`
	Body     string `json:"body"`
	Format   string `json:"format"`
 */
class GetTicketResponse extends RetrieveResponse {
    String fileId;
    String retrieve;
    String seq;
    String body;
    String format;

    GetTicketResponse({this.fileId, this.retrieve, this.seq, this.body, this.format});

    @override
    GetTicketResponse.fromJson(Map<String, dynamic> json)
        :   fileId = json['fileid'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            body = json['body'],
            format = json['format'];
}
