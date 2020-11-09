import 'dart:convert';

/*
    Id            string `json:"id"`
    Asset         string `json:"asset"`
    Amount        string `json:"amount"`
    Fee           string `json:"fee"`
    Status        string `json:"status"`
    Type          string `json:"type"` // TYPE_SEND,TYPE_RECV,TYPE_WITHDRAW,TYPE_DEPOSIT,TYPE_REDEEM
    FromPhone     string `json:"from_phone"`
    FromPhoneCode string `json:"from_phone_code"`
    FromAddr      string `json:"from_addr"`
    ToPhone       string `json:"to_phone"`
    ToPhoneCode   string `json:"to_phone_code"`
    ToAddr        string `json:"to_addr"`
    CreateTime    string `json:"create_time"`
 */
class MyTransaction{
    String id;
    String asset;
    String amount;
    String fee;
    String feePaidBy;
    String status;
    String type;
    String fromPhone;
    String fromPhoneCode;
    String fromAddr;
    String fromUserNo;
    String toPhone;
    String toPhoneCode;
    String toAddr;
    String toUserNo;
    String createTime;
    String merchantId;
    String orderId;
    String fromName;
    String toName;
    String originId;
    String updateTime;
    String paymentType;
    String merchantName;

    MyTransaction({this.id, this.asset, this.amount, this.fee, this.feePaidBy, this.status, this.type,
        this.fromPhone, this.fromPhoneCode, this.fromAddr, this.fromUserNo,
        this.toPhone, this.toPhoneCode, this.toAddr, this.toUserNo, this.createTime, this.merchantId,
        this.orderId,this.fromName,this.toName,this.originId,this.updateTime,this.paymentType,this.merchantName});

    Map<String, dynamic> toJson() =>
        {
            'id': id,
            'asset' : asset,
            'amount': amount,
            'fee': fee,
            'fee_paid_by': feePaidBy,
            'status': status,
            'type': type,
            'from_phone': fromPhone,
            'from_phone_code': fromPhoneCode,
            'from_addr': fromAddr,
            'from_user_no': fromUserNo,
            'to_phone': toPhone,
            'to_phone_code': toPhoneCode,
            'to_addr': toAddr,
            'to_user_no': toUserNo,
            'create_time': createTime,
            'merchantid': merchantId,
            'order_id': orderId,
            'from_name': fromName,
            'to_name': toName,
            'origin_id': originId,
            'update_time': updateTime,
            'payment_type':paymentType,
            'merchant_name':merchantName
        };

    MyTransaction.fromJson(Map<String, dynamic> json) :
            id = json['id'],
            asset = json['asset'],
            amount = json['amount'],
            fee = json['fee'],
            feePaidBy = json['fee_paid_by'],
            status = json['status'],
            type = json['type'],
            fromPhone = json['from_phone'],
            fromPhoneCode = json['from_phone_code'],
            fromAddr = json['from_addr'],
            fromUserNo = json['from_user_no'],
            toPhone = json['to_phone'],
            toPhoneCode = json['to_phone_code'],
            toAddr = json['to_addr'],
            toUserNo = json['to_user_no'],
            createTime = json['create_time'],
            merchantId = json['merchantid'],
            orderId = json['order_id'],
            fromName = json['from_name'],
            toName = json['to_name'],
            originId = json['origin_id'],
            updateTime = json['update_time'],
            paymentType = json['payment_type'],
            merchantName = json['merchant_name'];


    static List<MyTransaction> fromJsons(List<dynamic> jsons) {
        List<MyTransaction> txs = new List<MyTransaction>();

        jsons?.forEach((item) {
            if (item == null)
                return;

            MyTransaction ua = MyTransaction.fromJson(item);
            txs.add(ua);
        });

        return txs;
    }

    static String listToString(List<MyTransaction> txs) {
        if (txs == null || txs.length == 0) {
            return '[]';
        }

        String jsonStr = '[';
        txs.forEach((item) {
            var myJson = item.toJson();
            String str = jsonEncode(myJson);

            jsonStr += str + ',';
        });
        jsonStr = jsonStr.substring(0, jsonStr.length-1);
        jsonStr += ']';
        return jsonStr;
    }

    static List<MyTransaction> stringToList(String str) {
        if (str == null || str == '')
            return null;
        var myJson = jsonDecode(str);
        List<MyTransaction> mfs = MyTransaction.fromJsons(myJson);

        return mfs;
    }

}
