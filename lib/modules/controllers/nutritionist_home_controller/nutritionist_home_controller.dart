import 'package:diet_and_control/modules/controllers/new_patient_controller/new_patient_controller.dart';
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
  final RxList chats = [].obs;

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
  Future getChats() async {
    chats.clear();
    loading.value = true;
    dio.Response response;
    try {      
      response = await NutritionistHomeProvider().getChats();
      logger.i(response.data);
      for (var chat in response.data) {
        chats.add(chat);
      }
      loading.value = false;
    } on Exception catch (e) {
      logger.e(e);
      loading.value = false;
    }
  }

  void logoutUser() {
    patients.value = [];
    Get.find<NewPatientController>().clearSpaces();
    Get.offAll(Login());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
