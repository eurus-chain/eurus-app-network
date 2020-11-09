import 'retrieve.dart';



class RetrieveAddressQuery extends Retrieve {
  final String name;

  final AddressQueryRequest data;

  RetrieveAddressQuery({this.data, this.name,})
      : super(retrieve: 'address_query');

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

    return str;
  }


  @override
  Future<RetrieveResponse> sendRequest(var payload) async {
    RetrieveResponse obj = await super.sendRequest(payload);
    if (obj == null) return null;
    if (obj.result == 0) {
      var resp = AddressQueryResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}


class AddressQueryResponse extends RetrieveResponse {
    String address;
    String phone;
    String phoneCode;
    String status;
    String merchantId;
    String userNo;
    String merchantName;
    String nickname;
    String logoId;
    String retrieve;
    String type;
    String seq;
    int result;
    String comment;


    AddressQueryResponse({this.retrieve, this.seq, this.result, this.comment});

    @override
    AddressQueryResponse.fromJson(Map<String, dynamic> json)
        :   nickname = json['nick_name'],
          logoId = json['logoid'],
          merchantName = json['merchant_name'] == "" ? null : json['merchant_name'],
          userNo = json['user_no'],
          type = json['type'],
          address = json['retrieve'],
          phone = json['phone'],
          phoneCode = json['phoneCode'],
          status = json['status'],
          merchantId = json['merchantId'],
          retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}




class AddressQueryRequest {
  final String address;

  AddressQueryRequest({this.address, });

  Map<String, dynamic> toJson() =>
      {
        'address': address,
      };

  String toString() {
    String str = 'map[address:' + address + ']';

    return str;
  }
}