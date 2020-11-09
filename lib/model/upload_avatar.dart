import 'retrieve.dart';



class RetrieveUploadAvatar extends Retrieve {
    final String name;

    final UploadAvatarRequest data;

    RetrieveUploadAvatar({this.data, this.name})
        : super(retrieve: 'upload_logo');

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
        if (super.respJson['message'] != null) {
            var resp = UploadAvatarResponse.fromJson(super.respJson);
            resp.result = 999;
            resp.comment = super.respJson['message'];
            return resp;
        }

        var resp = UploadAvatarResponse.fromJson(super.respJson);
        return resp;
    }
}

/*
	Key  string `json:"key"`
	Body string `json:"body"`
 */
class UploadAvatarRequest {
    final String key;
    final String body;

    UploadAvatarRequest({this.key, this.body});

    Map<String, dynamic> toJson() =>
        {
            'key': key,
            'body': body,
        };

    String toString() {
        String str = 'map[body:' + body + ' key:' + key + ']';

        return str;
    }
}

/*
	FileId  string `json:"fileid"`
	Retrieve   string   `json:"retrieve"`
	Seq        string   `json:"seq"`
	Result  int    `json:"result"`
	Comment string `json:"comment"`
 */
class UploadAvatarResponse extends RetrieveResponse {
    String fileId;
    String retrieve;
    String seq;
    int result;
    String comment;

    UploadAvatarResponse({this.fileId, this.retrieve, this.seq, this.result, this.comment});

    @override
    UploadAvatarResponse.fromJson(Map<String, dynamic> json)
        : fileId = json['fileid'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
