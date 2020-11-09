import 'retrieve.dart';



class RetrieveGetUpload extends Retrieve {
  final String name;

  final GetUploadRequest data;

  RetrieveGetUpload({this.data, this.name})
      : super(retrieve: 'get_upload');

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
    if (obj.result == null || obj.result == 0) {

      var resp = GetUploadResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}

/*
	Fileid string `json:"fileid"`
 */
class GetUploadRequest {
  final String fileId;

  GetUploadRequest({this.fileId});

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
	Key  string `json:"key"`
	Body string `json:"body"`
	Retrieve   string   `json:"retrieve"`
	Seq        string   `json:"seq"`
	Result  int    `json:"result"`
	Comment string `json:"comment"`
 */
class GetUploadResponse extends RetrieveResponse {
  String key;
  String body;
  String retrieve;
  String seq;
  int result;
  String comment;

  GetUploadResponse({this.key, this.body, this.retrieve, this.seq, this.result, this.comment});

  @override
  GetUploadResponse.fromJson(Map<String, dynamic> json)
      :   key = json['key'],
        body = json['body'],
        retrieve = json['retrieve'],
        seq = json['seq'],
        result = json['result'] as int,
        comment = json['comment'];
}
