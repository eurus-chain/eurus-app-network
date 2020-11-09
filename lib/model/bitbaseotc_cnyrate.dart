class BitBaseOTCCnyRate {
  String message;
  int code;
  BitBaseOTCCnyRateData data;
  bool success;

  BitBaseOTCCnyRate({this.message, this.code, this.data, this.success});

  BitBaseOTCCnyRate.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? new BitBaseOTCCnyRateData.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class BitBaseOTCCnyRateData {
  String price;

  BitBaseOTCCnyRateData({this.price});

  BitBaseOTCCnyRateData.fromJson(Map<String, dynamic> json) {
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    return data;
  }
}