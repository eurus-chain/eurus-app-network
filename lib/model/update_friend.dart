import 'retrieve.dart';



class RetrieveUpdateFriend extends Retrieve {
    final String name;

    final UpdateFriendRequest data;

    RetrieveUpdateFriend({this.data, this.name})
        : super(retrieve: 'update_friend_profile');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
            'name': name??'',
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType,
            'token': token??'',
        };

    String toString() {
        String nn = name??'';
        String tt = token??'';

        String str = 'appid=' + appId + '&data=' + data.toString() +
            '&name=' + nn + '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + tt;

        return str;
    }

    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;
        if (obj.result == 0) {

            var resp = UpdateFriendResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
    Name        string `json:"name"`   // custom name
    Phone       string `json:"phone"`
    PhoneCode   string `json:"phone_code"`
    UserNo      string `json:"user_no"`
    Gender      string `json:"gender"`
    HomeAddress string `home_address`
    WorkAddress string `work_address`
    Email       string `json:"email"`
    Company     string `json:"company"`
 */
class UpdateFriendRequest {
    final String name;
    final String phone;
    final String phoneCode;
    final String gender;
    final String homeAddress;
    final String workAddress;
    final String email;
    final String company;
    final String remark;

    UpdateFriendRequest({this.name, this.phone, this.phoneCode, this.gender,
        this.homeAddress, this.workAddress, this.email, this.company, this.remark});

    Map<String, dynamic> toJson() =>
        {
            'company': company??'',
            'email': email??'',
            'gender': gender??'',
            'home_address': homeAddress??'',
            'name': name??'',
            'phone': phone??'',
            'phone_code': phoneCode??'',
             'remark': remark??'',
            'work_address': workAddress??''
        };

    String toString() {
        String cc = company??'';
        String ee = email??'';
        String gg = gender??'';
        String hh = homeAddress??'';
        String nn = name??'';
        String ww = workAddress??'';
        String pc = phoneCode??'';
        String pn = phone??'';
        String rm = remark??'';

        String str = 'map[company:' + cc + ' email:' + ee +
            ' gender:' + gg + ' home_address:' + hh +
            ' name:' + nn + ' phone:' + pn + ' phone_code:' + pc + ' remark:'+rm+
            ' work_address:' + ww + ']';

        return str;
    }
}

/*
    Name        string `json:"name"`
    UserNo       string `json:"user_no"`
    Gender      string `json:"gender"`
    HomeAddress string `home_address`
    WorkAddress string `work_address`
    Email       string `json:"email"`
    Company     string `json:"company"`
    Logoid      string `json:"logoid"`
    Retrieve    string `json:"retrieve"`
    Seq         string `json:"seq"`
    Result      int    `json:"result"`
    Comment     string `json:"comment"`
 */
class UpdateFriendResponse extends RetrieveResponse {
    String name;
    String userNo;
    String gender;
    String homeAddress;
    String workAddress;
    String email;
    String company;
    String logoId;
    String retrieve;
    String seq;
    int result;
    String comment;
    String remark;

    UpdateFriendResponse({this.name, this.userNo, this.gender,
        this.homeAddress, this.workAddress, this.email, this.company, this.logoId,
        this.retrieve, this.seq, this.result, this.comment, this.remark});

    @override
    UpdateFriendResponse.fromJson(Map<String, dynamic> json)
        :   name = json['name'],
            remark = json['remark'],
            userNo = json['user_no'],
            gender = json['gender'],
            homeAddress = json['home_address'],
            workAddress = json['work_address'],
            email = json['email'],
            company = json['company'],
            logoId = json['logoid'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
