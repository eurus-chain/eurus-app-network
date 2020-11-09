import 'myorder.dart';
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
class RetrieveOrderList extends Retrieve {
    String name;

    final OrderListRequest data;

    RetrieveOrderList({this.data, this.name})
        : super(retrieve: 'otc_order_list');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
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

        String str = 'appid=' + appId + '&data=' + data.toString() +
            '&name=' + nn + '&phone=' + phone + '&phone_code=' + phoneCode +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + token;

        return str;
    }

    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;
        if (obj.result == 0) {

            var resp = OrderListResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
		Id          string `json:"id"`
		Orderid     string `json:"orderid"`
		BankAccount string `json:"bank_account"`
		BankTicket  string `json:"bank_ticket"`
		AssetName   string `json:"asset_name"`
		Amount      string `json:"amount"`
		PaidTotal   string `json:"paid_total"`
		Currency    string `json:"currency"`
		Merchantid  string `json:"merchantid"`
		Status      string `json:"status"`
		Symbol      string `json:"symbol"`
		StartTime   int64  `json:"start_time"`
		EndTime     int64  `json:"end_time"`
		PageNumber  int64  `json:"page_number"`
		PageSize    int64  `json:"page_size"`
 */
class OrderListRequest {
    final String id;
    final String orderId;
    final String bankAccount;
    final String bankTicket;
    final String assetName;
    final String amount;
    final String paidTotal;
    final String currency;
    final String merchantId;
    final String status;
    final String symbol;
    final int startTime;
    final int endTime;
    final int pageNumber;
    final int pageSize;

    OrderListRequest({this.id, this.orderId, this.bankAccount, this.bankTicket,
        this.assetName, this.amount, this.paidTotal, this.currency, this.merchantId,
        this.status, this.symbol, this.startTime, this.endTime, this.pageNumber, this.pageSize});

    Map<String, dynamic> toJson() =>
        {
            'asset_name': assetName??'',
            'merchantid': merchantId??'',
            'page_number': pageNumber??0,
            'page_size': pageSize??0,
            'status': status??'',
            /*
            'amount': amount??'',
            'bank_account': bankAccount??'',
            'bank_ticket': bankTicket??'',
            'currency': currency??'',
            'end_time': endTime??0,
            'id': id??'',
            'orderid': orderId??'',
            'paid_total': paidTotal??'',
            'start_time': startTime??0,
            'symbol': symbol??''
             */
        };

    String toString() {
        String an = assetName??'';
        String aa = amount??'';
        String ba = bankAccount??'';
        String bt = bankTicket??'';
        String cc = currency??'';
        String et = endTime==null?'0':endTime.toString();
        String st = startTime==null?'0':startTime.toString();
        String pn = pageNumber==null?'0':pageNumber.toString();
        String ps = pageSize==null?'0':pageSize.toString();
        String mm = merchantId??'';
        String ii = id??'';
        String oi = orderId??'';
        String pp = paidTotal??'';
        String ss = status??'';
        String sb = symbol??'';

        /*
        String str = 'map[amount:' + aa + ' asset_name:' + an +
            ' bank_account:' + ba + ' bank_ticket:' + bt +
            ' currency:' + cc + ' end_time:' + et + ' id:' + ii +
            ' merchantid:' + mm + ' orderid:' + oi +
            ' page_number:' + pn + ' page_size:' + ps +
            ' paid_total:' + pp + ' start_time:' + st +
            ' status:' + ss + ' symbol:' + sb +
            ']';

         */

        String str = 'map[asset_name:' + an + ' merchantid:' + mm +
            ' page_number:' + pn + ' page_size:' + ps + ' status:' + ss + ']';

        return str;
    }
}

/*
		Id          string `json:"id"`
		Orderid     string `json:"orderid"`
		BankAccount string `json:"bank_account"`
		BankTicket  string `json:"bank_ticket"`
		AssetName   string `json:"asset_name"`
		Amount      string `json:"amount"`
		PaidTotal   string `json:"paid_total"`
		Currency    string `json:"currency"`
		Merchantid  string `json:"merchantid"`
		Status      string `json:"status"`
		Symbol      string `json:"symbol"`
		StartTime   int64  `json:"start_time"`
		EndTime     int64  `json:"end_time"`
		PageNumber  int64  `json:"page_number"`
		PageSize    int64  `json:"page_size"`

		List     []*iotc_order `json:"list"`
		Total    int64         `json:"total"`

    Retrieve   string   `json:"retrieve"`
    Seq        string   `json:"seq"`
    Result     int              `json:"result"`
    Comment    string           `json:"comment"`
 */
class OrderListResponse extends RetrieveResponse {
    String id;
    String orderId;
    String bankId; // new
    String bankBranch; // new
    String bankAccount;
    String bankTicket;
    String payerName; // new
    String assetName;
    String amount;
    String paidTotal;
    String currency;
    String merchantId;
    String status;
    String symbol;
    int startTime;
    int endTime;
    int pageNumber;
    int pageSize;
    List<MyOrder> orderList;
    int total;
    String retrieve;
    String seq;
    int result;
    String comment;

    OrderListResponse({this.retrieve, this.seq, this.result, this.comment});

    @override
    OrderListResponse.fromJson(Map<String, dynamic> json) :
            id = json['id'],
            orderId = json['orderid'],
            bankId = json['bank_id'],
            bankBranch = json['bank_branch'],
            bankAccount = json['bank_account'],
            bankTicket = json['bank_ticket'],
            payerName = json['payer_name'],
            assetName = json['asset_name'],
            amount = json['amount'],
            paidTotal = json['paid_total'],
            currency = json['currency'],
            merchantId = json['merchantid'],
            status = json['status'],
            symbol = json['symbol'],
            startTime = json['start_time'] as int,
            endTime = json['end_time'] as int,
            pageNumber = json['page_number'] as int,
            pageSize = json['page_size'] as int,
            total = json['total'] as int,
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'] {

        orderList = MyOrder.fromJsons(json['list']);
    }
}
