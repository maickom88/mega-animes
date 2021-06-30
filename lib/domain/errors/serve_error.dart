import '../../core/errors/errors.dart';

class ServerError extends Failure {
  final String? message;

  ServerError({this.message});
}

class ListAnimesEmpty extends Failure {
  final String? message;

  ListAnimesEmpty({this.message});
}
