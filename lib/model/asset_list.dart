import './signin.dart';
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
class RetrieveAssetsList extends Retrieve {
    String name;


    RetrieveAssetsList({this.name})
        : super(retrieve: 'assets_list');

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

        var resp = AssetsListResponse.fromJson(super.respJson);
        return resp;
    }
}

/*
Assets  []*iproto.UserAssets `json:"assets"`
	Retrieve   string   `json:"retrieve"`
	Seq        string   `json:"seq"`
	Result  int                  `json:"result"`
	Comment string               `json:"comment"`
 */
class AssetsListResponse extends RetrieveResponse {
    List<UserAsset> assetsList;
    String retrieve;
    String seq;
    int result;
    String comment;

    AssetsListResponse({this.retrieve, this.seq, this.result, this.comment});

    @override
    AssetsListResponse.fromJson(Map<String, dynamic> json)
        :retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'] {

        assetsList = UserAsset.fromJsons(json['assets']);
    }
}
