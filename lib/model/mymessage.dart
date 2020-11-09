import 'dart:convert';

/*
	Channelid        string `json:"channelid"`
	Id               uint64 `json:"id"`
	Type             string `json:"type"`
	Content          string `json:"content"`
	Url              string `json:"url"`
	Title            string `json:"title"`
	Description      string `json:"description"`
	Vid              uint64 `json:"vid"`
	CreateTime       string `json:"create_time"`
	UpdateTime       string `json:"update_time"`
	ClientCreateTime string `json:"client_create_time"`
	ClientUpdateTime string `json:"client_update_time"`
	Status           string `json:"status"`
	Owner            string `json:"owner"`
	Appid            string `json:"appid"`
 */
class MyMessage{
    String channelId;
    int id;
    String type;
    String content;
    String url;
    String title;
    String description;
    int vid;
    String createTime;
    String updateTime;
    String clientCreateTime;
    String clientUpdateTime;
    String status;
    String owner;
    String appId;
    // addon begin
	String ownerNo;
	int timeStamp;
	String orderId;
	String assetName;
	String amount;
	String fee;
	String orderType;
	String orderStatus;
	String fromUser;
	String fromUserId;
	String fromUserNo;
	String fromPhoneCode;
	String fromPhone;
	String fromAddress;
	String toUser;
	String toUserId;
	String toUserNo;
	String toPhoneCode;
	String toPhone;
	String toAddress;
	String merchantId;
	String txHash;
	String jsonStr;
	// addon end
    bool read;

    MyMessage({this.channelId, this.id, this.type, this.content, this.url,
        this.title, this.description, this.vid, this.createTime, this.updateTime,
        this.clientCreateTime, this.clientUpdateTime, this.status, this.owner, this.appId,
		this.ownerNo, this.timeStamp, this.orderId, this.assetName, this.amount,
		this.fee, this.orderType, this.orderStatus,
		this.fromUser, this.fromUserId, this.fromUserNo, this.fromPhoneCode, this.fromPhone, this.fromAddress,
		this.toUser, this.toUserId, this.toUserNo, this.toPhoneCode, this.toPhone, this.toAddress,
		this.merchantId, this.txHash,
		this.read});

    Map<String, dynamic> toJson() =>
        {
            'channelid': channelId,
            'id': id,
            'type': type,
            'content' : content,
            'url': url,
            'title': title,
            'description': description,
            'vid': vid,
            'create_time': createTime,
            'update_time': updateTime,
            'client_create_time': clientCreateTime,
            'client_update_time': clientUpdateTime,
            'status': status,
            'owner': owner,
            'appid': appId,
	 		'ownerno': ownerNo,
			'time_stamp': timeStamp,
			'orderid': orderId,
			'asset_name': assetName,
			'amount': amount,
			'fee': fee,
			'order_type': orderType,
			'order_status': orderStatus,
			'from_user': fromUser,
			'from_userid': fromUserId,
			'from_userno': fromUserNo,
			'from_phone_code': fromPhoneCode,
			'from_phone': fromPhone,
			'from_address': fromAddress,
			'to_user': toUser,
			'to_userid': toUserId,
			'to_userno': toUserNo,
			'to_phone_code': toPhoneCode,
			'to_phone': toPhone,
			'to_address': toAddress,
			'merchantid': merchantId,
			'txhash': txHash,
			'read': read
        };

    MyMessage.fromJson(Map<String, dynamic> json) :
            channelId = json['channelid'],
            id = json['id'] as int,
            type = json['type'],
            content = json['content'],
            url = json['url'],
            title = json['title'],
            description = json['description'],
            vid = json['vid'] as int,
            createTime = json['create_time'],
            updateTime = json['update_time'],
            clientCreateTime = json['client_create_time'],
            clientUpdateTime = json['client_update_time'],
            status = json['status'],
            owner = json['owner'],
            appId = json['appid'],
			ownerNo = json['ownerno'],
			timeStamp = json['time_stamp'] as int,
			orderId = json['orderid'],
			assetName = json['asset_name'],
			amount = json['amount'],
			fee = json['fee'],
			orderType = json['order_type'],
			orderStatus = json['order_status'],
			fromUser = json['from_user'],
			fromUserId = json['from_userid'],
			fromUserNo = json['from_userno'],
			fromPhoneCode = json['from_phone_code'],
			fromPhone = json['from_phone'],
			fromAddress = json['from_address'],
			toUser = json['to_user'],
			toUserId = json['to_userid'],
			toUserNo = json['to_userno'],
			toPhoneCode = json['to_phone_code'],
			toPhone = json['to_phone'],
			toAddress = json['to_address'],
			merchantId = json['merchantid'],
			txHash = json['txhash'],
			read = json['read'] as bool;

    static List<MyMessage> fromJsons(List<dynamic> jsons) {
        if (jsons == null)
            return null;

        List<MyMessage> msgs = new List<MyMessage>();
        jsons.forEach((item) {
            MyMessage ua = MyMessage.fromJson(item);
            ua.jsonStr = jsonEncode(item);
            msgs.add(ua);
        });

        return msgs;
    }

    static String listToString(List<MyMessage> msgs) {
        if (msgs == null || msgs.length == 0) {
            return '[]';
        }

        String jsonStr = '[';
        msgs.forEach((msg) {
           var myJson = msg.toJson();
           String str = jsonEncode(myJson);
           // MyLog.d('MyMessage.listToString item=' + str);
           jsonStr += str + ',';
        });
        jsonStr = jsonStr.substring(0, jsonStr.length-1);
        jsonStr += ']';
        return jsonStr;
    }

    static List<MyMessage> stringToList(String str) {
        if (str == null || str.length == 0)
            return null;
        var myJson = jsonDecode(str);
        List<MyMessage> mfs = MyMessage.fromJsons(myJson);
        return mfs;
    }

}
