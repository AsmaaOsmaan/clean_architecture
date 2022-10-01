import 'package:clean_architecture_app/data/network/failure.dart';
import 'package:dio/dio.dart';

class ErrorHandler {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
// dio error so its an error from response of the  api or from dio itself
      failure = _handleError(error);
    } else {
      //default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        // TODO: Handle this case.
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();

      case DioErrorType.receiveTimeout:
        return DataSource.RECIEVE_TIMEOUT.getFailure();

      case DioErrorType.response:
        // TODO: Handle this case.

        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return Failure(error.response?.statusCode ?? 0,
              error.response?.statusMessage ?? "");
        } else {
          return DataSource.DEFAULT.getFailure();
        }

        break;
      case DioErrorType.cancel:
        return DataSource.CANCLE.getFailure();

      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBEDDIN,
  UNAUTORITHED,
  NOT_FOUND,
  INTERNET_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCLE,
  SEND_TIMEOUT,
  RECIEVE_TIMEOUT,
  CACH_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with  no data
  static const int BAD_REQUEST = 400; // failure api rejected request
  static const int UNAUTORITHED = 401; // failure user is not authorized
  static const int FORBEDDIN = 403; //failure api rejected request

  static const int NOT_FOUND = 404;
  static const int INTERNET_SERVER_ERROR = 500; //failure crash in server side

  //LOCAL statues code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCLE = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACH_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  // static const int UNKNOWN=-7;
  static const int DEFAULT = -7;
}

extension DataSourceExtention on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);

      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);

      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);

      case DataSource.FORBEDDIN:
        return Failure(ResponseCode.FORBEDDIN, ResponseMessage.FORBEDDIN);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.UNAUTORITHED:
        return Failure(ResponseCode.UNAUTORITHED, ResponseMessage.UNAUTORITHED);

      case DataSource.CANCLE:
        return Failure(ResponseCode.CANCLE, ResponseMessage.CANCLE);
      case DataSource.INTERNET_SERVER_ERROR:
        return Failure(ResponseCode.INTERNET_SERVER_ERROR,
            ResponseMessage.INTERNET_SERVER_ERROR);

      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);

      case DataSource.CACH_ERROR:
        return Failure(ResponseCode.CACH_ERROR, ResponseMessage.CACH_ERROR);

      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);

      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFUALT);
    }
  }
}

class ResponseMessage {
  static const String SUCCESS = "success"; // success with data
  static const String NO_CONTENT = "success"; // success with  no data
  static const String BAD_REQUEST =
      "Bad request,please try again later"; // failure api rejected request
  static const String UNAUTORITHED =
      "user is unauthorized ,please try again later"; // failure user is not authorized
  static const String FORBEDDIN =
      "Forbeddin request,please try again later "; //failure api rejected request
  static const String NOT_FOUND =
      "some thing went wrong,please try again later "; //failure api rejected request

  //static const int NOT_FOUND=200;
  static const String INTERNET_SERVER_ERROR =
      "some thing went wrong ,try again later"; //failure crash in server side

  //LOCAL statues code
  static const String CONNECT_TIMEOUT = "time out error,try again later";
  static const String CANCLE = "Request was canceled,try again later";
  static const String RECIEVE_TIMEOUT = "time out error,try again later";
  static const String SEND_TIMEOUT = "time out error,try again later";
  static const String CACH_ERROR = "cache error,try again later";
  static const String NO_INTERNET_CONNECTION =
      "please check your internet connection";
  static const String DEFUALT = "some thing went wrong ";
}
