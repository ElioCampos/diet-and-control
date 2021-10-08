import 'package:diet_and_control/modules/controllers/new_patient_controller/new_patient_controller.dart';
import 'package:diet_and_control/modules/controllers/patient_home_controller/patient_home_controller.dart';
import 'package:diet_and_control/modules/providers/auth_providers/auth_provider.dart';
import 'package:diet_and_control/navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart' as dio;

class AuthController extends GetxController {
  final logger = Logger(
    printer: PrettyPrinter(),
  );

  final Rx<String> token = "".obs;
  final RxBool loading = false.obs;
  final RxInt userId = 0.obs;
  final RxMap userData = {}.obs;
  final RxInt patientId = 0.obs;

  //*Login

  late TextEditingController usernameController;
  late TextEditingController passwordController;

  String username = '';
  String password = '';

  //*SingUp
  late TextEditingController emailController;
  late TextEditingController repeatPasswordController;
  late TextEditingController nameController;

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    repeatPasswordController = TextEditingController();
    nameController = TextEditingController();
  }

  Future getSesion() async {
    dio.Response response;
    loading.value = true;
    try {
      response = await AuthProvider()
          .getSession(usernameController.text, passwordController.text);
      if (response.statusCode == 201 || response.statusCode == 200) {
        token.value = response.data["access"].toString();
        Map<String, dynamic> payload = Jwt.parseJwt(token.value);
        userId.value = payload["user_id"];
        await userInfo();
      } else {
        logger.i(response.statusCode);
      }
    } on Exception catch (e) {
      logger.e(e);
      loading.value = false;
    }
  }

  Future signUpUser(bool patient) async {
    loading.value = true;
    dio.Response response;

    try {
      response = await AuthProvider().signUpUser(
        username: usernameController.text,
        password: passwordController.text,
        email: emailController.text,
      );
      logger.i(response.data);
      if (response.statusCode == 201 || response.statusCode == 200) {
        if (!patient) {
          Get.back();
        } else {
          patientId.value = response.data["id"];
        }
      }
      loading.value = false;
    } on Exception catch (e) {
      loading.value = false;
      logger.e(e);
    }
  }

  Future userInfo() async {
    loading.value = true;
    dio.Response response;

    try {
      response = await AuthProvider().userInfo();
      logger.i(response.data);
      if (response.statusCode == 302) {
        userData.value = response.data;
        if (response.data["type"] == "patient") {
          await Get.find<PatientHomeController>().getPatientPlan();
          Get.to(MainNavigator(
            isPatient: true,
          ));
        } else {
          await Get.find<NewPatientController>().getHarmfulHabits();
          await Get.find<NewPatientController>().getIllnesses();
          Get.to(MainNavigator(
            isPatient: false,
          ));
        }
      }
      Future.delayed(const Duration(milliseconds: 500), () {
        loading.value = false;
      });
    } on Exception catch (e) {
      loading.value = false;
      logger.e(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
