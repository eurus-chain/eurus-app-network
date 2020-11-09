import 'retrieve.dart';



class RetrieveCheckPinCode extends Retrieve {
  final String name;

  final CheckPinCodeRequest data;

  RetrieveCheckPinCode({this.data, this.name})
      : super(retrieve: 'check_pin_code');

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
      var resp = CheckPinCodeResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}


class CheckPinCodeResponse extends RetrieveResponse {

  String retrieve;
  String seq;
  int result;
  String comment;

  CheckPinCodeResponse({this.retrieve, this.seq, this.result, this.comment});

  @override
  CheckPinCodeResponse.fromJson(Map<String, dynamic> json)
      :   retrieve = json['retrieve'],
        seq = json['seq'],
        result = json['result'] as int,
        comment = json['comment'];
}




class CheckPinCodeRequest {
  final String pinCode;

  CheckPinCodeRequest({this.pinCode});

  Map<String, dynamic> toJson() =>
      {
        'pin_code': pinCode,
      };

  String toString() {
    String str = 'map[pin_code:' + pinCode + ']';

    return str;
  }
}