import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:pointycastle/asymmetric/api.dart';

import '../apiHandler.dart';
import '../common.dart';
import '../rsa_pem.dart';
import 'myuser.dart';
export '../common.dart';
enum Status { LOADING, COMPLETED, ERROR }

/*
    Appid     string      `json:"appid"`
    Sign      string      `json:"sign"`
    SignType  string      `json:"sign_type"`
	UserNo    string      `json:"user_no"`// new, child
    Retrieve  string      `json:"retrieve"`
	Token     string      `json:"token"` // child
    Seq       string      `json:"seq"`
	Data      interface{} `json:"data"`// child: place the following request into data
 */
class Retrieve {
    var respJson;
    final String appId = common.appId;
    Status status;
    String sign;
    String phone;
    String phoneCode;
    String email;
    final String signType = 'SHA256WithRSAClient';
    String userNo; // override by child
    String retrieve = 'login_by_phone_password';
    String token; // override by child
    String seq = '0';
    // String data; // override by child
    List<String> wealthManagementAPI = ["card_list","amount_list","get_card","deal_list","buy","sell","get_card_logo","card_trans_rule","place_buy_order","get_order"];
    List<String> logAPI = ["card_list","amount_list","get_card","deal_list","buy","sell","login","card_trans_rule","place_buy_order","get_order"];
    Retrieve({this.retrieve});

  setUpTokenAndPhone() {
    MyUser user = common.user;
    seq = "${common.currentTimeInSeconds().toString()}-"+retrieve;
    phoneCode = user?.phoneCode;
    token = user?.token;
    if(common.isPhoneLogin){
      email = "";
      phone = user?.Phone;
    } else {
      email = user?.Phone;
      phone = "";
    }
  }

    signature(RSAPrivateKey privateKey) {
      setUpTokenAndPhone();
      var rsaHelper = new RsaKeyHelper();
      var str = toString();
      log("signatureString:$str");

      sign = rsaHelper.sign(str, privateKey);

      log("signatureString:$str");
      // MyLog.d('signature=' + sign);
    }

    Future<RetrieveResponse> sendRequest(var payload) async {
        var url = common.serverUrl;
        respJson = await apiHandler.post(url, payload);
            String jsonString = jsonEncode(respJson);
            jsonString = jsonString;
            log("payload:$payload");
            log("respJson: $respJson");
        RetrieveResponse respObject;
        respObject.inputObject = this;
        if(respJson != null){
           respObject = RetrieveResponse.fromJson(respJson);
        }
        return respObject;
    }


    Future<String> getVersion() async {
        Uri uri = Uri.parse(common.appUpdateUrl);
        var httpClient = new HttpClient();
        String result;
        var data;
        try {

            var request = await httpClient.getUrl(uri);

            var response = await request.close();

            data = await response.transform(utf8.decoder).join();
            if (response.statusCode == HttpStatus.ok) {
                result = 'ok';
            } else {
                result = 'Error getting IP address:\nHttp status ${response.statusCode}';
            }
            print('retrive getVersion statusCode=${response.statusCode.toString()} data=' + data);
        } catch (e) {
            result = 'http failed:' + e.message;
        }

        httpClient.close();
        return data;
    }

  Map<String, dynamic> toJson() {
    return {
      'appid': appId,
      'phone': phone,
      'phone_code': phoneCode,
      'retrieve': retrieve,
      'seq': seq,
      'sign': sign,
      'sign_type': signType,
      'token': token ?? ''
    };
  }

    String toString() {
      String tt = token??'';

      String str = 'appid=' + appId + 'addNewData' +
          '&phone=' + phone + '&phone_code=' + phoneCode +
          '&retrieve=' + retrieve + '&seq=' + seq +
          '&sign_type=' + signType + '&token=' + tt;

      // MyLog.d('RetrieveGetAvatar toString=' + str);
      return str;
    }
}

/*
 Retrieve string         `json:"retrieve"`
 Seq      string         `json:"seq"`
 Result   reterr.ErrCode `json:"result"`
 Comment  string         `json:"comment"`
 */
class RetrieveResponse {
    Retrieve inputObject;
    String retrieve;
    String seq;
    int result;
    String comment;
    String message;
    int pinCodeErrCount;

    RetrieveResponse({this.retrieve, this.seq, this.result, this.comment, this.pinCodeErrCount});

    RetrieveResponse.fromJson(Map<String, dynamic> json)
        :   retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'],
            message = json['message'],
            pinCodeErrCount = json['pin_code_err_count']??0;

}
