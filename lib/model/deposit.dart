import 'retrieve.dart';



class RetrieveDeposit extends Retrieve {
    final String name;

    final DepositRequest data;

    RetrieveDeposit({this.data, this.name})
        : super(retrieve: 'deposit');

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
	From      string `json:"from"` // on chain address
	To        string `json:"to"`   // on chain address
	Amount    string `json:"amount"`
 */
class DepositRequest {
    final String assetName;
    final String toAddress;
    final String amount;
    final String fromAddress;

    DepositRequest({this.assetName, this.toAddress, this.amount, this.fromAddress});

    Map<String, dynamic> toJson() =>
        {
            'amount': amount,
            'asset_name': assetName,
            'from': fromAddress,
            'to': toAddress,
        };

    String toString() {

        String str = 'map[amount:' + amount + ' asset_name:' + assetName +
            ' from:' + fromAddress + ' to:' + toAddress + ']';

        return str;
    }
}
