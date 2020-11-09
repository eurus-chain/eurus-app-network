import '../common.dart';
import 'retrieve.dart';


class RetrieveResetPassword extends Retrieve {
    final ResetPasswordRequest data;

    RetrieveResetPassword({this.data})
        : super(retrieve: 'reset_password');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType
        };

    String toString() {
        String str = 'appid=' + appId + '&data=' + data.toString() +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType;

        return str;
    }

    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;
        if (obj.result == 0) {

            var resp = ResetPasswordResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
    Appid       string `json:"appid"`
    Name        string `json:"name"`
    NewPassword string `json:"new_password"`
   */
class ResetPasswordRequest {
    final String appId = common.appId;
    final String name;
    final String newPassword;

    ResetPasswordRequest({this.name, this.newPassword});

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'name': name??'',
            'new_password': newPassword
        };

    String toString() {
        String nn = name??'';

        String str = 'map[appid:' + appId + ' name:' + nn + ' new_password:' + newPassword + ']';

        return str;
    }
}

/*
    Appid       string         `json:"appid"`
    Name        string         `json:"name"`
    NewPassword string         `json:"new_password"`
    Retrieve    string         `json:"retrieve"`
    Seq         string         `json:"seq"`
    Result      reterr.ErrCode `json:"result"`
    Comment     string         `json:"comment"`
 */
class ResetPasswordResponse extends RetrieveResponse {
    String appId;
    String name;
    String newPassword;
    String retrieve;
    String seq;
    int result;
    String comment;

    ResetPasswordResponse({this.appId, this.name, this.newPassword,
        this.retrieve, this.seq, this.result, this.comment});

    @override
    ResetPasswordResponse.fromJson(Map<String, dynamic> json)
        : appId = json['appid'],
            name = json['name'],
            newPassword = json['new_password'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
