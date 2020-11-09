import 'mytransaction.dart';
import 'retrieve.dart';


class RetrieveTxList extends Retrieve {

    TxListRequest data;

    RetrieveTxList({this.data})
        : super(retrieve: 'tx_list');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data' : data.toJson(),
            'phone': phone,
            'phone_code': phoneCode,
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType,
            'token': token,
        };

    String toString() {

        String str = 'appid=' + appId + '&data=' + data.toString() +
            '&phone=' + phone + '&phone_code=' + phoneCode +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + token;

        // MyLog.d('RetrieveTxList toString=' + str);
        return str;
    }

    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;

        if (obj.result == 0) {
            // MyLog.d('txList sendRequest resp:' + super.respJson.toString());
            // MyLog.d('txList sendRequest resp len:' + super.respJson.length.toString());
            var resp = TxListResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
    Asset      string `json:"asset"`
    StartTime  int64  `json:"start_time"`
    EndTime    int64  `json:"end_time"`
    PageNumber int64  `json:"page_number"`
    PageSize   int64  `json:"page_size"`
 */
class TxListRequest {
    final String asset;
    final int start_time;
    final int end_time;
    final int page_number;
    final int page_size;
    final String type;
    final String user_no;

    TxListRequest({this.asset, this.start_time, this.end_time, this.page_number, this.page_size, this.type, this.user_no});

    Map<String, dynamic> toJson() =>
        {
            'asset': asset,
            'end_time': end_time??0,
            'page_number': page_number??0,
            'page_size': page_size??0,
            'start_time': start_time??0,
            'type': type??"",
            'user_no': user_no??""
        };

    String toString() {
        String st = start_time == null ? '0' : start_time.toString();
        String et = end_time == null ? '0' : end_time.toString();
        String pn = page_number == null ? '0' : page_number.toString();
        String ps = page_size == null ? '0' : page_size.toString();

        String str = 'map[asset:' + asset + ' end_time:' + et +
            ' page_number:' + pn + ' page_size:' + ps + ' start_time:' + st + ' type:' + type + ' user_no:' + user_no +']';

        // String str = 'map[asset:' + asset + ']';

        // MyLog.d('TxListRequest toString=' + str);
        return str;
    }
}

/*
    TxList     []*tx_in_one `json:"tx_list"`
    Asset      string       `json:"asset"`
    StartTime  int64        `json:"start_time"`
    EndTime    int64        `json:"end_time"`
    PageNumber int64        `json:"page_number"`
    PageSize   int64        `json:"page_size"`
    Total      int64        `json:"total"`
    Retrieve   string       `json:"retrieve"`
    Seq        string       `json:"seq"`
    Result     int          `json:"result"`
    Comment    string       `json:"comment"`
 */
class TxListResponse extends RetrieveResponse {
    List<MyTransaction> txList;
    String asset;
    int startTime;
    int endTime;
    int pageNumber;
    int pageSize;
    int total;
    String retrieve;
    String seq;
    int result;
    String comment;

    // TxListResponse({this.txList, this.asset, this.retrieve, this.seq, this.result, this.comment});

    @override
    TxListResponse.fromJson(Map<String, dynamic> json)
        :   asset = json['asset'],
            startTime = json['start_time'] as int,
            endTime = json['end_time'] as int,
            pageNumber = json['page_number'] as int,
            pageSize = json['page_size'] as int,
            total = json['total'] as int,
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'] {

        // MyLog.d('TxListResponse.fromJson:' + json['tx_list'].toString());
        txList = MyTransaction.fromJsons(json['tx_list']);
    }
}
