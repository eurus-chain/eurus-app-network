import 'retrieve.dart';



class RetrieveGenAddress extends Retrieve {
    final String name;

    final GenAddressRequest data;

    RetrieveGenAddress({this.data, this.name})
        : super(retrieve: 'assets_gen');

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

            var resp = GenAddressResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
    AssetName        string `json:"asset_name"` `
 */
class GenAddressRequest {
    final String assetName;

    GenAddressRequest({this.assetName});

    Map<String, dynamic> toJson() =>
        {
            'asset_name': assetName,
        };

    String toString() {
        String str = 'map[asset_name:' + assetName + ']';

        return str;
    }
}

/*
	AssetName string `json:"asset_name"`
	Address   string `json:"address"`
    Retrieve    string `json:"retrieve"`
    Seq         string `json:"seq"`
    Result      int    `json:"result"`
    Comment     string `json:"comment"`
 */
class GenAddressResponse extends RetrieveResponse {
    String assetName;
    String address;
    String retrieve;
    String seq;
    int result;
    String comment;

    GenAddressResponse({this.assetName, this.address,
        this.retrieve, this.seq, this.result, this.comment});

    @override
    GenAddressResponse.fromJson(Map<String, dynamic> json) :
            assetName = json['asset_name'],
            address = json['address'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
