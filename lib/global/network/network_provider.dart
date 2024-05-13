import 'package:dio/dio.dart';
import 'package:pokedex_v2/global/network/api_eror.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum RequestMethod { get, post, put, patch, delete }

abstract class NetworkProvider {
  Future<Response?> call({
    required String path,
    required RequestMethod method,
    Map<String, dynamic>? queryParameters = const {},
    Options? options,
    dynamic body = const {},
  });
}

class NetworkProviderImpl extends NetworkProvider {
  Dio _getDioInstance() {
    final dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30)));

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
    return dio;
  }

  @override
  Future<Response?> call(
      {required String path,
      required RequestMethod method,
      Map<String, dynamic>? queryParameters = const {},
      Options? options,
      body = const {}}) async {
    Response? response;
    try {
      final dio = _getDioInstance();
      switch (method) {
        case RequestMethod.get:
          response = await dio.get(path, queryParameters: queryParameters);
          break;
        case RequestMethod.post:
          response = await dio.post(path,
              data: body, queryParameters: queryParameters);
          break;
        case RequestMethod.put:
          response =
              await dio.put(path, data: body, queryParameters: queryParameters);
          break;
        case RequestMethod.patch:
          response = await dio.patch(path,
              data: body, queryParameters: queryParameters);
          break;
        case RequestMethod.delete:
          response = await dio.delete(path, queryParameters: queryParameters);
          break;
        default:
          response = await dio.get(path, queryParameters: queryParameters);
          break;
      }
    } catch (e) {
      ApiError.fromDioError(e);
    }
    return response;
  }
}
