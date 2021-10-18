import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/modules/controllers/patient_home_controller/patient_home_controller.dart';
import 'package:diet_and_control/widgets/homePatient/nutritional_plan.dart';
import 'package:diet_and_control/widgets/myPatients/button_patients.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPlan extends GetView<PatientHomeController> {
  @override
  Widget build(BuildContext context) {
    Map userData = Get.find<AuthController>().userData;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/logo.png', height: 70.0),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                      "Mi Plan\nNutricional",
                      style: TextStyle(
                          color: Color.fromRGBO(59, 203, 90, 1.0),
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                      ],
                    ),                    
                    IconButton(
                      icon: Icon(
                        Icons.published_with_changes,
                        color: Color.fromRGBO(59, 203, 90, 1.0),
                        size: 40,
                      ),
                      onPressed: () { 
                        showDialog(
                              barrierLabel: "Barrier",
                              barrierDismissible: true,
                              barrierColor: Color.fromRGBO(
                                  30, 30, 30, 0.7),
                              context: context,                        
                              builder: (_) {                          
                                return SimpleDialog(
                              title: const Text('Sustitutos',style: TextStyle(
                      color: Color.fromRGBO(0, 214, 129, 1.0),
                      fontSize: 25.0),),
                              children: [ Image.network('https://cdn.discordapp.com/attachments/874441203809144853/899723916166172722/sustitutos.jpg'),                                                   
                              ],
                            );
                        });
                      }),
                  ],
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
