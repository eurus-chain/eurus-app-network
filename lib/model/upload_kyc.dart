import 'retrieve.dart';



class RetrieveUploadKyc extends Retrieve {
    final String name;

    final UploadKycRequest data;

    RetrieveUploadKyc({this.data, this.name})
        : super(retrieve: 'upload');

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
            var resp = UploadKycResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
	Key      string `json:"key"`
	Body       string `json:"body"`
	Format     string `json:"format"`
	FileName   string `json:"file_name"`

	// key:
        "TYPE_KYC_UPLOAD_ID",
        "TYPE_KYC_UPLOAD_SELFIE",
        "TYPE_KYC_UPLOAD_ADDRESS",
 */
class UploadKycRequest {
    static const String typeId = 'TYPE_KYC_UPLOAD_ID';
    static const String typeSelfie = 'TYPE_KYC_UPLOAD_SELFIE';
    static const String typeAddress = 'TYPE_KYC_UPLOAD_ADDRESS';
    final String key;
    final String body;
    final String format;
    final String fileName;

    UploadKycRequest({this.key, this.body, this.format, this.fileName});

    Map<String, dynamic> toJson() =>
        {
            'body': body??'',
            'file_name': fileName??'',
            'format': format??'',
            'key': key,
        };

    String toString() {
        String bb = body??'';
        String fm = format??'';
        String fn = fileName??'';

        String str = 'map[body:' + bb + ' file_name:' + fn + ' format:' + fm +
            ' key:' + key + ']';

        // MyLog.d('UploadKycRequest toString=' + str);
        return str;
    }
}

/*
	FileId     string `json:"fileid"`

	Retrieve       string         `json:"retrieve"`
	Seq            string         `json:"seq"`
	Result         reterr.ErrCode `json:"result"`
	Comment        string         `json:"comment"`
 */
class UploadKycResponse extends RetrieveResponse {
    final String fileId;
    String retrieve;
    String seq;
    int result;
    String comment;

    UploadKycResponse({this.fileId,
        this.retrieve, this.seq, this.result, this.comment});

    @override
    UploadKycResponse.fromJson(Map<String, dynamic> json)
        :   fileId = json['fileid'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
