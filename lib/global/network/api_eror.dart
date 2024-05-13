// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class ApiError {
  final String errorCode;
  final String errorMessage;

  ApiError({
    required this.errorCode,
    required this.errorMessage,
  });

  factory ApiError.fromDioError(Object error) {
    String errorMessage = '';
    String errorCode = '';

    if (error is DioException) {
      var dioError = error;
      switch (dioError.type) {
        case DioExceptionType.cancel:
          errorMessage = 'Request was cancelled';
          errorCode = 'REQUEST_CANCELLED';
          break;
        case DioExceptionType.connectionTimeout:
          errorMessage = 'Connection timeout';
          errorCode = 'CONNECTION_TIMEOUT';
          break;
        case DioExceptionType.connectionError:
          errorMessage = 'Oops! Check your connection';
          errorCode = 'NETWORK_ERROR';
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Receive timeout in connection';
          errorCode = 'RECEIVE_TIMEOUT';
          break;
        case DioExceptionType.unknown || DioExceptionType.badResponse:
          if (dioError.response!.statusCode! >= 500) {
            errorMessage = 'Unable to process the request, Retry!';
            errorCode = 'SERVER_FAILURE';
          } else {
            final errorData = extractDataFromResponse(error.response);
            errorCode = errorData['code'] ?? '';
            errorMessage = errorData['message'] ?? '';
          }
          break;
        case DioExceptionType.sendTimeout:
          errorMessage = 'Send timeout in connection';
          errorCode = 'SEND_TIMEOUT';
          break;
        case DioExceptionType.badCertificate:
          errorMessage = 'Bad certificate';
          errorCode = 'BAD_CERTIFICATE';
      }
    } else {
      errorMessage = _handleException(error);
    }
    log('errorCode: $errorCode, errorMessage: $errorMessage');
    return ApiError(errorCode: errorCode, errorMessage: errorMessage);
  }

  static String _handleException(dynamic exception) {
    if (exception is String) {
      return 'Unable to process the request, Retry!';
    } else if (exception is ApiError) {
      return exception.errorMessage;
    } else {
      return 'Unable to process the request, Retry!';
    }
  }

  static Map<String, String> extractDataFromResponse(Response? response) {
    var message = '';
    String errorCode = '';

    var decodeResponse = response!.data;

    if (response.data != null) {
      if (decodeResponse.runtimeType == String) {
        try {
          var jsonResponse = jsonDecode(decodeResponse) as Map<String, dynamic>;
          message = jsonResponse['message'];
          errorCode = jsonResponse['code'];
        } catch (e) {
          message = 'Unable to process the request, Retry!';
        }
      } else if (decodeResponse['message'] != null) {
        message = decodeResponse['message'];
      } else if (decodeResponse['error'] != null) {
        message = decodeResponse['error'];
      } else {
        message = 'An unexpected error occurred, please try again';
      }
      errorCode = decodeResponse['code'] ?? 'UNEXPECTED_ERROR';
    } else {
      message = response.statusMessage ?? '';
    }

    return {'message': message, 'code': errorCode};
  }

  @override
  String toString() =>
      'ApiError(errorCode: $errorCode, errorMessage: $errorMessage)';
}
