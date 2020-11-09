import 'retrieve.dart';



class RetrieveCheckPinCode extends Retrieve {
    final String name;


    RetrieveCheckPinCode({this.name})
        : super(retrieve: 'is_pin_code_set');

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
        if (obj.result == null || obj.result == 0) {
            var resp = CheckPinCodeResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

class CheckPinCodeResponse extends RetrieveResponse {
    final bool isSet;
    String retrieve;
    String seq;
    int result;
    String comment;

    CheckPinCodeResponse({this.isSet,
        this.retrieve, this.seq, this.result, this.comment});

    @override
    CheckPinCodeResponse.fromJson(Map<String, dynamic> json)
        :   isSet = json['is_set'] as bool,
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
