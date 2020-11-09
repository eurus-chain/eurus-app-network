import 'retrieve.dart';



class RetrieveChangePassword extends Retrieve {
  final String name;
  final ChangePasswordRequest data;

  RetrieveChangePassword({this.data, this.name})
      : super(retrieve: 'update_password');

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
      var resp = ChangePasswordResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}


class ChangePasswordResponse extends RetrieveResponse {

    String retrieve;
    String seq;
    int result;
    String comment;

    ChangePasswordResponse({this.retrieve, this.seq, this.result, this.comment});

    @override
    ChangePasswordResponse.fromJson(Map<String, dynamic> json)
        :   retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}




class ChangePasswordRequest {
  final String oldPassword;
  final String newPassword;

  ChangePasswordRequest({this.oldPassword, this.newPassword});

  Map<String, dynamic> toJson() =>
      {
        'old_password': oldPassword,
        'new_password': newPassword,
      };

  String toString() {
    String str = 'map[new_password:' + newPassword + ' old_password:' + oldPassword + ']';

    return str;
  }
}