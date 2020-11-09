import 'dart:convert';

import '../common.dart';
/*
    Phone                string   `protobuf:"bytes,1,opt,name=phone,proto3" json:"phone,omitempty"`
    PhoneCode            string   `protobuf:"bytes,2,opt,name=phone_code,json=phoneCode,proto3" json:"phone_code,omitempty"`
    UserNo
    Name                 string   `protobuf:"bytes,3,opt,name=name,proto3" json:"name,omitempty"`
    NickName             string   `protobuf:"bytes,4,opt,name=nick_name,json=nickName,proto3" json:"nick_name,omitempty"`
    TagName              string   `protobuf:"bytes,5,opt,name=remark,json=tagName,proto3" json:"remark,omitempty"`
    Company              string   `protobuf:"bytes,6,opt,name=company,proto3" json:"company,omitempty"`
    HomeAddress          string   `protobuf:"bytes,7,opt,name=home_address,json=homeAddress,proto3" json:"home_address,omitempty"`
    WorkAddress          string   `protobuf:"bytes,8,opt,name=work_address,json=workAddress,proto3" json:"work_address,omitempty"`
    Email                string   `protobuf:"bytes,9,opt,name=email,proto3" json:"email,omitempty"`
    Gender               string   `protobuf:"bytes,10,opt,name=gender,proto3" json:"gender,omitempty"`
    Logoid               string   `protobuf:"bytes,11,opt,name=logoid,proto3" json:"logoid,omitempty"`
    User                 string   `protobuf:"bytes,12,opt,name=user,proto3" json:"user,omitempty"`
    Userid               string   `protobuf:"bytes,13,opt,name=userid,proto3" json:"userid,omitempty"`
 */
class MyFriend{
    String phone;
    String phoneCode;
    String userNo;
    String name;
    String nickName;
    String tagName;
    String company;
    String homeAddress;
    String workAddress;
    String email;
    String gender;
    String logoId;
    String user;
    String userId;

    MyFriend({this.phone, this.phoneCode, this.userNo, this.name, this.nickName,
        this.tagName, this.company, this.homeAddress, this.workAddress, this.email,
        this.gender, this.logoId, this.user, this.userId});

    Map<String, dynamic> toJson() =>
        {
            'phone': phone,
            'phone_code' : phoneCode,
            'user_no': userNo,
            'name': name,
            'nick_name': nickName,
            'remark': tagName,
            'company': company,
            'home_address': homeAddress,
            'work_address': workAddress,
            'email': email,
            'gender': gender,
            'logoid': logoId,
            'user': user,
            'userid': userId
        };

    MyFriend.fromJson(Map<String, dynamic> json) :
            phone = json['phone'],
            phoneCode = json['phone_code'],
            userNo = json['user_no'],
            name =  common.getBase64Decode(json['name']),
            nickName = common.getBase64Decode(json['nick_name']),
            tagName = common.getBase64Decode(json['remark']),
            company = json['company'],
            homeAddress = json['home_address'],
            workAddress = json['work_address'],
            email = json['email'],
            gender = json['gender'],
            logoId = json['logoid'],
            user = json['user'],
            userId = json['userid'] {

        try {
            name = json['name'] != null
                ? utf8.decode(base64Decode(json['name']))
                : null;
        } catch(e) {
            name = json['name'];
        }

        try {
            nickName = json['nick_name'] != null ? utf8.decode(
                base64Decode(json['nick_name'])) : null;
        } catch(e) {
            nickName = json['nick_name'];
        }

        try {
            tagName = json['remark'] != null
                ? utf8.decode(base64Decode(json['remark']))
                : null;
        } catch(e) {
            tagName = json['remark'];
        }
    }

    static List<MyFriend> fromJsons(List<dynamic> jsons) {
        // MyLog.d('FriendList.fromJsons');
        if (jsons == null)
            return null;

        List<MyFriend> friends = new List<MyFriend>();
        jsons.forEach((item) {
            MyFriend ua = MyFriend.fromJson(item);
            friends.add(ua);
        });

        return friends;
    }

    static String listToString(List<MyFriend> friends) {
        if (friends == null || friends.length == 0) {
            return '[]';
        }

        String jsonStr = '[';
        friends.forEach((item) {
           var myJson = item.toJson();
           String str = jsonEncode(myJson);
           // MyLog.d('MyFriend.listToString item=' + str);
           jsonStr += str + ',';
        });
        jsonStr = jsonStr.substring(0, jsonStr.length-1);
        jsonStr += ']';
        // MyLog.d('MyFriend.listToString str=' + jsonStr);
        return jsonStr;
    }

    static List<MyFriend> stringToList(String str) {
        if (str == null || str.length == 0)
            return null;
        var myJson = jsonDecode(str);
        // MyLog.d('MyFriend.stringToList str=' + str);
        List<MyFriend> mfs = MyFriend.fromJsons(myJson);
        /*
        mfs.forEach((item) {
            MyLog.d('MyFriend.stringToList item = +' + item.phoneCode + '-' + item.phone);
        });

         */

        return mfs;
    }

}
