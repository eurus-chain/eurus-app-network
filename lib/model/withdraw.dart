import 'retrieve.dart';


class RetrieveWithdraw extends Retrieve {
    final String name;

    final WithdrawRequest data;

    RetrieveWithdraw({this.data, this.name})
        : super(retrieve: 'withdraw');

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
        return obj;
    }
}

/*
	AssetName string `json:"asset_name"`
	Amount    string `json:"amount"`
	To        string `json:"to"` //withdraw to address
	PinCode   string `json:"pin_code"`
 */
class WithdrawRequest {
    final String assetName;
    final String toAddress;
    final String amount;
    final String pinCode;
    final String smsCode;
    final String googleCode;

    WithdrawRequest({this.assetName, this.toAddress, this.amount, this.pinCode,this.smsCode,this.googleCode});

    Map<String, dynamic> toJson() =>
        {
            'amount': amount,
            'asset_name': assetName,
            'pin_code': pinCode,
            'to': toAddress,
            'sms_code': smsCode??'',
            'google_code': googleCode??'',

        };

    String toString() {
        String str = 'map[amount:' + amount + ' asset_name:' + assetName +' google_code:' + (googleCode??'') +
            ' pin_code:' + pinCode +' sms_code:' + (smsCode??'') + ' to:' + toAddress + ']';
        return str;
    }
}
