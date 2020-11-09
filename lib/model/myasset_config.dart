import 'dart:convert';


class MyAssetConfig {
    final String id;
    final String name;
    final int digits;
    final String type;
    bool enable;
    bool isDefault;

    MyAssetConfig({this.id, this.name, this.digits, this.type, this.enable, this.isDefault});

    static MyAssetConfig Copy(MyAssetConfig clone) {
        MyAssetConfig newAsset = new MyAssetConfig(
            id: clone.id, name: clone.name,
            digits: clone.digits, type: clone.type,
            enable: clone.enable,
            isDefault: clone.isDefault
        );

        return newAsset;
    }

    Map<String, dynamic> toJson2() =>
        {
            'id': id,
            'name': name,
            'digits': digits,
            'type': type,
            'enable': enable,
            'isDefault': isDefault
        };

    MyAssetConfig.fromJson2(Map<String, dynamic> json) :
            id = json['id'],
            name = json['name'],
            digits = json['digits'] as int,
            type = json['type'],
            enable = json['enable'] as bool,
            isDefault = json['isDefault'] as bool;

    static List<MyAssetConfig> fromJsons2(List<dynamic> jsons) {
        // MyLog.d('MyAssetConfig.fromJsons');
        if (jsons == null)
            return null;

        List<MyAssetConfig> acl = new List<MyAssetConfig>();
        jsons.forEach((item) {
            MyAssetConfig ac = MyAssetConfig.fromJson2(item);
            acl.add(ac);
        });

        return acl;
    }

    static Map<String, MyAssetConfig> fromJsons3(Map<String,dynamic> jsons) {
        // MyLog.d('MyAssetConfig.fromJsons');
        if (jsons == null)
            return null;

        Map<String, MyAssetConfig> acl = new Map<String,MyAssetConfig>();
        jsons.forEach((key,value){
            MyAssetConfig ac = MyAssetConfig.fromJson2(value);
            acl[key] = ac;
        });

        return acl;
    }

    String toString() {
        String str;
        str  = ' id:' + id;
        str += ' name:' + name;
        str += ' digits:' + digits.toString();
        str += ' type:' + type;
        return str;
    }

    MyAssetConfig.fromJson(Map<String, dynamic> json) :
            id = json['id'],
            name = json['name'],
            digits = json['digits'] as int,
            type = json['type'];

    static List<MyAssetConfig> fromJsons(List<dynamic> jsons) {

        if (jsons == null)
            return null;

        List<MyAssetConfig> acl = new List<MyAssetConfig>();
        jsons.forEach((item) {
            MyAssetConfig ac = MyAssetConfig.fromJson(item);
            acl.add(ac);
        });

        return acl;
    }

    static String listToString(List<MyAssetConfig> acs) {
        if (acs == null || acs.length == 0) {
            return '[]';
        }

        String jsonStr = '[';
        acs.forEach((item) {
            var myJson = item.toJson2();
            String str = jsonEncode(myJson);
            // MyLog.d('MyAssetConfig.listToString item=' + str);
            jsonStr += str + ',';
        });
        jsonStr = jsonStr.substring(0, jsonStr.length-1);
        jsonStr += ']';
         ('MyAssetConfig.listToString str=' + jsonStr);
        return jsonStr;
    }

    static List<MyAssetConfig> stringToList(String str) {
        if (str == null || str.length == 0)
            return null;
        var myJson = jsonDecode(str);
        // MyLog.d('MyAssetConfig.stringToList str=' + str);
        List<MyAssetConfig> mcs = MyAssetConfig.fromJsons2(myJson);
        /*
        mcs.forEach((item) {
            MyLog.d('MyAssetConfig.stringToList item = ' + item.name + ',' + item.digits.toString());
        });

         */

        return mcs;
    }

    static String mapToString(Map<String, MyAssetConfig> acs) {
        if (acs == null || acs.length == 0) {
            return '{}';
        }

        String jsonStr = '{';
        acs.forEach((key,value) {
            var myJson = value.toJson2();
            String str = jsonEncode(myJson);
            // MyLog.d('MyAssetConfig.listToString item=' + str);
            jsonStr +=  '"${key}"' + ':' + str + ',';
        });
        jsonStr = jsonStr.substring(0, jsonStr.length-1);
        jsonStr += '}';

        return jsonStr;
    }

    static Map<String, MyAssetConfig> stringToMap(String str) {
        if (str == null || str.length == 0)
            return null;
        var myJson = jsonDecode(str);

        Map<String, MyAssetConfig> mcs = MyAssetConfig.fromJsons3(myJson);
        /*
        mcs.forEach((item) {
            MyLog.d('MyAssetConfig.stringToList item = ' + item.name + ',' + item.digits.toString());
        });

         */

        return mcs;
    }

}
