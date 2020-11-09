
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
class RetrieveFeeConfigList extends Retrieve {

  final FeeConfigRequest data;

  RetrieveFeeConfigList({this.data})
      : super(retrieve: 'fee_config_list');

  Map<String, dynamic> toJson() => {
        'appid': appId,
        'data': data.toJson(),
        'phone': phone,
        'phone_code': phoneCode,
        'retrieve': retrieve,
        'seq': seq,
        'sign': sign,
        'sign_type': signType,
        'token': token,
      };

  String toString() {
    String str = 'appid=' +
        appId +
        '&data=' + data.toString() +
        '&phone=' +
        phone +
        '&phone_code=' +
        phoneCode +
        '&retrieve=' +
        retrieve +
        '&seq=' +
        seq +
        '&sign_type=' +
        signType +
        '&token=' +
        token;

    return str;
  }

  @override
  Future<RetrieveResponse> sendRequest(var payload) async {
    RetrieveResponse obj = await super.sendRequest(payload);
    if (obj == null) return null;

    if (obj.result == 0) {
      var resp = FeeConfigResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}

/*
 */
class FeeConfigRequest {
 

  Map<String, dynamic> toJson() => {
      };

  String toString() {
    String str = 'map[]';

    return str;
  }
}

/*
  Type string `json:"type"`
  PerMillion string `json:"per_million"`
  PerTxFix string `json:"per_tx_fix"`
  AssetName string `json:"asset_name"`
 */
class FeeConfig {
  String assetName;
  String type;
  String perMillion;
  String perTxFix;

  FeeConfig(
      {
      this.assetName,
      this.type,
      this.perMillion,
      this.perTxFix});

  FeeConfig.fromJson(Map<String, dynamic> json)
      : assetName = json['asset_name'],
        type = json['type'],
        perMillion = json['per_million'],
        perTxFix = json['per_tx_fix'];

  static List<FeeConfig> fromJsons(List<dynamic> jsons) {

    if (jsons == null) return null;

    List<FeeConfig> acl = new List<FeeConfig>();
    jsons.forEach((item) {
      FeeConfig ac = FeeConfig.fromJson(item);
      acl.add(ac);
    });

    return acl;
  }
}

/*
	FeeConfigs []*FeeConfig `json:"fee_config_list"`
	Retrieve   string   `json:"retrieve"`
	Seq        string   `json:"seq"`
	Result     int                 `json:"result"`
	Comment    string              `json:"comment"`
 */
class FeeConfigResponse extends RetrieveResponse {
  List<FeeConfig> feeConfigList;
  String retrieve;
  String seq;
  int result;
  String comment;

  FeeConfigResponse({this.retrieve, this.seq, this.result, this.comment});

  @override
  FeeConfigResponse.fromJson(Map<String, dynamic> json)
      : retrieve = json['retrieve'],
        seq = json['seq'],
        result = json['result'] as int,
        comment = json['comment'] {
    feeConfigList = FeeConfig.fromJsons(json['fee_config_list']);
  }
}
