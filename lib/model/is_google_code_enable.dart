import 'retrieve.dart';



class RetrieveIsGoogleCodeEnable extends Retrieve {
  final String phone;
  final String phoneCode;
  final String token;
  final IsGoogleCodeEnableRequest data;

  RetrieveIsGoogleCodeEnable({this.data, this.phone, this.phoneCode, this.token})
      : super(retrieve: 'is_google_code_enable');

  Map<String, dynamic> toJson() =>
      {
        'appid': appId,
        'data': data.toJson(),
        'phone': phone,
        'phone_code': phoneCode,
        'retrieve': retrieve,
        'seq': seq,
        'sign': sign??'',
        'sign_type': signType,
        'token': token??''
      };

  String toString() {
    String tt = token??'';

    String str = 'appid=' + appId + '&data=' + data.toString() + '&phone=' + phone + '&phone_code=' + phoneCode +
        '&retrieve=' + retrieve + '&seq=' + seq +
        '&sign_type=' + signType + '&token=' + tt;

    return str;
  }


  @override
  Future<RetrieveResponse> sendRequest(var payload) async {
    RetrieveResponse obj = await super.sendRequest(payload);
    if (obj == null) return null;
    if (obj.result == 0) {
      var resp = IsGoogleCodeEnableResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}


class IsGoogleCodeEnableRequest {
  final String userNo;
  final String phone;
  final String phoneCode;
  final String email;

  IsGoogleCodeEnableRequest({this.userNo, this.phone,this.phoneCode,this.email});

  Map<String, dynamic> toJson() =>
      {
        'user_no': userNo??'',
        'phone': phone??'',
        'phone_code': phoneCode??'',
        'email': email??'',
      };
}


class IsGoogleCodeEnableResponse extends RetrieveResponse {

    String status;
    String retrieve;
    String seq;
    int result;
    String comment;

    IsGoogleCodeEnableResponse({this.retrieve, this.seq, this.result, this.comment,this.status});

    @override
    IsGoogleCodeEnableResponse.fromJson(Map<String, dynamic> json)
        :   status = json['status'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}

