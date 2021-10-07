import 'package:diet_and_control/modules/providers/auth_providers/auth_provider.dart';
import 'package:diet_and_control/modules/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart' as dio;

class NutritionistHomeController extends GetxController {
  final logger = Logger(
    printer: PrettyPrinter(),
  );

  final RxBool loading = false.obs;

  //*Login

  @override
  void onInit() {
    super.onInit();
  }

  Future getSesion() async {
    loading.value = true;
    dio.Response response;
    try {
      /* response = await LoginProvider()
          .getSession(usernameController.text, passwordController.text);
      if (response.statusCode == 201 || response.statusCode == 200) {
        loading.value = false;
      } else {
        logger.i(response.statusCode);
        loading.value = false;
      } */
    } on Exception catch (e) {
      logger.e(e);
      loading.value = false;
    }
  }

void logoutUser() {  
    Get.offAll(Login()); 
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
