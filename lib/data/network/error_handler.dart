import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hotel_booking/presentaion/resources/strings_manager.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSource.defaultt.getFailure();
    }
  }
  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.connectionTimeOut.getFailure();

      case DioErrorType.sendTimeout:
        return DataSource.sendTimeOut.getFailure();

      case DioErrorType.receiveTimeout:
        return DataSource.recieveTimeOut.getFailure();

      case DioErrorType.response:
        if (error.response != null &&
            error.response!.data["status"] != null &&
            error.response!.data["message"] != null) {
          return Failure(
            code: error.response!.data["status"],
            message: error.response!.data["message"],
          );
        } else {
          return DataSource.defaultt.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.cancel.getFailure();

      case DioErrorType.other:
        return DataSource.defaultt.getFailure();
    }
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unAuthorized,
  notFound,
  internalServerError,
  connectionTimeOut,
  cancel,
  recieveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  defaultt,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(
            code: ResponseCode.success, message: ResponseMessage.success.tr());
      case DataSource.noContent:
        return Failure(
            code: ResponseCode.noContent,
            message: ResponseMessage.noContent.tr());
      case DataSource.badRequest:
        return Failure(
            code: ResponseCode.badRequest,
            message: ResponseMessage.badRequest.tr());
      case DataSource.forbidden:
        return Failure(
            code: ResponseCode.forbidden,
            message: ResponseMessage.forbidden.tr());
      case DataSource.unAuthorized:
        return Failure(
            code: ResponseCode.unAuthorized,
            message: ResponseMessage.unAuthorized.tr());
      case DataSource.internalServerError:
        return Failure(
            code: ResponseCode.internalServerError,
            message: ResponseMessage.internalServerError.tr());
      case DataSource.connectionTimeOut:
        return Failure(
            code: ResponseCode.connectionTimeOut,
            message: ResponseMessage.connectionTimeOut.tr());
      case DataSource.cancel:
        return Failure(
            code: ResponseCode.cancel, message: ResponseMessage.cancel.tr());
      case DataSource.recieveTimeOut:
        return Failure(
            code: ResponseCode.receiveTimeOut,
            message: ResponseMessage.receiveTimeOut.tr());
      case DataSource.sendTimeOut:
        return Failure(
            code: ResponseCode.sendTimeOut,
            message: ResponseMessage.sendTimeOut.tr());
      case DataSource.cacheError:
        return Failure(
            code: ResponseCode.cacheError,
            message: ResponseMessage.cacheError.tr());
      case DataSource.noInternetConnection:
        return Failure(
            code: ResponseCode.noInternetConnection,
            message: ResponseMessage.noInternetConnection.tr());
      case DataSource.notFound:
        return Failure(
            code: ResponseCode.notFound,
            message: ResponseMessage.notFound.tr());
      case DataSource.defaultt:
        return Failure(
            code: ResponseCode.defaultt,
            message: ResponseMessage.defaultt.tr());
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no contect)
  static const int badRequest = 400; // failure, API rejected request
  static const int unAuthorized = 401; // failure, user is't authorized
  static const int forbidden = 403; // failure, API rejected request
  static const int notFound = 404;
  static const int internalServerError = 500;

  // local status code
  static const int connectionTimeOut = -1;
  static const int cancel = -2;
  static const int receiveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultt = -7;
}

class ResponseMessage {
  static const String success = AppStrings.success;
  static const String noContent = AppStrings.success;
  static const String badRequest = AppStrings.badRequestError;
  static const String unAuthorized = AppStrings.unauthorizedError;
  static const String forbidden = AppStrings.forbiddenError;
  static const String internalServerError = AppStrings.internalServerError;
  static const String notFound = AppStrings.notFoundError;

  // local response messages
  static const String connectionTimeOut = AppStrings.timeoutError;
  static const String cancel = AppStrings.defaultError;
  static const String receiveTimeOut = AppStrings.timeoutError;
  static const String sendTimeOut = AppStrings.timeoutError;
  static const String cacheError = AppStrings.cacheError;
  static const String noInternetConnection = AppStrings.noInternetError;
  static const String defaultt = AppStrings.defaultError;
}
