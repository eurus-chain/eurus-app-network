
import 'retrieve.dart';

class RetrieveSendEmail extends Retrieve {
	final SendEmailRequest data;

	RetrieveSendEmail({this.data})
		: super(retrieve: 'send_email');

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
class SendEmailRequest {
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
	final String email;

	SendEmailRequest({this.usage, this.email});

	Map<String, dynamic> toJson() =>
		{
			'email': email,
			'usage': usage
		};

	String toString() {
		String str = 'map[email:' + email +
			' usage:' + usage.toString() + ']';

		return str;
	}
}
