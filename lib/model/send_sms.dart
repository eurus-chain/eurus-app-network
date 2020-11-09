
import 'retrieve.dart';

class RetrieveSendSms extends Retrieve {
	final SendSmsRequest data;

	RetrieveSendSms({this.data})
		: super(retrieve: 'send_sms');

	Map<String, dynamic> toJson() =>
		{
			'appid': appId,
			'data': data.toJson(),
			'retrieve': retrieve,
			'seq': seq,
			'sign': sign,
			'sign_type': signType
		};

	String toString() {
		String str = 'appid=' + appId + '&data=' + data.toString() +
			'&retrieve=' + retrieve + '&seq=' + seq +
			'&sign_type=' + signType;

		return str;
	}
}

/*
	Usage     int    `json:"usage"` // 0:register 1:change password 2:change telephone 3:transfer 4:withdraw
	PhoneCode string `json:"phone_code"`
	Phone     string `json:"phone"`
  */
class SendSmsRequest {
	static int UsageRegister = 0;
	static int UsageChangePassword = 1;
	static int UsageChangePhone = 2;
	static int UsageTransfer = 3;
	static int UsageWithdraw = 4;
	static int UsageUpdateDevice = 5;   //(frozen)
	static int UsageUpateDevice = 6;
	static int UsageWithoutPasswordPayment = 7;
	static int UsageChangePincode = 8;
	static int UsageLogin = 9;
	static int UsageDeposit = 10;

	final int usage;
	final String phoneCode;
	final String phone;

	SendSmsRequest({this.usage, this.phoneCode, this.phone});

	Map<String, dynamic> toJson() =>
		{
			'phone': phone,
			'phone_code': phoneCode,
			'usage': usage
		};

	String toString() {
		String str = 'map[phone:' + phone + ' phone_code:' + phoneCode +
			' usage:' + usage.toString() + ']';

		return str;
	}
}
