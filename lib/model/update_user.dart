import 'retrieve.dart';



class RetrieveUpdateUser extends Retrieve {
    final String name;

    final UpdateUserRequest data;

    RetrieveUpdateUser({this.data, this.name})
        : super(retrieve: 'update_user_profile');

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

        // MyLog.d('RetrieveUpdateUser toString=' + str);
        return str;
    }
}

/*
	NickName      string `json:"nick_name"`
	Gender        string `json:"gender"`
	AreaDistricts string `json:"area_districts"`
	Birthday      string `json:"birthday"`
 */
class UpdateUserRequest {
    final String nickName;
    final String gender;
    final String areaDistricts;
    final String birthday;

    UpdateUserRequest({this.nickName, this.gender, this.areaDistricts, this.birthday});

    Map<String, dynamic> toJson() =>
        {
            'area_districts': areaDistricts??'0',
            'birthday': birthday??'0',
            'gender': gender??'0',
            'nick_name': nickName,
        };

    String toString() {
        String aa = areaDistricts??'0';
        String bb = birthday??'0';
        String gg = gender??'0';
        String str = 'map[area_districts:' + aa +
            ' birthday:' + bb + ' gender:' + gg +
            ' nick_name:' + nickName + ']';

        return str;
    }
}
