import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import '../apiHandler.dart';
import '../common.dart';
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
    RetrieveResponse respObject;
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
      phone = user?.phoneOrEmail;
    } else {
      email = user?.phoneOrEmail;
      phone = "";
    }

    // if (token == null || token == '') {
    //   if (retrieve == "login" ||
    //       retrieve == "login_by_phone_google_code" ||
    //       retrieve == "login_by_phone_password" ||
    //       retrieve == "update_user_device" ||
    //       retrieve == "change_password" ||
    //       retrieve == "register_by_userno" ||
    //       retrieve == "send_sms" ||
    //       retrieve == "update_user_device") {
    //
    //   } else {
       // throw NetHandlerException(errNo: NetHandlerError.errEmptyToken);
    //   }
    // }
  }


    Future<RetrieveResponse> sendRequest(var payload) async {
//        if(retrieve!= null){
//            if(retrieve == "login_by_phone_password" || retrieve == "login_by_token" || retrieve == "login" || retrieve == "logout" || retrieve == "withdraw"|| retrieve == "kickout"){
//                await common.logMessage(logMessage: json.encode(payload),logType: "sendToServerAPi："+retrieve);
//            }
//        }
        var url = common.serverUrl;
//         if(isWealthManagementAPI(currentApiName: retrieve)){
//             url = common.serverWealthManagementUrl;
//         }
//         if(retrieve == "payment"||retrieve == "get_order"){
//           url = common.wealthManagementBuyUrl;
//         }
//
//         if(retrieve == "sell"){
//           url = common.wealthManagementSellUrl;
//         }
//
//         if(payload["seq"] == "0"){
//           payload["seq"] = "${common.currentTimeInSeconds().toString()}-"+retrieve;
//         }

        respJson = await apiHandler.post(url, payload);
        //if(isLogAPI(currentApiName: retrieve)){
            String jsonString = jsonEncode(respJson);
            jsonString = jsonString;
            log("payload:$payload");
            log("respJson: $respJson");
       // }
        if(respJson != null){
          respObject = RetrieveResponse.fromJson(respJson);
        }
        return respObject;
    }


    Future<String> getVersion() async {
        // String url = 'https://api-v2.bitoll.com/app/version';
        // String url = 'https://86zfag3wd6.execute-api.ap-southeast-1.amazonaws.com/prd/version';
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
}

/*
 Retrieve string         `json:"retrieve"`
 Seq      string         `json:"seq"`
 Result   reterr.ErrCode `json:"result"`
 Comment  string         `json:"comment"`
 */
class RetrieveResponse {
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
