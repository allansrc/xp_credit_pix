enum ApiProductList { openapiopenbanking, openapibroker, openapibanking }

class CredentialsResponse {
  String developerEmail;
  String organizationName;
  int refreshTokenExpiresIn;
  List<String> apiProductList;
  String tokenType;
  String applicationName;
  String status;
  String accessToken;

  CredentialsResponse({
    this.developerEmail = '',
    this.organizationName = '',
    this.refreshTokenExpiresIn = 0,
    this.apiProductList = const [],
    this.tokenType = '',
    this.applicationName = '',
    this.status = '',
    this.accessToken = '',
  });

  CredentialsResponse copyWith({
    String? developerEmail,
    String? organizationName,
    int? refreshTokenExpiresIn,
    List<String>? apiProductList,
    String? tokenType,
    String? applicationName,
    String? status,
    String? accessToken,
  }) {
    return CredentialsResponse(
      status: status ?? this.status,
      tokenType: tokenType ?? this.tokenType,
      accessToken: accessToken ?? this.accessToken,
      developerEmail: developerEmail ?? this.developerEmail,
      apiProductList: apiProductList ?? this.apiProductList,
      applicationName: applicationName ?? this.applicationName,
      organizationName: organizationName ?? this.organizationName,
      refreshTokenExpiresIn: refreshTokenExpiresIn ?? this.refreshTokenExpiresIn,
    );
  }
}
