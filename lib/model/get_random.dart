import 'retrieve.dart';



class RetrieveGetRandom extends Retrieve {
    final String name;

    RetrieveGetRandom({this.name})
        : super(retrieve: 'kyc_random_number');

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

            var resp = GetRandomResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
	RandomNumber string `json:"random_number"`
    Retrieve    string `json:"retrieve"`
    Seq         string `json:"seq"`
    Result      int    `json:"result"`
    Comment     string `json:"comment"`
 */
class GetRandomResponse extends RetrieveResponse {
    String randomNumber;
    String retrieve;
    String seq;
    int result;
    String comment;

    GetRandomResponse({this.randomNumber,
        this.retrieve, this.seq, this.result, this.comment});

    @override
    GetRandomResponse.fromJson(Map<String, dynamic> json) :
            randomNumber = json['random_number'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
