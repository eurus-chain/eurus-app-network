import 'retrieve.dart';



class RetrieveBindGoogleCode extends Retrieve {
  final String name;

  final BindGoogleCodeRequest data;

  RetrieveBindGoogleCode({this.data, this.name})
      : super(retrieve: 'bind_google_code');

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

      var resp = BindGoogleCodeResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}


class BindGoogleCodeResponse extends RetrieveResponse {
  String retrieve;
  String seq;
  int result;
  String comment;

  BindGoogleCodeResponse({
    this.retrieve, this.seq, this.result, this.comment});

  @override
  BindGoogleCodeResponse.fromJson(Map<String, dynamic> json) :
        retrieve = json['retrieve'],
        seq = json['seq'],
        result = json['result'] as int,
        comment = json['comment'];
}

/*
  SmsCode    string `json:"sms_code"`
	Secret     string `json:"secret"` //if secret is empty, will clear the binding
	GoogleCode string `json:"google_code"` //add this code to verify
*/
class BindGoogleCodeRequest {
  final String smsCode;
  final String secret;
  final String googleCode;

  BindGoogleCodeRequest({this.smsCode, this.secret, this.googleCode});

  Map<String, dynamic> toJson() =>
      {
        'sms_code': smsCode,
        'secret': secret,
        'google_code': googleCode
      };

  String toString() {
    String str = 'map[google_code:' + googleCode + ' secret:' + secret + ' sms_code:' + smsCode + ']';

    return str;
  }
}

