import 'myfriend.dart';
import 'retrieve.dart';

/*
    Appid     string      `json:"appid"`
    Sign      string      `json:"sign"`
    SignType  string      `json:"sign_type"`
    Name      string      `json:"name"`
    PhoneCode string      `json:"phone_code"`
    Phone     string      `json:"phone"`
    UserNo     string      `json:"user_no"`
    Token     string      `json:"token"`
    Retrieve   string   `json:"retrieve"`
    Seq        string   `json:"seq"`
    Data      interface{} `json:"data"`
 */
class RetrieveFriendList extends Retrieve {
    String name;
    String userNo;

    RetrieveFriendList({this.name,this.userNo})
        : super(retrieve: 'friend_list_by_userno');

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
            // 'user_no': userNo,
        };

    String toString() {
        String nn = name??'';

        String str = 'appid=' + appId + '&name=' + nn + '&phone=' + phone + '&phone_code=' + phoneCode +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + token;

        return str;
    }

    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;

        if (obj.result == null || obj.result == 0) {

            var resp = FriendListResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
    FriendList []*iproto.Friend `json:"friend_list"`
    Retrieve   string   `json:"retrieve"`
    Seq        string   `json:"seq"`
    Result     int              `json:"result"`
    Comment    string           `json:"comment"`
 */
class FriendListResponse extends RetrieveResponse {
    List<MyFriend> friendList;
    List<MyFriend> recentlyFriends;
    String retrieve;
    String seq;
    int result;
    String comment;

    FriendListResponse({this.retrieve, this.seq, this.result, this.comment});

    @override
    FriendListResponse.fromJson(Map<String, dynamic> json)
        :retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'] {

        friendList = MyFriend.fromJsons(json['friend_list']);
        recentlyFriends = MyFriend.fromJsons(json['recently_friends']);
    }
}
