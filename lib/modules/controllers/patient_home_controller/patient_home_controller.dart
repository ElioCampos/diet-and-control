import 'package:diet_and_control/modules/controllers/new_plan_controller/new_plan_controller.dart';
import 'package:diet_and_control/modules/providers/patient_home_provider/patient_home_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class PatientHomeController extends NewPlanController {
  final RxInt personalTreatmentId = 0.obs;
  final RxList traceIds = [].obs;
  final RxInt monday = 0.obs;

  Future getPatientPlan(int userId, bool fromDoctor) async {
    loading.value = true;
    dio.Response response;
    try {
      response = await PatientHomeProvider().getPatientPlan(userId);
      logger.i(response.data);
      if (response.statusCode == 200) {
        menus.value = response.data[0]["treatment"]["menus"];
        personalTreatmentId.value = response.data[0]["id"];
        refreshMeals();
        if (!fromDoctor) {
          getPatientTraces();
        }
      } else {
        logger.i(response.statusCode);
        loading.value = false;
      }
    } on Exception catch (e) {
      logger.e(e);
      loading.value = false;
    }
  }

  Future getPatientTraces() async {
    loading.value = true;
    dio.Response response;
    try {
      response = await PatientHomeProvider().getPatientTrace();
      logger.i(response.data);
      if (response.statusCode == 200) {
        traceIds.value = response.data;
        traceIds.sort((a, b) => a["day"].compareTo(b["day"]));
      } else {
        logger.i(response.statusCode);
        loading.value = false;
      }
    } on Exception catch (e) {
      logger.e(e);
      loading.value = false;
    }
  }

  Future updateTrace(int treatmentId) async {
    loading.value = true;
    dio.Response response;
    try {
      response = await PatientHomeProvider().updateTrace(treatmentId);
      logger.i(response.data);
      if (response.statusCode == 200) {
        getPatientTraces();
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
