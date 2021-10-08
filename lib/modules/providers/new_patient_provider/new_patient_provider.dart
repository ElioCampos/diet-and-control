import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/utils/http_api.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart' as global;

class NewPatientProvider {
  final logger = Logger(
    printer: PrettyPrinter(),
  );

  Future<Response> getHarmfulHabits() async {
    final _dio = Dio();
    final Response response;
    _dio.options.headers = {};
    _dio.options.baseUrl = HttpInfo.url;

    try {
      response = await _dio.get(
        "/harmful_habits/",
      );
    } on DioError catch (e) {
      logger.e(e.response);
      throw Exception(e);
    }
    logger.i(response.data);
    return response;
  }

  Future<Response> getIllnesses() async {
    final _dio = Dio();
    final Response response;
    _dio.options.headers = {};
    _dio.options.baseUrl = HttpInfo.url;

    try {
      response = await _dio.get(
        "/illnesess/",
      );
    } on DioError catch (e) {
      logger.e(e.response);
      throw Exception(e);
    }
    logger.i(response.data);
    return response;
  }

  Future<Response> createUserProfile({
    required int userId,
    required String firstName,
    required String lastName,
    required DateTime birthDate,
    required String phone,
    required bool sex,
    required String doi,
    required String type,
  }) async {
    final _dio = Dio();
    final Response response;
    String aux = "${birthDate.toLocal()}".split(' ')[0];
    aux = aux.split("-")[0] + '-' + aux.split("-")[1] + '-' + aux.split("-")[2];
    String token = global.Get.find<AuthController>().token.value;

    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;
    logger.e({
      "first_name": firstName,
      "last_name": lastName,
      "birth_date": aux,
      "phone": phone,
      "sex": sex,
      "doi": doi,
      "type": type
    });
    try {
      response = await _dio.post("/users/$userId/profiles/",
          data: {
            "first_name": firstName,
            "last_name": lastName,
            "birth_date": aux,
            "phone": phone,
            "sex": sex,
            "doi": doi,
            "type": type
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

  Future<Response> postIllness(
      {required int patientId, required int illnessId}) async {
    final _dio = Dio();
    final Response response;
    String token = global.Get.find<AuthController>().token.value;

    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;
    try {
      response = await _dio.post("/patients/$patientId/illnesses/$illnessId/",
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

  Future<Response> updateProfile(
      {required int patientId,
      required double imc,
      required double tmb,
      required double height,
      required double weight,
      required double arm,
      required double abdominal,
      required double hip}) async {
    final _dio = Dio();
    final Response response;
    String token = global.Get.find<AuthController>().token.value;

    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;
    try {
      response = await _dio.patch("/patients/$patientId/",
          data: {
            "height": height,
            "weight": weight,
            "arm": arm,
            "abdominal": abdominal,
            "hip": hip,
            "imc": imc,
            "tmb": tmb
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
