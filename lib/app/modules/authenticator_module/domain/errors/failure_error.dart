abstract class IFailureError implements Exception {
  final String? message;
  IFailureError({this.message});
}
