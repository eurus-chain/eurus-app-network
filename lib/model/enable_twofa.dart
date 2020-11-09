import 'retrieve.dart';



class RetrieveEnableTwofa extends Retrieve {
  final String name;

  final EnableTwofRequest data;

  RetrieveEnableTwofa({this.data, this.name})
      : super(retrieve: 'enable_twofa');

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
}

/*
	SmsCode string `json:"sms_code"`
 */
class EnableTwofRequest {
  final String smsCode;

  EnableTwofRequest({this.smsCode});

  Map<String, dynamic> toJson() =>
      {
        'sms_code': smsCode??'',
      };

  String toString() {
    String ssc = smsCode??'';
    String str = 'map[sms_code:' + ssc + ']';

    return str;
  }
}
