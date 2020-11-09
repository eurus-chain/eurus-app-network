

import '../get_avatar.dart';
import '../retrieve.dart';

class RetrieveGetLogo extends Retrieve {

    final GetLogoRequest data;

    RetrieveGetLogo({this.data})
        : super(retrieve: 'get_card_logo');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
            'phone': phone,
            'phone_code': phoneCode,
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType,
            'token': token??''
        };

    String toString() {
        String tt = token??'';

        String str = 'appid=' + appId + '&data=' + data.toString() +
             '&phone=' + phone + '&phone_code=' + phoneCode +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + tt;

        // MyLog.d('RetrieveGetAvatar toString=' + str);
        return str;
    }


    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
         if (obj == null) return null;
         if (obj.result == null || obj.result == 0) {
            // MyLog.d('AddFriendResponse:' + super.respJson.toString());
            var resp = GetAvatarResponse.fromJson(super.respJson);
            return resp;
         }

         return obj;
    }
}

/*
	Fileid string `json:"fileid"`
 */
class GetLogoRequest {
    final String id;

    GetLogoRequest({this.id});

    Map<String, dynamic> toJson() =>
        {
            'Id': id,
        };

    String toString() {
        String str = 'map[Id:' + id + ']';

        return str;
    }
}
