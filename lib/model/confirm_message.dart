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
class RetrieveConfirmMessage extends Retrieve {
    String name;

    final ConfirmMessageRequest data;

    RetrieveConfirmMessage({this.data, this.name})
        : super(retrieve: 'msgs_confirm');

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

        return obj;
    }
}

/*
	SystemVid   uint64            `json:"system_vid"`
	PersonalVid uint64            `json:"personal_vid"`
	Versions    map[string]uint64 `json:"versions"`   //read channel use this. key:channelid,value:vid
	SelfTotal   uint64            `json:"self_total"` //read paging use this.
 */
class ConfirmMessageRequest {
    final int systemVid;
    final int personalVid;
    // Map versions;
    final int selfTotal;

    ConfirmMessageRequest({this.systemVid, this.personalVid, this.selfTotal}) {
        // versions = new Map();
    }

    Map<String, dynamic> toJson() =>
        {
            'personal_vid': personalVid??0,
            'self_total': selfTotal??0,
            'system_vid': systemVid??0,
            // 'versions': {},
        };

    String toString() {
        String str = 'map[personal_vid:' + (personalVid==null?'0':personalVid.toString()) +
            ' self_total:' + (selfTotal==null?'0':selfTotal.toString()) +
            ' system_vid:' +  (systemVid==null?'0':systemVid.toString()) +
            // ' versions:' + (versions.toString()??'') +
            ']';

        return str;
    }
}
