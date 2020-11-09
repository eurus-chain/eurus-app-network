

import 'retrieve.dart';
import 'signin.dart';

/*
    Appid     string      `json:"appid"`
    Sign      string      `json:"sign"`
    SignType  string      `json:"sign_type"`
    Name      string      `json:"name"`
    Phone     string      `json:"phone"`
    PhoneCode string      `json:"phone_code"`
    Token     string      `json:"token"`
    Retrieve  string      `json:"retrieve"`
    Data      interface{} `json:"data"`
    Seq       string      `json:"seq"`
 */
class RetrieveSignInToken extends Retrieve {
    String name;

    RetrieveSignInToken({this.name})
        : super(retrieve: 'login_by_token');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'name' : name??'',
            'phone': phone,
            'phone_code': phoneCode,
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType,
            'token': token,
        };

    String toString() {
        String nn = name??'';

        String str = 'appid=' + appId + '&name=' + nn +
            '&phone=' + phone + '&phone_code=' + phoneCode +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + token;

        return str;
    }

    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        var obj = await super.sendRequest(payload);
        if (obj == null) return null;

        // MyLog.d('RetrieveSignInToken resp:' + super.respJson.toString());
        if (obj.result != null && obj.result == 0) {
            // MyLog.d('RetrieveSignInToken.sendRequest 1');
            var resp = SignInResponse.fromJson(super.respJson);
            return resp;
        }

        // MyLog.d('RetrieveSignInToken.sendRequest 2');
        return obj;
    }
}
