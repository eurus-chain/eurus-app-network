
import '../retrieve.dart';
// enum EventType {
//   EventBeforeStart,
//   EventStarting,
//   EventAlreadyEnd}

/*
    Appid     string      `json:"appid"`
    Sign      string      `json:"sign"`
    SignType  string      `json:"sign_type"`

    Phone     string      `json:"phone"`
    PhoneCode string      `json:"phone_code"`
    Token     string      `json:"token"`

    Retrieve   string   `json:"retrieve"`
    Seq        string   `json:"seq"`
    Data      interface{} `json:"data"`
 */
class RetrieveGetCard extends Retrieve {

  final GetCardRequest data;

  RetrieveGetCard({ this.data})
      : super(retrieve: 'get_card');

  Map<String, dynamic> toJson() =>
      {
        'appid': appId,
       'data': data.toJson(),
        'phone': phone,
        'phone_code': phoneCode,
        'retrieve': retrieve,
        'seq': seq,
        'sign': sign,
        'sign_type': signType,
        'token': token??''
      };

  String toString() {
    String tt = token??'';

    String str = 'appid=' + appId + '&data=map[]' + '&phone=' + phone + '&phone_code=' + phoneCode +
        '&retrieve=' + retrieve + '&seq=' + seq +
        '&sign_type=' + signType + '&token=' + tt;

    return str;
  }

  @override
  Future<RetrieveResponse> sendRequest(var payload) async {
    RetrieveResponse obj = await super.sendRequest(payload);
    if (obj == null) return null;
    if (obj.result == 0) {
     var resp = GetCardResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}

class GetCardRequest {
  final String id;

  GetCardRequest({this.id});

  Map<String, dynamic> toJson() =>
      {
        'id': id,
      };

  String toString() {
    String str = 'map[id:' + id + ']';

    return str;
  }
}

class GetCardResponse extends RetrieveResponse{
  CardData card;
  String brought;
  String quotaLeft;
  List<dynamic> inCondition;
  String retrieve;
  String seq;
  int result;
  String comment;

  GetCardResponse(
      {this.card, this.brought, this.quotaLeft, this.inCondition,this.retrieve, this.seq, this.result, this.comment});

  GetCardResponse.fromJson(Map<String, dynamic> json) {
    card = json['card'] != null ? new CardData.fromJson(json['card']) : null;
    brought = json['brought'];
    quotaLeft = json['quota_left'];
    inCondition = json['in_condition'];
    retrieve = json['retrieve'];
    seq = json['seq'];
    result = json['result'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.card != null) {
      data['card'] = this.card.toJson();
    }
    data['brought'] = this.brought;
    data['quota_left'] = this.quotaLeft;
    data['in_condition'] = this.inCondition;
    data['retrieve'] = this.retrieve;
    data['seq'] = this.seq;
    data['result'] = this.result;
    data['comment'] = this.comment;
    return data;
  }
}

class CardData {
  String id;
  String appid;
  String type;
  Product product;
  Display display;
  AcessCondition acessCondition;
  Interest interest;
  String status;
  String createBy;
  String updateBy;
  String createTime;
  String updateTime;
  String merchantid;
  String merchantName;
  int vid;

  CardData(
      {this.id,
        this.appid,
        this.type,
        this.product,
        this.display,
        this.acessCondition,
        this.interest,
        this.status,
        this.createBy,
        this.updateBy,
        this.createTime,
        this.updateTime,
        this.merchantid,
        this.vid,
        this.merchantName});

  CardData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appid = json['appid'];
    type = json['type'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    display =
    json['display'] != null ? new Display.fromJson(json['display']) : null;
    acessCondition = json['acess_condition'] != null
        ? new AcessCondition.fromJson(json['acess_condition'])
        : null;
    interest = json['interest'] != null
        ? new Interest.fromJson(json['interest'])
        : null;
    status = json['status'];
    createBy = json['create_by'];
    updateBy = json['update_by'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
    merchantid = json['merchantid'];
    vid = json['vid'];
    merchantName = json['merchant_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appid'] = this.appid;
    data['type'] = this.type;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    if (this.display != null) {
      data['display'] = this.display.toJson();
    }
    if (this.acessCondition != null) {
      data['acess_condition'] = this.acessCondition.toJson();
    }
    if (this.interest != null) {
      data['interest'] = this.interest.toJson();
    }
    data['status'] = this.status;
    data['create_by'] = this.createBy;
    data['update_by'] = this.updateBy;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['merchantid'] = this.merchantid;
    data['vid'] = this.vid;
    return data;
  }
}

class Product {
  String appid;
  String productName;
  int tradingStartTime;
  int tradingEndTime;
  String eachUserAmountLimit;
  String eachUserEachBuyAmountMin;
  int totalUserCountLimit;
  String totalAmountLimit;
  String totalValidTimeType;
  int totalValidTime;
  String totalValidTimeUnit;
  int priority;
  String currencyUnit;
  String funderId;
  String funderName;

  String getTimeString() {
    String timeString = "";
    String timeUnitString = "";
    if(totalValidTimeType == "TYPE_FIX"){
      if (totalValidTimeUnit == "UNIT_YEAR") {
        timeUnitString = "年";
      } else if (totalValidTimeUnit == "UNIT_MONTH") {
        timeUnitString = "月";
      } else if (totalValidTimeUnit == "UNIT_WEEK") {
        timeUnitString = "周";
      } else if (totalValidTimeUnit == "UNIT_DAY") {
        timeUnitString = "日";
      }
      timeString = totalValidTime.toString() + timeUnitString;
    } else {
      timeString = "随传随取";
    }
    return timeString;
  }

  Product(
      {this.appid,
        this.productName,
        this.tradingStartTime,
        this.tradingEndTime,
        this.eachUserAmountLimit,
        this.eachUserEachBuyAmountMin,
        this.totalUserCountLimit,
        this.totalAmountLimit,
        this.totalValidTimeType,
        this.totalValidTime,
        this.totalValidTimeUnit,
        this.priority,
        this.currencyUnit,
        this.funderId,
        this.funderName});

  Product.fromJson(Map<String, dynamic> json) {
    appid = json['appid'];
    productName = json['product_name'];
    tradingStartTime = json['trading_start_time'];
    tradingEndTime = json['trading_end_time'];
    eachUserAmountLimit = json['each_user_amount_limit'];
    eachUserEachBuyAmountMin = json['each_user_each_buy_amount_min'];
    totalUserCountLimit = json['total_user_count_limit'];
    totalAmountLimit = json['total_amount_limit'];
    totalValidTimeType = json['total_valid_time_type'];
    totalValidTime = json['total_valid_time'];
    totalValidTimeUnit = json['total_valid_time_unit'];
    priority = json['priority'];
    currencyUnit = json['currency_unit'];
    funderId = json['funder_id'];
    funderName = json['funder_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appid'] = this.appid;
    data['product_name'] = this.productName;
    data['trading_start_time'] = this.tradingStartTime;
    data['trading_end_time'] = this.tradingEndTime;
    data['each_user_amount_limit'] = this.eachUserAmountLimit;
    data['each_user_each_buy_amount_min'] = this.eachUserEachBuyAmountMin;
    data['total_user_count_limit'] = this.totalUserCountLimit;
    data['total_amount_limit'] = this.totalAmountLimit;
    data['total_valid_time_type'] = this.totalValidTimeType;
    data['total_valid_time'] = this.totalValidTime;
    data['total_valid_time_unit'] = this.totalValidTimeUnit;
    data['priority'] = this.priority;
    data['currency_unit'] = this.currencyUnit;
    data['funder_id'] = this.funderId;
    data['funder_name'] = this.funderName;
    return data;
  }
}

class Display {
  List<String> tags;
  String productDetailTips;
  String buyHint;
  String sellHint;
  String introduction;
  String logoId;
  String mortgageContractPdfId;
  String mortgageLogPdfId;
  String mortgageContractPdfUrl;
  String mortgageLogPdfUrl;
  int startTime;
  int endTime;
  String guaranteeCoorperationIntroduction;
  String technicalServiceIntroduction;
  String buyFlow;
  String buySummit;
  String buyConfirmShare;
  String buyReceiveGain;
  String obtainInformationIntroduction;
  String gainRuleTitle;
  String buyTitle;
  String buySummitTitle;
  String buyConfirmShareTitle;
  String buyReceiveGainTitle;
  String buyRuleTitle;
  String buyRuleTitleGain;
  String sellTitle;
  String sellSummitTitle;
  String sellConfirmShareTitle;
  String sellReceiveGainTitle;
  String sellRuleTitle;
  String sellRuleTitleGain;
  String sellFlow;
  String sellSummit;
  String sellConfirmShare;
  String sellReceiveGain;
  String gainRule;
  String buyRule;
  String sellRule;
  String sellTips;
  String buyTips;
  String compoundTips;

  Display(
      {this.tags,
        this.productDetailTips,
        this.buyHint,
        this.sellHint,
        this.introduction,
        this.mortgageContractPdfId,
        this.mortgageLogPdfId,
        this.mortgageContractPdfUrl,
        this.mortgageLogPdfUrl,
        this.startTime,
        this.endTime,
        this.guaranteeCoorperationIntroduction,
        this.technicalServiceIntroduction,
        this.buyFlow,
        this.buySummit,
        this.buyConfirmShare,
        this.buyReceiveGain,
        this.obtainInformationIntroduction,
        this.gainRuleTitle,
        this.buyTitle,
        this.buySummitTitle,
        this.buyConfirmShareTitle,
        this.buyReceiveGainTitle,
        this.buyRuleTitle,
        this.buyRuleTitleGain,
        this.sellTitle,
        this.sellSummitTitle,
        this.sellConfirmShareTitle,
        this.sellReceiveGainTitle,
        this.sellRuleTitle,
        this.sellRuleTitleGain,
        this.sellFlow,
        this.sellSummit,
        this.sellConfirmShare,
        this.sellReceiveGain,
        this.gainRule,
        this.buyRule,
        this.sellRule,
        this.sellTips,
        this.buyTips,
        this.compoundTips,
        this.logoId});

  Display.fromJson(Map<String, dynamic> json) {
    tags = json['tags'].cast<String>();
    productDetailTips = json['product_detail_tips'];
    buyHint = json['buy_hint'];
    sellHint = json['sell_hint'];
    introduction = json['introduction'];
    mortgageContractPdfId = json['mortgage_contract_pdf_id'];
    mortgageLogPdfId = json['mortgage_log_pdf_id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    guaranteeCoorperationIntroduction =
    json['guarantee_coorperation_introduction'];
    technicalServiceIntroduction = json['technical_service_introduction'];
    buyFlow = json['buy_flow'];
    buySummit = json['buy_summit'];
    buyConfirmShare = json['buy_confirm_share'];
    buyReceiveGain = json['buy_receive_gain'];
    obtainInformationIntroduction = json['obtain_information_introduction'];
    gainRuleTitle = json['gain_rule_title'];
    buyTitle = json['buy_title'];
    buySummitTitle = json['buy_summit_title'];
    buyConfirmShareTitle = json['buy_confirm_share_title'];
    buyReceiveGainTitle = json['buy_receive_gain_title'];
    buyRuleTitle = json['buy_rule_title'];
    buyRuleTitleGain = json['buy_rule_title_gain'];
    sellTitle = json['sell_title'];
    sellSummitTitle = json['sell_summit_title'];
    sellConfirmShareTitle = json['sell_confirm_share_title'];
    sellReceiveGainTitle = json['sell_receive_gain_title'];
    sellRuleTitle = json['sell_rule_title'];
    sellRuleTitleGain = json['sell_rule_title_gain'];
    sellFlow = json['sell_flow'];
    sellSummit = json['sell_summit'];
    sellConfirmShare = json['sell_confirm_share'];
    sellReceiveGain = json['sell_receive_gain'];
    gainRule = json['gain_rule'];
    buyRule = json['buy_rule'];
    sellRule = json['sell_rule'];
    sellTips = json['sell_tips'];
    buyTips = json['buy_tips'];
    compoundTips = json['compound_tips'];
    logoId = json['logoid'];
    mortgageContractPdfUrl = json['mortgage_contract_pdf_url'];
    mortgageLogPdfUrl = json['mortgage_log_pdf_url'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tags'] = this.tags;
    data['introduction'] = this.introduction;
    data['mortgage_contract_pdf_id'] = this.mortgageContractPdfId;
    data['mortgage_log_pdf_id'] = this.mortgageLogPdfId;
    data['mortgage_contract_pdf_url'] = this.mortgageContractPdfUrl;
    data['mortgage_log_pdf_url'] = this.mortgageLogPdfUrl;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['guarantee_coorperation_introduction'] =
        this.guaranteeCoorperationIntroduction;
    data['technical_service_introduction'] = this.technicalServiceIntroduction;
    data['buy_flow'] = this.buyFlow;
    data['buy_summit'] = this.buySummit;
    data['buy_confirm_share'] = this.buyConfirmShare;
    data['buy_receive_gain'] = this.buyReceiveGain;
    data['obtain_information_introduction'] =
        this.obtainInformationIntroduction;
    data['gain_rule_title'] = this.gainRuleTitle;
    data['buy_title'] = this.buyTitle;
    data['buy_summit_title'] = this.buySummitTitle;
    data['buy_confirm_share_title'] = this.buyConfirmShareTitle;
    data['buy_receive_gain_title'] = this.buyReceiveGainTitle;
    data['buy_rule_title'] = this.buyRuleTitle;
    data['buy_rule_title_gain'] = this.buyRuleTitleGain;
    data['sell_title'] = this.sellTitle;
    data['sell_summit_title'] = this.sellSummitTitle;
    data['sell_confirm_share_title'] = this.sellConfirmShareTitle;
    data['sell_receive_gain_title'] = this.sellReceiveGainTitle;
    data['sell_rule_title'] = this.sellRuleTitle;
    data['sell_rule_title_gain'] = this.sellRuleTitleGain;
    data['sell_flow'] = this.sellFlow;
    data['sell_summit'] = this.sellSummit;
    data['sell_confirm_share'] = this.sellConfirmShare;
    data['sell_receive_gain'] = this.sellReceiveGain;
    data['gain_rule'] = this.gainRule;
    data['buy_rule'] = this.buyRule;
    data['sell_rule'] = this.sellRule;
    data['sell_tips'] = this.sellTips;
    data['buy_tips'] = this.buyTips;
    data['compound_tips'] = this.compoundTips;
    return data;
  }
}

class AcessCondition {
  String merchantType;
  String isKyc;
  List<BigCustomerBehaviorFullfill> bigCustomerBehaviorFullfill;

  AcessCondition(
      {this.merchantType, this.isKyc, this.bigCustomerBehaviorFullfill});

  AcessCondition.fromJson(Map<String, dynamic> json) {
    merchantType = json['merchant_type'];
    isKyc = json['is_kyc'];
    if (json['big_customer_behavior_fullfill'] != null) {
      bigCustomerBehaviorFullfill = new List<BigCustomerBehaviorFullfill>();
      json['big_customer_behavior_fullfill'].forEach((v) {
        bigCustomerBehaviorFullfill
            .add(new BigCustomerBehaviorFullfill.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['merchant_type'] = this.merchantType;
    data['is_kyc'] = this.isKyc;
    if (this.bigCustomerBehaviorFullfill != null) {
      data['big_customer_behavior_fullfill'] =
          this.bigCustomerBehaviorFullfill.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BigCustomerBehaviorFullfill {
  List<SmallCustomerBehaviorFullfill> smallCustomerBehaviorFullfill;

  BigCustomerBehaviorFullfill({this.smallCustomerBehaviorFullfill});

  BigCustomerBehaviorFullfill.fromJson(Map<String, dynamic> json) {
    if (json['small_customer_behavior_fullfill'] != null) {
      smallCustomerBehaviorFullfill = new List<SmallCustomerBehaviorFullfill>();
      json['small_customer_behavior_fullfill'].forEach((v) {
        smallCustomerBehaviorFullfill
            .add(new SmallCustomerBehaviorFullfill.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.smallCustomerBehaviorFullfill != null) {
      data['small_customer_behavior_fullfill'] =
          this.smallCustomerBehaviorFullfill.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SmallCustomerBehaviorFullfill {
  String operatingType;
  String total;
  String operator;
  String amount;
  String unit;

  SmallCustomerBehaviorFullfill(
      {this.operatingType, this.total, this.operator, this.amount, this.unit});

  SmallCustomerBehaviorFullfill.fromJson(Map<String, dynamic> json) {
    operatingType = json['operating_type'] ?? "";
    total = json['total'] ?? "";
    operator = json['operator'] ?? "";
    amount = json['amount'] ?? "";
    unit = json['unit'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['operating_type'] = this.operatingType;
    data['total'] = this.total;
    data['operator'] = this.operator;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    return data;
  }
}

class Interest {
  String annualRatePercentageDay;
  String calcInterestType;
  String calcInterestCycleType;
  String overallCalcInterestCycleStartTime;
  String overallCalcInterestCycleEndTime;
  int overallCalcInterestCycleCount;
  int overallCalcInterestCycleSeperationTime;
  List<CalcInterestTime> calcInterestTime;
  String distributeInterestCycleType;
  int distributeInterestCycleEverydayCount;
  String distributeInterestTimeEverydayType;
  int distributeInterestTimeEverydayTime;

  Interest(
      {this.annualRatePercentageDay,
        this.calcInterestType,
        this.calcInterestCycleType,
        this.overallCalcInterestCycleStartTime,
        this.overallCalcInterestCycleEndTime,
        this.overallCalcInterestCycleCount,
        this.overallCalcInterestCycleSeperationTime,
        this.calcInterestTime,
        this.distributeInterestCycleType,
        this.distributeInterestCycleEverydayCount,
        this.distributeInterestTimeEverydayType,
        this.distributeInterestTimeEverydayTime});

  Interest.fromJson(Map<String, dynamic> json) {
    annualRatePercentageDay = json['annual_rate_percentage_day'];
    calcInterestType = json['calc_interest_type'];
    calcInterestCycleType = json['calc_interest_cycle_type'];
    overallCalcInterestCycleStartTime =
    json['overall_calc_interest_cycle_start_time'];
    overallCalcInterestCycleEndTime =
    json['overall_calc_interest_cycle_end_time'];
    overallCalcInterestCycleCount = json['overall_calc_interest_cycle_count'];
    overallCalcInterestCycleSeperationTime =
    json['overall_calc_interest_cycle_seperation_time'];
    if (json['calc_interest_time'] != null) {
      calcInterestTime = new List<CalcInterestTime>();
      json['calc_interest_time'].forEach((v) {
        calcInterestTime.add(new CalcInterestTime.fromJson(v));
      });
    }
    distributeInterestCycleType = json['distribute_interest_cycle_type'];
    distributeInterestCycleEverydayCount =
    json['distribute_interest_cycle_everyday_count'];
    distributeInterestTimeEverydayType =
    json['distribute_interest_time_everyday_type'];
    distributeInterestTimeEverydayTime =
    json['distribute_interest_time_everyday_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['annual_rate_percentage_day'] = this.annualRatePercentageDay;
    data['calc_interest_type'] = this.calcInterestType;
    data['calc_interest_cycle_type'] = this.calcInterestCycleType;
    data['overall_calc_interest_cycle_start_time'] =
        this.overallCalcInterestCycleStartTime;
    data['overall_calc_interest_cycle_end_time'] =
        this.overallCalcInterestCycleEndTime;
    data['overall_calc_interest_cycle_count'] =
        this.overallCalcInterestCycleCount;
    data['overall_calc_interest_cycle_seperation_time'] =
        this.overallCalcInterestCycleSeperationTime;
    if (this.calcInterestTime != null) {
      data['calc_interest_time'] =
          this.calcInterestTime.map((v) => v.toJson()).toList();
    }
    data['distribute_interest_cycle_type'] = this.distributeInterestCycleType;
    data['distribute_interest_cycle_everyday_count'] =
        this.distributeInterestCycleEverydayCount;
    data['distribute_interest_time_everyday_type'] =
        this.distributeInterestTimeEverydayType;
    data['distribute_interest_time_everyday_time'] =
        this.distributeInterestTimeEverydayTime;
    return data;
  }
}

class CalcInterestTime {
  String startTime;
  String endTime;

  CalcInterestTime({this.startTime, this.endTime});

  CalcInterestTime.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}
