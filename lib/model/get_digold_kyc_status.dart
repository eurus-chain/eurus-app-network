import 'digoldKyc.dart';
import 'retrieve.dart';

class RetrieveDiglodKycStatus extends Retrieve {

  final GenDiglodKycStatusRequest data;

  RetrieveDiglodKycStatus({this.data})
      : super(retrieve: 'digold_kyc_status');

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

    String str = 'appid=' + appId + '&data=' + data.toString() + '&phone=' + phone + '&phone_code=' + phoneCode +
        '&retrieve=' + retrieve + '&seq=' + seq +
        '&sign_type=' + signType + '&token=' + tt;

    return str;
  }


  @override
  Future<RetrieveResponse> sendRequest(var payload) async {
    RetrieveResponse obj = await super.sendRequest(payload);
    if (obj == null) return null;
    if (obj.result == 0) {
      var resp = GenDiglodKycStatusResponse.fromJson(super.respJson);
      return resp;
    }

    return obj;
  }
}

/*
	  Id             string `json:"id"`
    User                 string `json:"user"`
    RandomNumber string `json:"random_number"`
    FullName string `json:"full_name"`
    Nationality string `json:"nationality"`
    IdNumber string `json:"id_number"`
    IdType string `json:"id_type"`
    ContactAddress string `json:"contact_address"`
    Telephone string `json:"telephone"`
    Email string `json:"email"`
    Occupation string `json:"occupation"`
    AnnualIncome string `json:"annual_income"`
    SourceOfFund string `json:"source_of_fund"`
    SourceOfFundOption string `json:"source_of_fund_option"`
    ReasonOpenAccount string `json:"reason_open_account"`
    HaveOtherWallet string `json:"have_other_wallet"`
    HaveOtherWalletUSDAmount string `json:"have_other_wallet_usd_amount"`
    IdCardFront string `json:"id_card_front"`
    IdCardBack string `json:"id_card_back"`
    ProofOfAddress string `json:"proof_of_address"`
    Selfie string `json:"selfie"`
    TermsConditions string `json:"terms_conditions"`
 */
class GenDiglodKycStatusRequest {
  final String detail;
  final String lang;

  GenDiglodKycStatusRequest({this.detail,this.lang});

  Map<String, dynamic> toJson() =>
      {
        'detail': detail??'',
        'lang': lang??'',
      };

  String toString() {
    String str = 'map[detail:' + detail + ' lang:' + lang + ']';

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
class GenDiglodKycStatusResponse extends RetrieveResponse {

  DigoldKyc kyc;
  String status;
  String retrieve;
  String seq;
  int result;
  String comment;

  GenDiglodKycStatusResponse({this.kyc, this.status,
    this.retrieve, this.seq, this.result, this.comment});

  @override
  GenDiglodKycStatusResponse.fromJson(Map<String, dynamic> json)
      : kyc = json['kyc']!= null?DigoldKyc.fromJson(json['kyc']):DigoldKyc(),
        status = json['status'],
        retrieve = json['retrieve'],
        seq = json['seq'],
        result = json['result'] as int,
        comment = json['comment'];
}
