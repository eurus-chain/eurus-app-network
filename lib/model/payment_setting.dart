import 'retrieve.dart';



class RetrievePaymentSetting extends Retrieve {
  final PaymentSettingRequest data;

  RetrievePaymentSetting({this.data})
      : super(retrieve: 'payment_setting');

  Map<String, dynamic> toJson() =>
      {
        'appid': appId,
        'data': data.toJson(),
        'retrieve': retrieve,
        'seq': seq,
        'sign': sign,
        'sign_type': signType,
        'token': token??'',
      };

  String toString() {
    String tt = token??'';

    String str = 'appid=' + appId + '&data=' + data.toString() +
        '&retrieve=' + retrieve + '&seq=' + seq +
        '&sign_type=' + signType + '&token=' + tt;

    return str;
  }

  @override
  Future<RetrieveResponse> sendRequest(var payload) async {
    RetrieveResponse obj = await super.sendRequest(payload);
    if (obj == null) return null;
    if (obj.result == 0) {

      var resp = PaymentSettingResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}


class PaymentSettingResponse extends RetrieveResponse {
  String paymentSetting;
  String retrieve;
  String seq;
  int result;
  String comment;

  PaymentSettingResponse({this.retrieve, this.seq, this.result, this.comment});

  @override
  PaymentSettingResponse.fromJson(Map<String, dynamic> json)
      :   retrieve = json['retrieve'],
        paymentSetting = json['payment_setting'],
        seq = json['seq'],
        result = json['result'] as int,
        comment = json['comment'];
}




class PaymentSettingRequest {
  final String paymentSetting;

  PaymentSettingRequest({this.paymentSetting});

  Map<String, dynamic> toJson() =>
      {
        'payment_setting': paymentSetting,
      };

  String toString() {
    String str = 'map[payment_setting:' + paymentSetting + ']';

    return str;
  }
}