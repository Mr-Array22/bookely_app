import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioErrorType.response:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was Canceled ');

      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('UnExcepted Error,Please try again');
      
      default:
        return ServerFailure('Opps There was an Error,Please try again');
    
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 401) {
      return ServerFailure('Unauthorized');
    } else if (statusCode == 403) {
      return ServerFailure('Forbidden');
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found,Please try again later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error,Please try again later');
    } else if (statusCode == 503) {
      return ServerFailure('Service Unavailable,,Please try again later');
    } else {
      return ServerFailure('Unknown Error,,Please try again later');
    }
  }
}
