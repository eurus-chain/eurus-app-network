import 'dart:convert';

/*
		Id          string `json:"id"`
		Orderid     string `json:"orderid"`
		BankAccount string `json:"bank_account"`
		BankTicket  string `json:"bank_ticket"`
		CreateTime  string `json:"create_time"`
		AssetName   string `json:"asset_name"`
		Amount      string `json:"amount"`
		Fee         string `json:"fee"`
		FeePaidBy   string `json:"fee_paid_by"`
		PaidTotal   string `json:"paid_total"`
		OrderType   string `json:"order_type"`
		Currency    string `json:"currency"`
		MarketPrice string `json:"market_price"`
		MarketValue string `json:"market_value"`
		RefPrice    string `json:"ref_price"`
		RefValue    string `json:"ref_value"`
		Merchantid  string `json:"merchantid"`
		UpdateTime  string `json:"update_time"`
		Status      string `json:"status"`
		Symbol      string `json:"symbol"`
 */
class MyOrder{
    String id;
    String orderId;
    String account;
    String bankId;
    String bankBranch; // new
    String accountName;
    String bankTicket;
    String payerName; // new
    String createTime;
    String assetName;
    String amount;
    String fee;
    String feePaidBy;
    String paidTotal;
    String orderType;
    String currency;
    String marketPrice;
    String marketValue;
    String refPrice;
    String refValue;
    String merchantId;
    String updateTime;
    String status;
    String symbol;
    String userSymbol;

    MyOrder({this.id, this.orderId, this.account, this.bankId,
        this.bankBranch, this.accountName, this.bankTicket, this.payerName,
        this.createTime, this.assetName, this.amount, this.fee, this.feePaidBy,
        this.paidTotal, this.orderType, this.currency, this.marketPrice, this.marketValue,
        this.refPrice, this.refValue, this.merchantId, this.updateTime, this.status,
        this.symbol, this.userSymbol});

    Map<String, dynamic> toJson() =>
        {
            'id': id,
            'orderid' : orderId,
            'account': account,
            'bank_id': bankId,
            'bank_branch': bankBranch,
            'account_name': accountName,
            'bank_ticket': bankTicket,
            'payer_name': payerName,
            'create_time': createTime,
            'asset_name': assetName,
            'amount': amount,
            'fee': fee,
            'fee_paid_by': feePaidBy,
            'paid_total': paidTotal,
            'order_type': orderType,
            'currency': currency,
            'makert_price': marketPrice,
            'market_value': marketValue,
            'ref_price': refPrice,
            'ref_value': refValue,
            'merchantid': merchantId,
            'update_time': updateTime,
            'status': status,
            'symbol': symbol,
            'user_symbol': userSymbol,
        };

    MyOrder.fromJson(Map<String, dynamic> json) :
            id = json['id'],
            orderId = json['orderid'],
            account = json['account'],
            bankId = json['bank_id'],
            bankBranch = json['bank_branch'],
            accountName = json['account_name'],
            bankTicket = json['bank_ticket'],
            payerName = json['payer_name'],
            createTime = json['create_time'],
            assetName = json['asset_name'],
            amount = json['amount'],
            fee = json['fee'],
            feePaidBy = json['fee_paid_by'],
            paidTotal = json['paid_total'],
            orderType = json['order_type'],
            currency = json['currency'],
            marketPrice = json['market_price'],
            marketValue = json['market_value'],
            refPrice = json['ref_price'],
            refValue = json['ref_value'],
            merchantId = json['merchantid'],
            updateTime = json['update_time'],
            status = json['status'],
            symbol = json['symbol'],
            userSymbol = json['user_symbol'];

    static List<MyOrder> fromJsons(List<dynamic> jsons) {
        // MyLog.d('List<MyOrder>.fromJsons');
        if (jsons == null)
            return null;

        List<MyOrder> orders = new List<MyOrder>();
        jsons.forEach((item) {
            MyOrder ua = MyOrder.fromJson(item);
            orders.add(ua);
        });

        return orders;
    }

    static String listToString(List<MyOrder> orders) {
        if (orders == null || orders.length == 0) {
            return '[]';
        }

        String jsonStr = '[';
        orders.forEach((item) {
           var myJson = item.toJson();
           String str = jsonEncode(myJson);
           // MyLog.d('MyOrder.listToString item=' + str);
           jsonStr += str + ',';
        });
        jsonStr = jsonStr.substring(0, jsonStr.length-1);
        jsonStr += ']';
        // MyLog.d('MyOrder.listToString str=' + jsonStr);
        return jsonStr;
    }

    static List<MyOrder> stringToList(String str) {
        if (str == null || str.length == 0)
            return null;
        var myJson = jsonDecode(str);
        // MyLog.d('MyOrder.stringToList str=' + str);
        List<MyOrder> mfs = MyOrder.fromJsons(myJson);
        /*
        mfs.forEach((item) {
            MyLog.d('MyOrder.stringToList item = +' + item.phoneCode + '-' + item.phone);
        });

         */

        return mfs;
    }

}
