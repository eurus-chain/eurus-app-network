import 'retrieve.dart';



class RetrieveUpdateEnable extends Retrieve {
  final String name;

  final UpdateEnableRequest data;

  RetrieveUpdateEnable({this.data, this.name})
      : super(retrieve: 'update_enable');

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
	BioEnable string `json:"bio_enable"`
	SmsEnable string `json:"sms_enable"`
	SmsCode   string `json:"sms_code"`
 */
class UpdateEnableRequest {
  final String bioEnable;
  final String smsEnable;
  final String smsCode;

  UpdateEnableRequest({this.bioEnable, this.smsEnable, this.smsCode});

  Map<String, dynamic> toJson() =>
      {
        'bio_enable': bioEnable??'',
        'sms_enable': smsEnable??'',
        'sms_code': smsCode??'',
      };

  String toString() {
    String bb = bioEnable??'';
    String ssc = smsCode??'';
    String sse = smsEnable??'';
    String str = 'map[bio_enable:' + bb +
        ' sms_code:' + ssc + ' sms_enable:' + sse + ']';

    return str;
  }
}
