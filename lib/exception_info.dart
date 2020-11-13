enum NetHandlerError {
  errEmptyName,
  errEmptyPhone,
  errEmptyPhoneCode,
  errEmptySms,
  errEmptyPassword,
  errEmptyConfirm,
  errEmptyToken,
  errEmptySymbol,
  errEmptyFriendPhoneCode,
  errEmptyFriendPhone,
  errEmptyAmount,
  errEmptyPinCode,
  errEmptyAvatarBody,
  errEmptyAvatarId,
  errEmptyAddress,
  errEmptyUserNo,
  errEmptyFriendUserNo,
  errNotMatchPassword,
  errResponseNull,
  errResponseFail,
  errNoPrivateKey,
  errDataLoading,
  errEmail,
}

class NetHandlerException implements Exception {
  final NetHandlerError errNo;
  final int errNoSub;
  final String errMessage;
  final int pinCodeErrCount;
  NetHandlerException({this.errNo, this.errNoSub, this.errMessage, this.pinCodeErrCount});

  NetHandlerError errorCode() {
    return this.errNo;
  }

  int errorSub() {
    return this.errNoSub;
  }

  String errorMessage() {
    if (this.errMessage != null && this.errMessage != '')
      return this.errMessage;

    return this.errNo.toString();
  }
}