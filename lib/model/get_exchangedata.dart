class ExchangeData {
  List<ExchangeDataDetail> data;
  int maxpage;
  int currpage;
  int code;
  String msg;

  ExchangeData({this.data, this.maxpage, this.currpage, this.code, this.msg});

  ExchangeData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<ExchangeDataDetail>();
      json['data'].forEach((v) {
        data.add(new ExchangeDataDetail.fromJson(v));
      });
    }
    maxpage = json['maxpage'];
    currpage = json['currpage'];
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['maxpage'] = this.maxpage;
    data['currpage'] = this.currpage;
    data['code'] = this.code;
    data['msg'] = this.msg;
    return data;
  }
}

class ExchangeDataDetail {
  String id;
  String name;
  String logo;
  int rank;
  int pairnum;
  double volumn;
  double volumnBtc;
  double volumnCny;
  String tradeurl;
  double changeVolumn;
  int exrank;
  double hotindex;
  double assetsUsd;
  String klineData;
  int riskLevel;

  ExchangeDataDetail(
      {this.id,
        this.name,
        this.logo,
        this.rank,
        this.pairnum,
        this.volumn,
        this.volumnBtc,
        this.volumnCny,
        this.tradeurl,
        this.changeVolumn,
        this.exrank,
        this.hotindex,
        this.assetsUsd,
        this.klineData,
        this.riskLevel});

  ExchangeDataDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    rank = json['rank'];
    pairnum = json['pairnum'];
    volumn = json['volumn'];
    volumnBtc = json['volumn_btc'];
    volumnCny = json['volumn_cny'];
    tradeurl = json['tradeurl'];
    changeVolumn = json['change_volumn'];
    exrank = json['exrank'];
    hotindex = json['hotindex'];
    assetsUsd = json['assets_usd'];
    klineData = json['kline_data'];
    riskLevel = json['risk_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['rank'] = this.rank;
    data['pairnum'] = this.pairnum;
    data['volumn'] = this.volumn;
    data['volumn_btc'] = this.volumnBtc;
    data['volumn_cny'] = this.volumnCny;
    data['tradeurl'] = this.tradeurl;
    data['change_volumn'] = this.changeVolumn;
    data['exrank'] = this.exrank;
    data['hotindex'] = this.hotindex;
    data['assets_usd'] = this.assetsUsd;
    data['kline_data'] = this.klineData;
    data['risk_level'] = this.riskLevel;
    return data;
  }
}