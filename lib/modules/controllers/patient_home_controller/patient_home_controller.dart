import 'package:diet_and_control/modules/controllers/new_plan_controller/new_plan_controller.dart';
import 'package:diet_and_control/modules/providers/patient_home_provider/patient_home_provider.dart';
import 'package:dio/dio.dart' as dio;

class PatientHomeController extends NewPlanController {

  Future getPatientPlan() async {
    loading.value = true;
    dio.Response response;
    try {
      response = await PatientHomeProvider().getPatientPlan();
      if (response.statusCode == 201 || response.statusCode == 200) {
        menus.value = response.data["menus"];
        refreshMeals();
        loading.value = false;
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
