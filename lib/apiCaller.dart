import 'package:apihandler/exception_info.dart';

class ApiCaller {
  static final ApiCaller _instance = ApiCaller._internal();

  ApiCaller._internal();

  /// init method
  factory ApiCaller() {
    return _instance;
  }

  /// handleRespError
  handleRespError(resp, tag) {
    if (resp == null) {
      throw NetHandlerException(errNo: NetHandlerError.errResponseNull);
    } else if (resp.result != null && resp.result != 0) {
      var msg = resp.comment + '(' + resp.result.toString() + ')';
      throw NetHandlerException(
          errNo: NetHandlerError.errResponseFail,
          errNoSub: resp.result,
          errMessage: msg,
          pinCodeErrCount:
              resp.pinCodeErrCount != null ? resp.pinCodeErrCount : 0);
    }
  }
}

/// you can use this apiCaller
ApiCaller apiCaller = ApiCaller();
