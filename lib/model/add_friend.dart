import 'retrieve.dart';
//

/*
    Appid     string      `json:"appid"`
    Sign      string      `json:"sign"`
    SignType  string      `json:"sign_type"`

    Name      string      `json:"name"`
    UserNo    string      `json:"user_no"`
    Token     string      `json:"token"`

    Retrieve   string     `json:"retrieve"`
    Seq        string     `json:"seq"`
    Data      interface{} `json:"data"`
 */
class RetrieveAddFriend extends Retrieve {
  final String name;
  final String userNo;
  final AddFriendRequest data;

  RetrieveAddFriend({this.data, this.name, this.userNo})
      : super(retrieve: 'add_friend_by_userno');

  Map<String, dynamic> toJson() => {
        'appid': appId,
        'data': data.toJson(),
        'name': name ?? '',
        'retrieve': retrieve,
        'seq': seq,
        'sign': sign,
        'sign_type': signType,
        'token': token ?? '',
        'user_no': userNo,
      };

  String toString() {
    String nn = name ?? '';
    String tt = token ?? '';

    String str = 'appid=' +
        appId +
        '&data=' +
        data.toString() +
        '&name=' +
        nn +
        '&retrieve=' +
        retrieve +
        '&seq=' +
        seq +
        '&sign_type=' +
        signType +
        '&token=' +
        tt +
        '&user_no=' +
        userNo;

    return str;
  }

  @override
  Future<RetrieveResponse> sendRequest(var payload) async {
    RetrieveResponse obj = await super.sendRequest(payload);
    if (obj == null) return null;
    if (obj.result ==null || obj.result == 0) {

      var resp = AddFriendResponse.fromJson(super.respJson);
      return resp;
    }
    return obj;
  }
}

/*
    Name        string `json:"name"`   // custom name
    UserNo      string `json:"user_no"`
    Gender      string `json:"gender"`
    HomeAddress string `home_address`
    WorkAddress string `work_address`
    Email       string `json:"email"`
    Company     string `json:"company"`
 */
class AddFriendRequest {
  final String name;
  final String userNo;
  final String gender;
  final String homeAddress;
  final String workAddress;
  final String email;
  final String company;
  AddFriendRequest(
      {this.name,
      this.userNo,
      this.gender,
      this.homeAddress,
      this.workAddress,
      this.email,
      this.company});

  Map<String, dynamic> toJson() => {
        'company': company ?? '',
        'email': email ?? '',
        'gender': gender ?? '',
        'home_address': homeAddress ?? '',
        'name': name ?? '',
        'user_no': userNo,
        'work_address': workAddress ?? '',
      };

  String toString() {
    String cc = company ?? '';
    String ee = email ?? '';
    String gg = gender ?? '';
    String hh = homeAddress ?? '';
    String nn = name ?? '';
    String ww = workAddress ?? '';
    String str = 'map[company:' +
        cc +
        ' email:' +
        ee +
        ' gender:' +
        gg +
        ' home_address:' +
        hh +
        ' name:' +
        nn +
        ' user_no:' +
        userNo +
        ' work_address:' +
        ww +
        ']';

    return str;
  }
}

/**
 * Appid     string      `json:"appid"`
	Sign      string      `json:"sign"`
	SignType  string      `json:"sign_type"`
	Name      string      `json:"name"`
	Phone     string      `json:"phone"`
	PhoneCode string      `json:"phone_code"`
	Token     string      `json:"token"`
	Retrieve   string   `json:"retrieve"`
	Seq        string   `json:"seq"`
	Data      interface{} `json:"data"`
 */
class RetrieveAddFriendByPhone extends Retrieve {
  final String name;
  final AddFriendByPhoneRequest data;

  RetrieveAddFriendByPhone(
      {this.data, this.name})
      : super(retrieve: 'add_friend');

  Map<String, dynamic> toJson() => {
        'appid': appId,
        'data': data.toJson(),
        'name': name ?? '',
        "phone": phone,
        "phone_code": phoneCode,
        'retrieve': retrieve,
        'seq': seq,
        'sign': sign,
        'sign_type': signType,
        'token': token ?? ''
      };

  String toString() {
    String nn = name ?? '';
    String tt = token ?? '';

    String str = 'appid=' +
        appId +
        '&data=' +
        data.toString() +
        '&name=' +
        nn +
        '&phone=' +
        phone +
        '&phone_code=' +
        phoneCode +
        '&retrieve=' +
        retrieve +
        '&seq=' +
        seq +
        '&sign_type=' +
        signType +
        '&token=' +
        tt;

    return str;
  }

  @override
  Future<RetrieveResponse> sendRequest(var payload) async {
    RetrieveResponse obj = await super.sendRequest(payload);
    if (obj == null) return null;

    if (obj.result == null || obj.result == 0) {
      var resp = AddFriendResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}

/*
   Name        string `json:"name"`   // custom name
	Phone       string `json:"phone"`
	PhoneCode   string `json:"phone_code"`
	Gender      string `json:"gender"`
	HomeAddress string `home_address`
	WorkAddress string `work_address`
	Email       string `json:"email"`
	Company     string `json:"company"`

 */
class AddFriendByPhoneRequest {
  final String name;
  final String phoneCode;
  final String phone;
  final String gender;
  final String homeAddress;
  final String workAddress;
  final String email;
  final String company;
  AddFriendByPhoneRequest(
      {this.name,
      this.gender,
      this.phone,
      this.phoneCode,
      this.homeAddress,
      this.workAddress,
      this.email,
      this.company});

  Map<String, dynamic> toJson() => {
        'company': company ?? '',
        'email': email ?? '',
        'gender': gender ?? '',
        'home_address': homeAddress ?? '',
        'name': name ?? '',
        'phone': phone,
        'phone_code': phoneCode,
        'work_address': workAddress ?? '',
      };

  String toString() {
    String cc = company ?? '';
    String ee = email ?? '';
    String gg = gender ?? '';
    String hh = homeAddress ?? '';
    String nn = name ?? '';
    String ww = workAddress ?? '';
    String str = 'map[company:' +
        cc +
        ' email:' +
        ee +
        ' gender:' +
        gg +
        ' home_address:' +
        hh +
        ' name:' +
        nn +
        ' phone:' +
        phone +
        ' phone_code:' +
        phoneCode +
        ' work_address:' +
        ww +
        ']';
    return str;
  }
}

/*
    Name        string `json:"name"`
    UserNo      string `json:"user_no"`
    Phone       string `json:"phone"`
	  PhoneCode   string `json:"phone_code"`
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
class AddFriendResponse extends RetrieveResponse {
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
  String phoneCode;
  String phone;

  AddFriendResponse(
      {this.name,
      this.userNo,
      this.comment,
      this.phoneCode,
      this.phone,
      this.gender,
      this.homeAddress,
      this.workAddress,
      this.email,
      this.company,
      this.logoId,
      this.retrieve,
      this.seq,
      this.result});

  @override
  AddFriendResponse.fromJson(Map<String, dynamic> json)
      : retrieve = json['retrieve'],
        seq = json['seq'],
        result = json['result'] as int,
        comment = json['comment'] {
    name = json['name'];
    userNo = json['user_no'];
    phoneCode = json['phone_code'];
    phone = json['phone'];
    gender = json['gender'];
    homeAddress = json['home_address'];
    workAddress = json['work_address'];
    email = json['email'];
    company = json['company'];
    logoId = json['logoid'];
  }
}
