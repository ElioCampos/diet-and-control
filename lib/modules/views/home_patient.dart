import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/modules/controllers/patient_home_controller/patient_home_controller.dart';
import 'package:diet_and_control/utils/text_style.dart';
import 'package:diet_and_control/widgets/homePatient/nutritional_plan.dart';
import 'package:diet_and_control/modules/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePatient extends GetView<PatientHomeController> {
  @override
  Widget build(BuildContext context) {
    Map userData = Get.find<AuthController>().userData;
    String name = userData["first_name"] + " " + userData["last_name"];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset('assets/logo.png', height: 70.0),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 290.0,
                      child: Row(
                        children: [
                          Container(
                            width: 240,
                            child: Text(
                              userData["sex"]
                                  ? "Bienvenido $name"
                                  : "Bienvenida $name",
                              style: TextStyle(
                                  color: Color.fromRGBO(59, 203, 90, 1.0),
                                  fontSize: 27.0,
                                  fontWeight: FontWeight.bold),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.logout,
                              color: customGreen,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Text("¿Desea cerrar sesión?"),
                                    actions: [
                                      TextButton(
                                        child: Text("Cerrar sesión"),
                                        onPressed: () {
                                          Get.offAll(Login());
                                        },
                                        style: TextButton.styleFrom(
                                          primary: customGreen,
                                        ),
                                      ),
                                      TextButton(
                                        child: Text("Regresar"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: TextButton.styleFrom(
                                          primary: customGreen,
                                        ),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 7.0),
                  child: Text(
                    "Mi Plan Nutricional",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 214, 129, 1.0),
                        fontSize: 25.0),
                  ),
                ),
                NutritionalPlan(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
