import 'dart:convert';
import 'package:hello/model/signin.dart';
import '../common.dart';

class MyUser{
    String phoneCode;
    String phoneOrEmail;
    String userNo;
    String nickName;
    String pubKeyPem;
    String prvKeyPem;
    String token;
    String deviceId;
    String logoId;
    String totalGz;
    // real
	  String randomNumber;
    String realName;
    String gender;
    String birthday;
    String nationality;
    String idType;
    String idNumber;
    String address;
    String fileIdFront;
    String fileIdBack;
    String fileSelfie;
    String fileAddress;
    String contactAddress;
    String occupation;
    String annualIncome;
    String sourceOfFund;
    String sourceOfFundOption;
    String reasonOpenaccount;
    String haveOtherWallet;
    String haveOtherWalletUsdAmount;
    String termsConditions;
    String kycStatus;
    String fullName;
    String twofaEnable;
    String paymentSetting;

    MyUser({this.phoneCode, this.phoneOrEmail, this.userNo, this.nickName,
        this.pubKeyPem, this.prvKeyPem, this.token, this.deviceId, this.logoId, this.totalGz,
        this.randomNumber, this.realName, this.gender, this.birthday,
		    this.nationality, this.idType, this.idNumber, this.address, this.fileIdFront,
		    this.fileIdBack, this.fileSelfie, this.fileAddress, this.contactAddress,
        this.occupation,this.annualIncome, this.sourceOfFund,this.sourceOfFundOption,
        this.reasonOpenaccount,this.haveOtherWallet,this.haveOtherWalletUsdAmount,this.termsConditions,
        this.kycStatus,this.fullName,this.twofaEnable,this.paymentSetting
    });

    MyUser.fromJson(Map<String, dynamic> json)
        :   phoneCode = json['phoneCode'] ?? "",
            phoneOrEmail = json['phone'],
            userNo = json['userNo'],
            nickName = json['nickName'],
            pubKeyPem = json['pubKeyPem'],
            prvKeyPem = json['prvKeyPem'],
            token = json['token'],
            deviceId = json['deviceId'],
            logoId = json['logoId'],
            totalGz = json['totalGz'],
            // real
            kycStatus = json['kycStatus'],
            fullName = json['fullName'],
			      randomNumber = json['randomNumber'],
            realName = json['realName'],
            gender = json['gender'],
            birthday = json['birthday'],
            nationality = json['nationality'],
            idType = json['idType'],
            idNumber = json['idNumber'],
            address = json['address'],
            fileIdFront = json['fileIdFront'],
            fileIdBack = json['fileIdBack'],
            fileSelfie = json['fileSelfie'],
            fileAddress = json['fileAddress'],
            twofaEnable = json['twofaEnable'],
            paymentSetting = json['payment_setting'];

    Map<String, dynamic> toJson() =>
        {
            'phoneCode': phoneCode ?? "",
            'phone': phoneOrEmail,
            'userNo': userNo,
            'nickName': nickName,
            'pubKeyPem': pubKeyPem,
            'prvKeyPem': prvKeyPem,
            'token': token,
            'deviceId': deviceId,
            'logoId': logoId,
            'totalGz': totalGz,
            // real
            'kycStatus': kycStatus,
            'fullName': fullName,
			      'randomNumber': randomNumber,
            'realName': realName,
            'gender': gender,
            'birthday': birthday,
            'nationality': nationality,
            'idType': idType,
            'idNumber': idNumber,
            'address': address,
            'fileIdFront': fileIdFront,
            'fileIdBack': fileIdBack,
            'fileSelfie': fileSelfie,
            'fileAddress': fileAddress,
            'twofaEnable': twofaEnable,
            'paymentSetting': paymentSetting,
        };

    static MyUser fromString(String data) {
        if (data == '') {
            return null;
        }
        Map userMap = jsonDecode(data);
        return MyUser.fromJson(userMap);
    }

    String toString() {
        return jsonEncode(this);
    }

    MyUser signInResponseToUser({SignInResponse siResp}){
      String decodeName = common.getBase64Decode(siResp.nickName);
      this.userNo = siResp.userNo ?? '';
      this.nickName = decodeName ?? '';
      this.token = siResp.token;
      this.logoId = siResp.logoId;
      this.totalGz = siResp.totalGz;
      this.kycStatus = siResp.kycStatus;
      this.twofaEnable = siResp.twofaEnable;
      this.paymentSetting = siResp.paymentSetting;
      return this;
    }

    bool isEmailLogin(){
      return phoneOrEmail.contains("@");
    }
}