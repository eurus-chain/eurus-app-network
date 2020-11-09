import 'retrieve.dart';



class RetrieveGetMsgsNum extends Retrieve {
  final String name;


  RetrieveGetMsgsNum({this.name})
      : super(retrieve: 'msgs_num');

  Map<String, dynamic> toJson() =>
      {
        'appid': appId,
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

    String str = 'appid=' + appId +
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

      var resp = GetMsgsNumResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}

/*
	  TotalReadNum uint64 `json:"total_read_num"`
    DeletedNum uint64 `json:"deleted_num"`
    Retrieve string `json:"retrieve"`
    Seq string `json:"seq"`
    Result int `json:"result"`
    Comment string `json:"comment"`
 */
class GetMsgsNumResponse extends RetrieveResponse {
  int totalReadNum;
  int deleteNum;
  String retrieve;
  String seq;
  int result;
  String comment;

  GetMsgsNumResponse({this.totalReadNum,this.deleteNum,
    this.retrieve, this.seq, this.result, this.comment});

  @override
  GetMsgsNumResponse.fromJson(Map<String, dynamic> json) :
        totalReadNum = json['total_read_num'],
        deleteNum = json['deleted_num'],
        retrieve = json['retrieve'],
        seq = json['seq'],
        result = json['result'] as int,
        comment = json['comment'];
}
