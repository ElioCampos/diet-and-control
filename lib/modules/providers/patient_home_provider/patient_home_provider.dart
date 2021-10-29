import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/modules/controllers/patient_home_controller/patient_home_controller.dart';
import 'package:diet_and_control/utils/http_api.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as global;
import 'package:logger/logger.dart';

class PatientHomeProvider {
  final logger = Logger(
    printer: PrettyPrinter(),
  );

  Future<Response> getPatientPlan(int userId) async {
    final _dio = Dio();
    final Response response;
    String token = global.Get.find<AuthController>().token.value;
    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;
    try {
      response = await _dio.get(
        "/patients/$userId/personal_treatments/",
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
    } on DioError catch (e) {
      logger.e(e.response);
      throw Exception(e);
    }
    logger.i(response.data);
    return response;
  }



Future<Response> getPatientTrace() async {
    final _dio = Dio();
    final Response response;
    String token = global.Get.find<AuthController>().token.value;
    int personalTreatmentId = global.Get.find<PatientHomeController>().personalTreatmentId.value;
    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;
    try {
      response = await _dio.get(
        "/treatments/$personalTreatmentId/personal_treatment_trace/",
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
    } on DioError catch (e) {
      logger.e(e.response);
      throw Exception(e);
    }
    logger.i(response.data);
    return response;
  }

  Future<Response> updateTrace(int treatmentId) async {
    final _dio = Dio();
    final Response response;    
    String token = global.Get.find<AuthController>().token.value;
    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;
    try {
      response = await _dio.put(
        "/personal_treatment_trace/$treatmentId/",
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
    } on DioError catch (e) {
      logger.e(e.response);
      throw Exception(e);
    }
    logger.i(response.data);
    return response;
  }



  Future<Response> getPatientLog(int patientId) async {
    final _dio = Dio();
    final Response response;
    String token = global.Get.find<AuthController>().token.value;
    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;
    try {
      response = await _dio.get(
        "/patients/$patientId/",
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
    } on DioError catch (e) {
      logger.e(e.response);
      throw Exception(e);
    }
    logger.i(response.data);
    return response;
  }


  Future<Response> getPatientInfo() async {
    final _dio = Dio();
    final Response response;
    String token = global.Get.find<AuthController>().token.value;
    int patientId = global.Get.find<AuthController>().userId.value;
    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;
    try {
      response = await _dio.get(
        "/patients/$patientId/",
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
    } on DioError catch (e) {
      logger.e(e.response);
      throw Exception(e);
    }
    logger.i(response.data);
    return response;
  }



}
