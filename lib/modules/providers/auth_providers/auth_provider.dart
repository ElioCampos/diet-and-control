import 'package:diet_and_control/utils/http_api.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AuthProvider {
  final logger = Logger(
    printer: PrettyPrinter(),
  );

  Future<Response> getSession(String username, String password) async {
    final _dio = Dio();
    final Response response;
    _dio.options.headers = {};
    _dio.options.baseUrl = HttpInfo.url;

    try {
      response = await _dio.post(
        "/login/",
        data: {
          'username': username,
          'password': password,
        },
      );
    } on DioError catch (e) {
      logger.e(e.response);
      throw Exception(e);
    }
    logger.i(response.data);
    return response;
  }

  Future<Response> signUpUser({
    required String username,
    required String password,
    required String email,
  }) async {
    final _dio = Dio();
    final Response response;

    _dio.options.headers = {};
    _dio.options.baseUrl = HttpInfo.url;
    logger.e({
      "email": email,
      "password": password,
      "username": username,
    });
    try {
      response = await _dio.post("/register/",
          data: {
            "email": email,
            "password": password,
            "username": username,
          },
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ));
      logger.i(response.data);
    } on DioError catch (e) {
      logger.e(e.response);
      throw Exception(e);
    }

    return response;
  }
}
