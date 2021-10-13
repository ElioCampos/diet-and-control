import 'package:diet_and_control/modules/providers/view_status_provider/view_status_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ViewStatusController {
  final logger = Logger(
    printer: PrettyPrinter(),
  );
  final RxList planTrace = [].obs;

  Future getPlanTrace(int planId) async {
    dio.Response response;
    int count = 1;
    try {
      planTrace.value = [];
      response = await ViewStatusProvider().getPlanTrace(planId);
      logger.i(response.data);
      if (response.statusCode == 200) {
        for (int i = 1; i < 8; i++) {
          for (var item in response.data) {
            if (item["day"] == i) {
              planTrace.add(item);
            }
          }
        }
      } else {
        logger.i(response.statusCode);
      }
    } on Exception catch (e) {
      logger.e(e);
    }
  }
}
