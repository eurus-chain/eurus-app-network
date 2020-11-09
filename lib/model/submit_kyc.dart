import 'retrieve.dart';


/*
    Appid     string      `json:"appid"`
    Sign      string      `json:"sign"`
    SignType  string      `json:"sign_type"`

    Name      string      `json:"name"`
    UserNo     string      `json:"user_no"`
    Token     string      `json:"token"`

    Retrieve   string   `json:"retrieve"`
    Seq        string   `json:"seq"`
    Data      interface{} `json:"data"`
 */
class RetrieveSubmitKyc extends Retrieve {
    final String name;
    final SubmitKycRequest data;

    RetrieveSubmitKyc({this.data, this.name})
        : super(retrieve: 'submit_digold_kyc');

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
            'token': token??'',
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
}

/*
//	RandomNumber             string `json:"random_number"`
	FullName                 string `json:"full_name"`
	Nationality              string `json:"nationality"`
	IdNumber                 string `json:"id_number"`
	IdType                   string `json:"id_type"` // "IDCard","Passport"
	ContactAddress           string `json:"contact_address"`
	Telephone                string `json:"telephone"`
	Email                    string `json:"email"`
	Occupation               string `json:"occupation"`
	AnnualIncome             string `json:"annual_income"`
	SourceOfFund             string `json:"source_of_fund"`
	SourceOfFundOption       string `json:"source_of_fund_option"`
	ReasonOpenAccount        string `json:"reason_open_account"`
	HaveOtherWallet          string `json:"have_other_wallet"`
	HaveOtherWalletUSDAmount string `json:"have_other_wallet_usd_amount"`
	IdCardFront              string `json:"id_card_front"`
	IdCardBack               string `json:"id_card_back"`
	ProofOfAddress           string `json:"proof_of_address"`
	Selfie                   string `json:"selfie"`
	TermsConditions          string `json:"terms_conditions"`
*/
class SubmitKycRequest {

//    final String randomNumber;
    final String fullName;
    final String nationality;
    final String idNumber;
    final String idType;
    final String contactAddress;
    final String telephone;
    final String email;
    final String occupation;
    final String annualIncome;
    final String sourceOfFund;
    final String sourceOfFundOption;
    final String reasonOpenaccount;
    final String haveOtherWallet;
    final String haveOtherWalletUsdAmount;
    final String idCardFront;
    final String idCardBack;
    final String proofOfAddress;
    final String selfie;
    final String termsConditions;

    SubmitKycRequest({this.fullName,this.nationality,this.idNumber,
        this.idType, this.contactAddress, this.telephone, this.email, this.occupation, this.annualIncome,
        this.sourceOfFund, this.sourceOfFundOption,this.reasonOpenaccount,this.haveOtherWallet,this.haveOtherWalletUsdAmount,
        this.idCardFront, this.idCardBack,this.proofOfAddress, this.selfie,this.termsConditions});

    Map<String, dynamic> toJson() =>
        {
//            'random_number': randomNumber??'',
            'full_name': fullName??'',
            'nationality': nationality??'',
            'id_number': idNumber??'',
            'id_type': idType??'',
            'contact_address': contactAddress??'',
            'telephone':telephone??'',
            'email':email??'',
            'occupation':occupation??'',
            'annual_income':annualIncome??'',
            'source_of_fund':sourceOfFund??'',
            'source_of_fund_option':sourceOfFundOption??'',
            'reason_open_account':reasonOpenaccount??'',
            'have_other_wallet':haveOtherWallet??'',
            'have_other_wallet_usd_amount':haveOtherWalletUsdAmount??'',
            'id_card_back': idCardBack??'',
            'id_card_front': idCardFront??'',
            'proof_of_address': proofOfAddress??'',
            'selfie': selfie??'',
            'terms_conditions':termsConditions??''
        };

    String toString() {
      String str = 'map[annual_income:' + annualIncome + ' contact_address:' + contactAddress +
          ' email:' + email + ' full_name:' + fullName + ' have_other_wallet:' + haveOtherWallet +
          ' have_other_wallet_usd_amount:' + haveOtherWalletUsdAmount + ' id_card_back:' + idCardBack + ' id_card_front:'+ idCardFront + ' id_number:'+ idNumber +
          ' id_type:'+ idType + ' nationality:'+ nationality + ' occupation:' + occupation + ' proof_of_address:'+ proofOfAddress  +
          ' reason_open_account:' + reasonOpenaccount + ' selfie:' + selfie +
          ' source_of_fund:' + sourceOfFund + ' source_of_fund_option:' + sourceOfFundOption +
          ' telephone:' + telephone + ' terms_conditions:' + termsConditions + ']';

      return str;
    }

}
