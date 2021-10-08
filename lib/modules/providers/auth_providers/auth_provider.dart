import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/utils/http_api.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as global;
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

  Future<Response> createDoctorProfile({
    required int userId,
    required String firstName,
    required String lastName,
  }) async {
    final _dio = Dio();
    final Response response;
    String token = global.Get.find<AuthController>().token.value;

    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;
    logger.e({
      "first_name": firstName,
      "last_name": lastName,
    });
    try {
      response = await _dio.post("/users/$userId/profiles/",
          data: {
            "first_name": firstName,
            "last_name": lastName,
            "birth_date": "1980-01-01",
            "phone": "999888777",
            "sex": true,
            "doi": "77777777",
            "type": "doctor"
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

  Future<Response> userInfo() async {
    final _dio = Dio();
    final Response response;
    String token = global.Get.find<AuthController>().token.value;
    int userId = global.Get.find<AuthController>().userId.value;
    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;
    try {
      response = await _dio.get("/profiles/$userId/",
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
