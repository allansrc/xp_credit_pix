import 'package:xp_ob/app/core/contracts/errors/failure_error.dart';
import 'package:xp_ob/app/core/contracts/mappers/mapper_interface.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/responses.dart';

class CredentialsResponseMapper extends MapperI<CredentialsResponse> {
  @override
  Future<void> checkJson(Map<dynamic, dynamic> json) async {
    final jsonKeys = [
      'access_token',
      'api_product_list_json',
      'organization_name',
      'application_name',
      'developer.email',
      'token_type',
      'status',
    ];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        throw MapperErrorActivityError(message: '$key not found');
      }
    }
  }

  @override
  Future<CredentialsResponse> fromMap(Map<dynamic, dynamic> json) async {
    await checkJson(json);
    try {
      return CredentialsResponse(
        accessToken: json['access_token'] ?? '',
        apiProductList: json['api_product_list_json'] ?? '',
        organizationName: json['organization_name'] ?? '',
        applicationName: json['application_name'] ?? '',
        developerEmail: json['developer.email'] ?? '',
        tokenType: json['token_type'] ?? '',
        status: json['status'] ?? '',
      );
    } catch (e) {
      throw MapperErrorActivityError(message: 'Erro de serialização');
    }
  }

  @override
  Map toMap(CredentialsResponse object) {
    return {
      'access_token': object.accessToken,
      'api_product_list_json': object.apiProductList,
      'organization_name': object.organizationName,
      'application_name': object.applicationName,
    };
  }

  @override
  CredentialsResponse fromMapSync(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}
