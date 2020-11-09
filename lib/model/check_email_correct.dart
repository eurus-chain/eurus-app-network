import 'retrieve.dart';



class RetrieveCheckEmail extends Retrieve {
  final String name;
  final String token;
  final String email;
  final CheckEmailRequest data;

  RetrieveCheckEmail({this.data, this.name, this.token,this.email})
      : super(retrieve: 'check_email_code');

  Map<String, dynamic> toJson() =>
      {
        'appid': appId,
        'data': data.toJson(),
        'name': name??'',
        'email':email,
        'phone': phone ?? '',
        'phone_code': phoneCode?? '',
        'retrieve': retrieve,
        'seq': seq,
        'sign': sign,
        'sign_type': signType,
      };

  String toString() {
    String nn = name??'';
    String str = 'appid=' + appId + '&data=' + data.toString() +
        '&email=' + email +'&name=' + nn +
        '&retrieve=' + retrieve + '&seq=' + seq +
        '&sign_type=' + signType;

    return str;
  }


  @override
  Future<RetrieveResponse> sendRequest(var payload) async {
    RetrieveResponse obj = await super.sendRequest(payload);
    if (obj == null) return null;
    if (obj.result == 0) {

      var resp = RetrieveResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}


class CheckEmailRequest {
  final String emailCode;
  final int usage;

  CheckEmailRequest({this.emailCode,this.usage});

  Map<String, dynamic> toJson() =>
      {
        'email_code': emailCode,
        'usage': usage,
      };

  String toString() {
    String str = 'map[email_code:' + emailCode  + ' usage:' + usage.toString() + ']';

    return str;
  }
}