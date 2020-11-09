import 'retrieve.dart';



class RetrieveCheckSms extends Retrieve {
  final String name;
  final String phone;
  final String phoneCode;
  final String token;
  final CheckSmsRequest data;

  RetrieveCheckSms({this.data, this.name, this.phone, this.phoneCode, this.token})
      : super(retrieve: 'check_sms');

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
      };

  String toString() {
    String nn = name??'';
    String tt = token??'';

    String str = 'appid=' + appId + '&data=' + data.toString() +
        '&name=' + nn + '&phone=' + phone + '&phone_code=' + phoneCode +
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

class CheckSmsRequest {
  final String phone;
  final String phoneCode;
  final String smsCode;
  final int usage;

  CheckSmsRequest({this.phone, this.phoneCode,this.usage,this.smsCode});

  Map<String, dynamic> toJson() =>
      {
        'phone': phone,
        'phone_code': phoneCode,
        'sms_code': smsCode,
        'usage': usage,
      };

  String toString() {
    String str = 'map[phone:' + phone + ' phone_code:' + phoneCode + ' sms_code:' + smsCode + ' usage:' + usage.toString() + ']';

    return str;
  }
}