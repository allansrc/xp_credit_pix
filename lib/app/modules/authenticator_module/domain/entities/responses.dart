enum ApiProductList  {openapiopenbanking, openapibroker, openapibanking}

class CredentialsResponse {
  String developerEmail;
  String organizationName;
  int refreshTokenExpiresIn;
  List<String> apiProductList;
  String tokenType;
  String applicationName;
  String status;

 
  CredentialsResponse({
   
    this.developerEmail = '',
    this.organizationName = '',
    this.refreshTokenExpiresIn = 0,
    this.apiProductList =const [],

});

  CredentialsResponse copyWith({
   
  }) {
    return CredentialsResponse(
    
    );
  }
}
