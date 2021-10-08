import 'package:diet_and_control/modules/controllers/new_plan_controller/new_plan_controller.dart';
import 'package:diet_and_control/modules/providers/patient_home_provider/patient_home_provider.dart';
import 'package:dio/dio.dart' as dio;

class PatientHomeController extends NewPlanController {
  Future getPatientPlan() async {
    loading.value = true;
    dio.Response response;
    try {
      response = await PatientHomeProvider().getPatientPlan();
      logger.i(response.data);
      if (response.statusCode == 200) {
        menus.value = response.data[0]["treatment"]["menus"];
        refreshMeals();
      } else {
        logger.i(response.statusCode);
        loading.value = false;
      }
    } on Exception catch (e) {
      logger.e(e);
      loading.value = false;
    }
  }

  selectDay(int i) {
    currentDay.value = i;
    refreshMeals();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
