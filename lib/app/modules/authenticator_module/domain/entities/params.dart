class CredentialsParam {
  String clientID;
  String securityKey;
  String accessToken;
  CredentialsParam({
    this.clientID = '',
    this.securityKey = '',
    this.accessToken = '',
  });

  CredentialsParam copyWith({
    String? clientID,
    String? securityKey,
    String? accessToken,
  }) =>
      CredentialsParam(
        clientID: clientID ?? this.clientID,
        securityKey: securityKey ?? this.securityKey,
        accessToken: accessToken ?? this.accessToken,
      );
}
