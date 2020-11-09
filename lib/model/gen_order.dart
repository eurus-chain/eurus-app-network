import 'retrieve.dart';



class RetrieveGenOrder extends Retrieve {
    final String name;

    final GenOrderRequest data;

    RetrieveGenOrder({this.data, this.name})
        : super(retrieve: 'gen_otc_order');

    Map<String, dynamic> toJson() =>
        {
            'appid': appId,
            'data': data.toJson(),
            'name': name??'',
            'phone': phone,
            'phone_code': phoneCode,
            'retrieve': retrieve,
            'seq': seq,
            'sign': sign,
            'sign_type': signType,
            'token': token??''
        };

    String toString() {
        String nn = name??'';
        String tt = token??'';

        String str = 'appid=' + appId + '&data=' + data.toString() +
            '&name=' + nn + '&phone=' + phone + '&phone_code=' + phoneCode +
            '&retrieve=' + retrieve + '&seq=' + seq +
            '&sign_type=' + signType + '&token=' + tt;

        return str;
    }


    @override
    Future<RetrieveResponse> sendRequest(var payload) async {
        RetrieveResponse obj = await super.sendRequest(payload);
        if (obj == null) return null;
        if (obj.result == 0) {
            var resp = GenOrderResponse.fromJson(super.respJson);
            return resp;
        }

        return obj;
    }
}

/*
	AssetName      string `json:"asset_name"`
	Amount         string `json:"amount"`
	Type           string `json:"type"`         //TYPE_MARKET_BUY
	MarketPrice    string `json:"market_price"` //ref_price of front end
	MarketValue    string `json:"market_value"` //amount denominated by currency
	Currency       string `json:"currency"`     //taker currency is obliged to maker
	Fee            string `json:"fee"`
	FeePaidBy      string `json:"fee_paid_by"`
	Merchantid     string `json:"merchantid"`
	Orderid        string `json:"orderid"` //orderid from merchant for idempotent
	SymbolName     string `json:"symbol_name"`
	PaymentGateway string `json:"payment_gateway"` //leave empty, TYPE_BANK,TYPE_ALI_PAY,TYPE_WECHAT_PAY
 */
class GenOrderRequest {
    final String assetName;
    final String amount;
    final String type = 'TYPE_MARKET_BUY';
    final String marketPrice;
    final String marketValue;
    final String currency;
    final String fee;
    final String feePaidBy;
    final String merchantId;
    final String orderId;
    final String symbolName;
    final String paymentGateway;

    GenOrderRequest({this.assetName, this.amount, this.marketPrice,
        this.marketValue, this.currency, this.fee, this.feePaidBy,
        this.merchantId, this.orderId, this.symbolName, this.paymentGateway});

    Map<String, dynamic> toJson() =>
        {
            'amount': amount,
            'asset_name': assetName,
            'currency': currency,
            'fee': fee??'',
            'fee_paid_by': feePaidBy??'',
            'market_price': marketPrice,
            'market_value': marketValue,
            'merchantid': merchantId,
            'orderid': orderId,
            'payment_gateway': paymentGateway??'',
            'symbol_name': symbolName,
        };

    String toString() {
        String ff = fee??'';
        String fp = feePaidBy??'';
        String pg = paymentGateway??'';

        String str = 'map[amount:' + amount + ' asset_name:' + assetName +
            ' currency:' + currency + ' fee:' + ff +
            ' fee_paid_by:' + fp + ' market_price:' + marketPrice +
            ' market_value:' + marketValue + ' merchantid:' + merchantId +
            ' orderid:' + orderId + ' payment_gateway:' + pg +
            ' symbol_name:' + symbolName + ']';

        return str;
    }
}

/*
	UserSymbol     string         `json:"user_symbol"`
	Id             string         `json:"id"`
	PaidTotal      string         `json:"paid_total"`
	AssetName      string         `json:"asset_name"`
	Amount         string         `json:"amount"`
	Type           string         `json:"type"`
	MarketPrice    string         `json:"market_price"` //ref_price return from symbol
	MarketValue    string         `json:"market_value"` //amount denominated by currency
	Currency       string         `json:"currency"`
	Fee            string         `json:"fee"`
	FeePaidBy      string         `json:"fee_paid_by"`
	Merchantid     string         `json:"merchantid"`
	Orderid        string         `json:"orderid"`
	MakerOrderid   string         `json:"maker_orderid"`
	SymbolName     string         `json:"symbol_name"`
	BankAccount    string         `json:"bank_account"`
	BankId         string         `json:"bank_id"`
	AccountName    string         `json:"account_name"`
	PaymentGateway string         `json:"payment_gateway"`

	Retrieve       string         `json:"retrieve"`
	Seq            string         `json:"seq"`
	Result         reterr.ErrCode `json:"result"`
	Comment        string         `json:"comment"`
 */
class GenOrderResponse extends RetrieveResponse {
    final String userSymbol; //
    final String id;         //
    final String paidTotal;  //
    final String assetName;
    final String amount;
    final String type;
    final String marketPrice;
    final String marketValue;
    final String currency;
    final String fee;
    final String feePaidBy;
    final String merchantId;
    final String orderId;
    final String makerOrderid;  //
    final String symbolName;
    final String bankAccount;   //
    final String bankId;        //
    final String accountName;   //
    final String paymentGateway;
    String retrieve;
    String seq;
    int result;
    String comment;

    GenOrderResponse({this.userSymbol, this.id, this.paidTotal,
        this.assetName, this.amount, this.type, this.marketPrice,
        this.marketValue, this.currency, this.fee, this.feePaidBy,
        this.merchantId, this.orderId, this.makerOrderid, this.symbolName,
        this.bankAccount, this.bankId, this.accountName, this.paymentGateway,
        this.retrieve, this.seq, this.result, this.comment});

    @override
    GenOrderResponse.fromJson(Map<String, dynamic> json)
        :   userSymbol = json['user_symbol'],
            id = json['id'],
            paidTotal = json['paid_total'],
            assetName = json['asset_name'],
            amount = json['amount'],
            type = json['type'],
            marketPrice = json['market_price'],
            marketValue = json['market_value'],
            currency = json['currency'],
            fee = json['fee'],
            feePaidBy = json['fee_paid_by'],
            merchantId = json['merchantid'],
            orderId = json['orderid'],
            makerOrderid = json['maker_orderid'],
            symbolName = json['symbol_name'],
            bankAccount = json['bank_account'],
            bankId = json['bank_id'],
            accountName = json['account_name'],
            paymentGateway = json['payment_gateway'],
            retrieve = json['retrieve'],
            seq = json['seq'],
            result = json['result'] as int,
            comment = json['comment'];
}
