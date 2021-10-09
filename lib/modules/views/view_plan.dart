import 'package:diet_and_control/models/patient.dart';
import 'package:diet_and_control/modules/controllers/nutritionist_home_controller/nutritionist_home_controller.dart';
import 'package:diet_and_control/modules/controllers/patient_home_controller/patient_home_controller.dart';
import 'package:diet_and_control/utils/text_style.dart';
import 'package:diet_and_control/widgets/myPatients/button_patients.dart';
import 'package:diet_and_control/widgets/myPatients/data_patient.dart';
import 'package:diet_and_control/widgets/myPatients/view_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Map days = {
  "Lu": "Lunes",
  "Ma": "Martes",
  "Mi": "Miércoles",
  "Ju": "Jueves",
  "Vi": "Viernes",
  "Sa": "Sábado",
  "Do": "Domingo"
};

class ViewPlan extends GetView<PatientHomeController> {
  final int patientId;
  final List patientData = Get.find<NutritionistHomeController>().patients;

  ViewPlan(this.patientId);

  @override
  Widget build(BuildContext context) {
    Map currentPatient = {};
    for (var patient in patientData) {
      if (patient["user"] == patientId) {
        currentPatient = patient;
        break;
      }
    }
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios, size: 30.0)),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage:
                            NetworkImage(pacientes[patientId].photo),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DataPatient(
                              data:
                                  "Nombre: ${currentPatient["first_name"]} ${currentPatient["last_name"]}"),
                          DataPatient(
                              data: "Enfermedad: " +
                                  pacientes[patientId].enfermedad),
                        ],
                      )
                    ],
                  ),
                  ViewStatus(paciente: pacientes[patientId]),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonPatients(
                          title: "Modificar plan", onTap: () => null),
                      ButtonPatients(
                          title: "Ver datos estadísticos", onTap: () => null),
                    ],
                  ),
                  Divider(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: customGreen,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        days.length,
                        (index) {
                          return InkWell(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  days.keys.elementAt(index),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight:
                                          index == controller.currentDay.value
                                              ? FontWeight.bold
                                              : FontWeight.w300,
                                      color:
                                          index == controller.currentDay.value
                                              ? customGreen
                                              : null),
                                ),
                              ),
                              onTap: () {
                                controller.selectDay(index);
                              });
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: List.generate(4, (index) {
                        return Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              controller.orderedMeals.keys.elementAt(index),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: customGreen,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            _mealsByType(index),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _mealsByType(int i) {
    return Obx(
      () => ListView.builder(
        itemCount:
            controller.mealsCount[controller.orderedMeals.keys.elementAt(i)],
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    controller.orderedMeals.values.elementAt(i)[index]
                        ["image_url"],
                    scale: 2,
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  // showDialog<void>(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return _mealDetails(index, context);
                  //   },
                  // );
                },
                child: Column(
                  children: [
                    Text(
                      controller.orderedMeals.values.elementAt(i)[index]
                          ["name"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: customGreen,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Carbohidratos",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "${controller.roundDecimal(controller.orderedMeals.values.elementAt(i)[index]["carbohydrate_kcal"])}Kcal",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "Proteínas",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "${controller.roundDecimal(controller.orderedMeals.values.elementAt(i)[index]["protein_kcal"])}Kcal",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "Grasas",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "${controller.roundDecimal(controller.orderedMeals.values.elementAt(i)[index]["fat_kcal"])}Kcal",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }

  // Widget _mealDetails(int index, BuildContext context) {
  //   return StatefulBuilder(builder: (context, setState) {
  //     return Dialog(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Container(
  //             padding: EdgeInsets.fromLTRB(10, 50, 20, 20),
  //             child: Column(
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Expanded(
  //                       child: Container(
  //                         child: Column(
  //                           children: [
  //                             Text(meals[index].name,
  //                                 style: TextStyle(
  //                                     fontSize: 24,
  //                                     color: customGreen,
  //                                     fontWeight: FontWeight.bold),
  //                                 textAlign: TextAlign.center),
  //                             Container(
  //                               padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
  //                               child: ClipRRect(
  //                                 borderRadius: BorderRadius.circular(15.0),
  //                                 child: Image.network(
  //                                   meals[index].imageUrl,
  //                                   scale: 4,
  //                                 ),
  //                               ),
  //                             ),
  //                             Text(days[days.keys.elementAt(_selectedDay)],
  //                                 style: TextStyle(
  //                                   fontSize: 20,
  //                                   color: customGreen,
  //                                 ),
  //                                 textAlign: TextAlign.center),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     Container(
  //                       padding: EdgeInsets.only(left: 10),
  //                       child: Column(
  //                         children: [
  //                           infoText("Carbohidratos", true),
  //                           infoText("30Kcal", false),
  //                           Divider(),
  //                           infoText("Proteínas", true),
  //                           infoText("30Kcal", false),
  //                           Divider(),
  //                           infoText("Grasas", true),
  //                           infoText("30Kcal", false),
  //                           Divider(),
  //                           Text(
  //                             "Kcal totales",
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(
  //                                 fontWeight: FontWeight.bold,
  //                                 color: Colors.red,
  //                                 fontSize: 20),
  //                           ),
  //                           Text(
  //                             "90Kcal",
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(fontSize: 20),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(height: 10),
  //                 ElevatedButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   style: ElevatedButton.styleFrom(primary: Colors.amber),
  //                   child: Text(
  //                     "Cerrar",
  //                     style: TextStyle(color: Colors.black),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   });

}
