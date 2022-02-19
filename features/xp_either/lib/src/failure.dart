abstract class IXPFailure implements Exception {
  final String? message;
  IXPFailure({this.message});
}

abstract class EitherFailure implements Exception {
  final String? message;
  EitherFailure({this.message});
}
