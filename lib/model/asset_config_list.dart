import 'myasset_config.dart';
import 'retrieve.dart';

/*
    Appid     string      `json:"appid"`
    Sign      string      `json:"sign"`
    SignType  string      `json:"sign_type"`
    Name      string      `json:"name"`
    Phone     string      `json:"phone"`
    PhoneCode string      `json:"phone_code"`
    Token     string      `json:"token"`
    Retrieve   string   `json:"retrieve"`
    Seq        string   `json:"seq"`
    Data      interface{} `json:"data"`
 */
class RetrieveAssetConfigList extends Retrieve {
    String name;


    RetrieveAssetConfigList({this.name})
        : super(retrieve: 'assets_config_list');

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
        };

    String toString() {
        String nn = name??'';

        String str = 'appid=' + appId + '&name=' + nn +
            '&phone=' + phone + '&phone_code=' + phoneCode +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + token;

        return str;
    }

    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;

        var resp = AssetConfigResponse.fromJson(super.respJson);
        return resp;
    }
}

/*
	AssetsConfig []*assets_config `json:"assets_config"`
	Retrieve   string   `json:"retrieve"`
	Seq        string   `json:"seq"`
 */
class AssetConfigResponse extends RetrieveResponse {
    List<MyAssetConfig> assetConfigList;
    String retrieve;
    String seq;
    int result;
    String comment;

    AssetConfigResponse({this.retrieve, this.seq, this.result, this.comment});

    @override
    AssetConfigResponse.fromJson(Map<String, dynamic> json)
        :retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'] {

        assetConfigList = MyAssetConfig.fromJsons(json['assets_config']);
    }
}
