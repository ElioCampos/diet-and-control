import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/utils/http_api.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as global;
import 'package:logger/logger.dart';

class PatientHomeProvider {
  final logger = Logger(
    printer: PrettyPrinter(),
  );

  Future<Response> getPatientPlan() async {
    final _dio = Dio();
    final Response response;
    String token = global.Get.find<AuthController>().token.value;
    _dio.options.headers = {"Authorization": "Bearer $token"};
    _dio.options.baseUrl = HttpInfo.url;

    try {
      response = await _dio.post(
        "/patients/1/treatments/",
        data: {"protein": 300, "carbohydrate": 400, "fat": 500},
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
