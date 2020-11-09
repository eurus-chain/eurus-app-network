import 'retrieve.dart';



class RetrieveGetGoogleCode extends Retrieve {
  final String name;

  final GetGoogleCodeRequest data;

  RetrieveGetGoogleCode({this.data, this.name})
      : super(retrieve: 'get_google_code');

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

      var resp = GetGoogleCodeResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}

/*
	QrCode   string `json:"qr_code"`
	Secret   string `json:"secret"`
	Retrieve string `json:"retrieve"`
	Seq      string `json:"seq"`
	Result   int    `json:"result"`
	Comment  string `json:"comment"`
 */
class GetGoogleCodeResponse extends RetrieveResponse {
  String qrCode;
  String secret;
  String retrieve;
  String seq;
  int result;
  String comment;

  GetGoogleCodeResponse({this.qrCode,this.secret,
    this.retrieve, this.seq, this.result, this.comment});

  @override
  GetGoogleCodeResponse.fromJson(Map<String, dynamic> json) :
        qrCode = json['qr_code'],
        secret = json['secret'],
        retrieve = json['retrieve'],
        seq = json['seq'],
        result = json['result'] as int,
        comment = json['comment'];
}

/*
UserNo string `json:"sms_code"`
*/
class GetGoogleCodeRequest {
  final String smsCode;

  GetGoogleCodeRequest({this.smsCode});

  Map<String, dynamic> toJson() =>
      {
        'sms_code': smsCode??"",
      };

  String toString() {
    String str = 'map[sms_code:' + smsCode + ']';

    return str;
  }
}

