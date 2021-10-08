import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/widgets/homePatient/nutritional_plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePatient extends StatefulWidget {
  const HomePatient({Key? key}) : super(key: key);

  @override
  _HomePatientState createState() => _HomePatientState();
}

class _HomePatientState extends State<HomePatient> {
  Map userData = Get.find<AuthController>().userData;
  @override
  Widget build(BuildContext context) {
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
                      child: Text(
                        "Bienvenido $name",
                        style: TextStyle(
                            color: Color.fromRGBO(59, 203, 90, 1.0),
                            fontSize: 27.0,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
