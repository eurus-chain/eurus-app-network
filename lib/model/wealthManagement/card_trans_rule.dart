import '../retrieve.dart';

class RetrieveCardTransRule extends Retrieve {

    final CardTransRuleRequest data;

    RetrieveCardTransRule({this.data})
        : super(retrieve: 'card_trans_rule');

    Map<String, dynamic> toJson() {

      Map mapData = super.toJson();
      mapData['data'] = data.toJson();
      return mapData;
    }


    String toString() {
        String string = super.toString();
        string.replaceAll('addNewData', data.toString());
        return string;
    }


    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
         if (obj == null) return null;
         if (obj.result == null || obj.result == 0) {
            var resp = CardTransRuleResponse.fromJson(super.respJson);
            return resp;
         }

         return obj;
    }
}

/*
	Fileid string `json:"fileid"`
 */
class CardTransRuleRequest {
    final String appId;
    final int timezone;
    final String cardId;

    CardTransRuleRequest({this.appId,this.cardId,this.timezone});

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
          'cardid': cardId,
          'timezone': timezone,

        };

    String toString() {
        String str = 'map[appid:' + appId + ' cardid:' + cardId + ' timezone:' + timezone.toString()+ ']';

        return str;
    }
}

class CardTransRuleResponse extends RetrieveResponse {
  int submitStartRelativeDay;
  String submitStartTime;
  int submitEndRelativeDay;
  String submitEndTime;
  String submitCaption;
  int calInterestRelativeDay;
  String calInterestTime;
  String calInterestCaption;
  int distributeInterestType;
  int distributeRelativeDay;
  String distributeTime;
  String distributeCaption;

  CardTransRuleResponse(
      {this.submitStartRelativeDay,
        this.submitStartTime,
        this.submitEndRelativeDay,
        this.submitEndTime,
        this.submitCaption,
        this.calInterestRelativeDay,
        this.calInterestTime,
        this.calInterestCaption,
        this.distributeInterestType,
        this.distributeRelativeDay,
        this.distributeTime,
        this.distributeCaption});

  CardTransRuleResponse.fromJson(Map<String, dynamic> json) {
    submitStartRelativeDay = json['submit_start_relative_day'];
    submitStartTime = json['submit_start_time'];
    submitEndRelativeDay = json['SubmitEndRelativeDay'];
    submitEndTime = json['submit_end_time'];
    submitCaption = json['submit_caption'];
    calInterestRelativeDay = json['cal_interest_relative_day'];
    calInterestTime = json['cal_interest_time'];
    calInterestCaption = json['cal_interest_caption'];
    distributeInterestType = json['distribute_interest_type'];
    distributeRelativeDay = json['distribute_relative_day'];
    distributeTime = json['distribute_time'];
    distributeCaption = json['distribute_caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['submit_start_relative_day'] = this.submitStartRelativeDay;
    data['submit_start_time'] = this.submitStartTime;
    data['SubmitEndRelativeDay'] = this.submitEndRelativeDay;
    data['submit_end_time'] = this.submitEndTime;
    data['submit_caption'] = this.submitCaption;
    data['cal_interest_relative_day'] = this.calInterestRelativeDay;
    data['cal_interest_time'] = this.calInterestTime;
    data['cal_interest_caption'] = this.calInterestCaption;
    data['distribute_interest_type'] = this.distributeInterestType;
    data['distribute_relative_day'] = this.distributeRelativeDay;
    data['distribute_time'] = this.distributeTime;
    data['distribute_caption'] = this.distributeCaption;
    return data;
  }
}