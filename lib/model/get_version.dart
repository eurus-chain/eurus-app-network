import 'dart:convert' as convert;
class GetVersionResponse {
  String version;
  bool force;

  GetVersionResponse({this.version});

  @override
  GetVersionResponse.fromJson(String json) :
        version = json != null ?convert.jsonDecode(json)['version']:"",
        force = json != null ?convert.jsonDecode(json)['force']:"";
}