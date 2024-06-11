import 'package:dio/dio.dart';

abstract class Failure {
  final String messError;
  Failure({required this.messError});}
class ServerFailure extends Failure {
  ServerFailure({required super.messError});
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(messError: 'connection Timeout with Api service');
      case DioExceptionType.sendTimeout:
        return ServerFailure(messError: 'send Timeout with Api service');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(messError: 'receive Timeout with Api service');
      case DioExceptionType.badCertificate:
        return ServerFailure(messError: 'badCertificate with Api service');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(messError: 'Request Api service was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure(messError: 'No internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            messError: 'Oops there was an errors , please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(
          messError: 'Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure(
          messError: 'There is a problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(messError: response['error']['message']);
    } else {
      return ServerFailure(messError: 'There was an error , please try again');
    }
  }
}
