import 'dart:convert';

class DigoldKyc{

  final String id;
  final String user;
  final String randomNumber;
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
  final String reasonOpenAccount;
  final String haveOtherWallet;
  final String haveOtherWalletUsdamount;
  final String idCardFront;
  final String idCardBack;
  final String proofOfAddress;
  final String selfIe;
  final String termsConditions;
  final String comment;

  DigoldKyc({this.id, this.user, this.randomNumber,
    this.fullName, this.nationality, this.idNumber, this.idType,
    this.contactAddress, this.telephone, this.email, this.occupation,
    this.annualIncome,this.sourceOfFund,this.sourceOfFundOption,
    this.reasonOpenAccount,this.haveOtherWallet,this.haveOtherWalletUsdamount,
    this.idCardFront,this.idCardBack,this.proofOfAddress,this.selfIe,
    this.termsConditions,this.comment
  });

  DigoldKyc.fromJson(Map<String, dynamic> json)
      :   id = json['id'],
        user = json['user'],
        randomNumber = json['random_number'],
        fullName = json['full_name'],
        nationality = json['nationality'],
        idNumber = json['id_number'],
        idType = json['id_type'],
        contactAddress = json['contact_address'],
        telephone = json['telephone'],
        email = json['email'],
        occupation = json['occupation'],
        annualIncome = json['annual_income'],
        sourceOfFund = json['source_of_fund'],
        sourceOfFundOption = json['source_of_fund_option'],
        reasonOpenAccount = json['reason_open_account'],
        haveOtherWallet = json['have_other_wallet'],
        haveOtherWalletUsdamount = json['have_other_wallet_usd_amount'],
        idCardFront = json['id_card_front'],
        idCardBack = json['id_card_back'],
        proofOfAddress = json['proof_of_address'],
        selfIe = json['selfie'],
        termsConditions = json['terms_conditions'],
        comment = json['comment'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'user': user,
        'random_number': randomNumber,
        'full_name': fullName,
        'nationality': nationality,
        'id_number': idNumber,
        'id_type': idType,
        'contact_address': contactAddress,
        'telephone': telephone,
        'email': email,
        'occupation': occupation,
        'annual_income': annualIncome,
        'nationality': nationality,
        'source_of_fund': sourceOfFund,
        'source_of_fund_option': sourceOfFundOption,
        'reason_open_account': reasonOpenAccount,
        'have_other_wallet': haveOtherWallet,
        'have_other_wallet_usd_amount': haveOtherWalletUsdamount,
        'id_card_front': idCardFront,
        'id_card_back': idCardBack,
        'proof_of_address': proofOfAddress,
        'selfie': selfIe,
        'terms_conditions': termsConditions,
        'comment':comment,
      };

  static DigoldKyc fromString(String data) {
    if (data == '') {
      return null;
    }
    Map userMap = jsonDecode(data);
    return DigoldKyc.fromJson(userMap);
  }

  String toString() {
    return jsonEncode(this);
  }
}