abstract class IFailureError implements Exception {
  final String? message;
  IFailureError({this.message});
}

class FailureError extends IFailureError {
  final String? message;
  FailureError({this.message});
}

class MapperErrorActivityError extends IFailureError {
  final String? message;
  MapperErrorActivityError({this.message});
}
