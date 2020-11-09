import 'retrieve.dart';



class RetrieveEnableGoogleCode extends Retrieve {
  final String name;

  final EnableGoogleCodeRequest data;

  RetrieveEnableGoogleCode({this.data, this.name})
      : super(retrieve: 'enable_google_code');

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
      var resp = EnableGoogleCodeResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}


class EnableGoogleCodeResponse extends RetrieveResponse {
  String retrieve;
  String seq;
  int result;
  String comment;

  EnableGoogleCodeResponse({
    this.retrieve, this.seq, this.result, this.comment});

  @override
  EnableGoogleCodeResponse.fromJson(Map<String, dynamic> json) :
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
class EnableGoogleCodeRequest {
  final String smsCode;
  final String enable;
  final String googleCode;

  EnableGoogleCodeRequest({this.smsCode, this.enable, this.googleCode});

  Map<String, dynamic> toJson() =>
      {
        'sms_code': smsCode,
        'enable': enable,
        'google_code': googleCode
      };

  String toString() {
    String str = 'map[enable:' + enable + ' google_code:' + googleCode + ' sms_code:' + smsCode + ']';

    return str;
  }
}

