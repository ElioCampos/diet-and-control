import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/utils/http_api.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as global;
import 'package:logger/logger.dart';

class NutritionistHomeProvider {
  final logger = Logger(
    printer: PrettyPrinter(),
  );

  Future<Response> getPatients() async {
    final _dio = Dio();
    final Response response;
    String token = global.Get.find<AuthController>().token.value;
    int userId = global.Get.find<AuthController>().userId.value;
    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;

    try {
      response = await _dio.get(
        "/doctors/$userId/patients/",
      );
    } on DioError catch (e) {
      logger.e(e.response);
      throw Exception(e);
    }
    logger.i(response.data);
    return response;
  }
}
