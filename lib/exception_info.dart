/// NetHandlerError Type
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

/// NetHandlerException
class NetHandlerException implements Exception {
  final NetHandlerError errNo;
  final int? errNoSub;
  final String? errMessage;
  final int? pinCodeErrCount;

  /// init
  NetHandlerException({
    required this.errNo,
    this.errNoSub,
    this.errMessage,
    this.pinCodeErrCount,
  });

  NetHandlerError errorCode() {
    return this.errNo;
  }

  /// errorSub
  int? errorSub() {
    return this.errNoSub;
  }

  /// errorMessage
  String errorMessage() {
    if (this.errMessage != null && this.errMessage != '')
      return this.errMessage!;

    return this.errNo.toString();
  }
}
