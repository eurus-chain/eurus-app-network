import 'mymessage.dart';
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
class RetrieveMessageList extends Retrieve {
    String name;

    final MessageListRequest data;

    RetrieveMessageList({this.data, this.name})
        : super(retrieve: 'msgs_page');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
            'name' : name??'',
            'phone': phone,
            'phone_code': phoneCode,
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType,
            'token': token,
        };

    String toString() {
        String nn = name??'';

        String str = 'appid=' + appId + '&data=' + data.toString() +
            '&name=' + nn + '&phone=' + phone + '&phone_code=' + phoneCode +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + token;

        return str;
    }

    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;

        if (obj.result != null && obj.result == 0) {

            var resp = MessageListResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
	Channelid  string `json:"channelid"` //if empty, for all
	PageNumber int64  `json:"page_number"`//optional, always zero
	PageSize   int64  `json:"page_size"`
 */
class MessageListRequest {
    final String channelId;
    final int pageNumber;
    final int pageSize;

    MessageListRequest({this.channelId, this.pageNumber, this.pageSize});

    Map<String, dynamic> toJson() =>
        {
            'channelid': channelId??'',
            'page_number': pageNumber??0,
            'page_size': pageSize??0,
        };

    String toString() {
        String str = 'map[channelid:' + (channelId??'') +
            ' page_number:' + (pageNumber==null?'0':pageNumber.toString()) +
            ' page_size:' + (pageSize==null?'0':pageSize.toString()) + ']';

        return str;
    }
}

/*
	Msgs       []iproto.Msgs `json:"msgs"`
	PageNumber int64         `json:"page_number"`
	PageSize   int64         `json:"page_size"`
	Total      int64         `json:"total"`

    Retrieve   string   `json:"retrieve"`
    Seq        string   `json:"seq"`
    Result     int              `json:"result"`
    Comment    string           `json:"comment"`
 */
class MessageListResponse extends RetrieveResponse {
    List<MyMessage> messageList;
    int pageNumber;
    int pageSize;
    int total;
    int selfTotal;
    String retrieve;
    String seq;
    int result;
    String comment;

    MessageListResponse({this.retrieve, this.seq, this.result, this.comment});

    @override
    MessageListResponse.fromJson(Map<String, dynamic> json) :
            pageNumber = json['page_number'] as int,
            pageSize = json['page_size'] as int,
            total = json['total'] as int,
            selfTotal = json['self_total'] as int,
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'] {

        messageList = MyMessage.fromJsons(json['msgs']);
    }
}
