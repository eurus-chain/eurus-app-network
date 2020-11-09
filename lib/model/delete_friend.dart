import 'retrieve.dart';



class RetrieveDeleteFriend extends Retrieve {
  final DeleteFriendRequest data;

  RetrieveDeleteFriend({this.data})
      : super(retrieve: 'delete_friend');

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

    String str = 'appid=' + appId + '&data=' + data.toString() + '&phone=' + phone + '&phone_code=' + phoneCode +
        '&retrieve=' + retrieve + '&seq=' + seq +
        '&sign_type=' + signType + '&token=' + tt;

    return str;
  }
}

/*
	UserNo string `json:"user_no"`
 */
class DeleteFriendRequest {
  final String userNo;

  DeleteFriendRequest({this.userNo});

  Map<String, dynamic> toJson() =>
      {
        'user_no': userNo,
      };

  String toString() {
    String str = 'map[user_no:' + userNo + ']';

    return str;
  }
}
