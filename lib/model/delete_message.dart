import 'retrieve.dart';

import 'dart:convert' as convert;


class RetrieveDeleteMessage extends Retrieve {

  final DeleteMessageRequest data;

  RetrieveDeleteMessage({this.data})
      : super(retrieve: 'msgs_confirm');

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
class DeleteMessageRequest {
  final int systemVid;
  final int personalVid;
  final Map    versions;
  final int selfTotal;
  final int delete;

  DeleteMessageRequest({this.systemVid,this.personalVid,this.versions,this.selfTotal,this.delete});

  Map<String, dynamic> toJson() =>
      {
        'system_vid': systemVid??"",
        'personal_vid': personalVid??"",
        'self_total': selfTotal??"",
        'versions': versions??{},
        'delete': delete,
      };

  String toString() {
//    String str = 'map[delete:' + delete + ']';

    String str = 'map[delete:' + delete.toString() + ' personal_vid:' + personalVid.toString() + ' self_total:' + selfTotal.toString() + ' system_vid:' + systemVid.toString() + ' versions:' + 'map[]' + ']';

    return str;
  }
}

