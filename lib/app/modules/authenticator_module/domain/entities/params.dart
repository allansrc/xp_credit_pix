class CredentialsParam {
  String clientID;
  String securityKey;
  CredentialsParam({
    this.clientID = '',
    this.securityKey = '',
  });

  CredentialsParam copyWith({
    String? clientID,
    String? securityKey,
  }) =>
      CredentialsParam(
        clientID: clientID ?? this.clientID,
        securityKey: securityKey ?? this.securityKey,
      );
}
