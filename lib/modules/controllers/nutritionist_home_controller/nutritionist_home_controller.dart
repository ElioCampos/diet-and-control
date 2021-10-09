import 'package:diet_and_control/modules/providers/nutritionist_home_provider/nutritionist_home_provider.dart';
import 'package:diet_and_control/modules/views/auth/login.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart' as dio;

class NutritionistHomeController extends GetxController {
  final logger = Logger(
    printer: PrettyPrinter(),
  );

  final RxBool loading = false.obs;
  final RxList patients = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future getPatients() async {
    List ids = [];
    loading.value = true;
    dio.Response response;
    try {
      patients.value = [];
      response = await NutritionistHomeProvider().getPatients();
      logger.i(response.data);
      for (var patient in response.data) {
        if (!ids.contains(patient["user"])) {
          patients.add(patient);
        }
        ids.add(patient["user"]);
      }
      loading.value = false;
    } on Exception catch (e) {
      logger.e(e);
      loading.value = false;
    }
  }

  void logoutUser() {
    patients.value = [];
    Get.offAll(Login());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
