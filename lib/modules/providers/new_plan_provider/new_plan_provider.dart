import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/modules/controllers/new_plan_controller/new_plan_controller.dart';
import 'package:diet_and_control/utils/http_api.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as global;
import 'package:logger/logger.dart';

class NewPlanProvider {
  final logger = Logger(
    printer: PrettyPrinter(),
  );

  Future<Response> getPlan(
      {required int carbo, required int protein, required int fat}) async {
    final _dio = Dio();
    final Response response;
    String token = global.Get.find<AuthController>().token.value;
    int patientId = global.Get.find<AuthController>().patientId.value;
    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;

    try {
      response = await _dio.post(
        "/patients/$patientId/treatments/",
        data: {"protein": protein, "carbohydrate": carbo, "fat": fat},
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

  Future<Response> assignPlan(int treatmentId, menuList) async {
    final _dio = Dio();
    final Response response;
    int doctorId = global.Get.find<AuthController>().userId.value;
    int patientId = global.Get.find<AuthController>().patientId.value;
    String token = global.Get.find<AuthController>().token.value;
    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;
    try {
      response = await _dio.post(
        "/doctors/$doctorId/patients/$patientId/personal_treatments/",
        data: {"menus": menuList, "selected_treatment": treatmentId},
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


Future<Response> getMealSchedule(String schedule) async {
    final _dio = Dio();
    final Response response;
    String token = global.Get.find<AuthController>().token.value;
    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;

    try {
      response = await _dio.get(
        "/meals_schedule/schedule=$schedule",
      );
    } on DioError catch (e) {
      logger.e(e.response);
      throw Exception(e);
    }
    logger.i(response.data);
    return response;
  }

 Future<Response> updateTreatment(int treatmentId, menuList) async {
    final _dio = Dio();
    final Response response;
    String token = global.Get.find<AuthController>().token.value;
    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;

    try {
      response = await _dio.put(
        "/personal_treatments/$treatmentId/",
        data: {"menus": menuList}, 
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
