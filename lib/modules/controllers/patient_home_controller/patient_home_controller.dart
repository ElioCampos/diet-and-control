import 'package:diet_and_control/modules/controllers/new_plan_controller/new_plan_controller.dart';
import 'package:diet_and_control/modules/controllers/view_status_controller/view_status_controller.dart';
import 'package:diet_and_control/modules/providers/patient_home_provider/patient_home_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class PatientHomeController extends NewPlanController {
  final RxInt personalTreatmentId = 0.obs;
  final RxList traceIds = [].obs;
  final RxList patientLog = [].obs;
  final RxInt monday = 0.obs;
  final RxBool noPlan = false.obs;

  Future getPatientPlan(int userId, bool fromDoctor) async {
    loading.value = true;
    dio.Response response;
    try {
      response = await PatientHomeProvider().getPatientPlan(userId);
      logger.i(response.data);
      if (response.statusCode == 200) {
        if (response.data.length >= 1) {
          noPlan.value = false;
          menus.value = response.data[0]["treatment"]["menus"];
          menus.sort((a, b) => a["day"].compareTo(b["day"]));
                

          personalTreatmentId.value = response.data[0]["id"];
          personal_treatmentId.value = personalTreatmentId.value ;
          if (fromDoctor) {
            await Get.find<ViewStatusController>()
                .getPlanTrace(personalTreatmentId.value);
          }
          refreshMeals();
          if (!fromDoctor) {
            await getPatientTraces();
          }
          loading.value = false;
        }
        else {
          noPlan.value = true;
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

  Future getPatientLog(int patientId) async {
    dio.Response response;
    try {
      response = await PatientHomeProvider().getPatientLog(patientId);
      logger.i(response.data);
      if (response.statusCode == 200) {
        patientLog.value = response.data;
      } else {
        logger.i(response.statusCode);
      }
    } on Exception catch (e) {
      logger.e(e);
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
