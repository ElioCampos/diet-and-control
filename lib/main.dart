import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/modules/controllers/new_patient_controller/new_patient_controller.dart';
import 'package:diet_and_control/modules/controllers/nutritionist_home_controller/nutritionist_home_controller.dart';
import 'package:diet_and_control/modules/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigator.dart';

void main() {
  Get.put(AuthController());
  Get.put(NewPatientController());
  Get.put(NutritionistHomeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Diet and Control',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}
