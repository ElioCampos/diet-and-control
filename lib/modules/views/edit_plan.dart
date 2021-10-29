import 'dart:convert';

import 'package:diet_and_control/modules/controllers/nutritionist_home_controller/nutritionist_home_controller.dart';
import 'package:diet_and_control/modules/controllers/patient_home_controller/patient_home_controller.dart';
import 'package:diet_and_control/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

Map days = {
  "Lu": "Lunes",
  "Ma": "Martes",
  "Mi": "Miércoles",
  "Ju": "Jueves",
  "Vi": "Viernes",
  "Sa": "Sábado",
  "Do": "Domingo"
};

class EditPlan extends GetView<PatientHomeController> {
  final int patientId;
  final List patientData = Get.find<NutritionistHomeController>().patients;

  EditPlan(this.patientId);

  @override
  Widget build(BuildContext context) {
    Map currentPatient = {};
    for (var patient in patientData) {
      if (patient["user"] == patientId) {
        currentPatient = patient;
        break;
      }
    }
    controller.getmenuids();
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (controller.mealIds.isEmpty) {
                                  Navigator.pop(context);
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content:
                                            Text("Se perderan los cambios"),
                                        actions: [
                                          TextButton(
                                            child: Text("Salin sin guardar"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              Get.find<PatientHomeController>()
                                                  .getPatientPlan(
                                                      patientId, true);
                                            },
                                            style: TextButton.styleFrom(
                                              primary: customGreen,
                                            ),
                                          ),
                                          TextButton(
                                            child: Text("Cancelar"),
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
                                }
                              },
                              icon: Icon(Icons.arrow_back_ios, size: 30.0)),
                          Text(
                            "Modificar Plan",
                            style: TextStyle(
                                fontSize: 20,
                                color: customGreen,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.mealIds.isNotEmpty) {
                              controller.updateTreatment(controller.mealIds);
                              Navigator.pop(context);
                            }
                          },
                          child: Icon(Icons.save, color: Colors.white),
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                            primary: controller.mealIds.isNotEmpty
                                ? customGreen
                                : Colors.grey.shade400,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),                  
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
                    child: Column(children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Desayuno",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: customGreen,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " ${controller.totalKcalByType([
                                      controller.mealsEdit.values.elementAt(
                                              controller.currentDay.value)[0]
                                          ["meal"],
                                      controller.mealsEdit.values.elementAt(
                                              controller.currentDay.value)[1]
                                          ["meal"]
                                    ])}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " Kcal",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Divider(),
                          Container(
                              height: 210.0,
                              child: new ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    _meals(controller.currentDay.value, 0,
                                        "BREAKFAST1", context),
                                    _meals(controller.currentDay.value, 1,
                                        "BREAKFAST2", context)
                                  ])),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Almuerzo",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: customGreen,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " ${controller.totalKcalByType([
                                      controller.mealsEdit.values.elementAt(
                                              controller.currentDay.value)[4]
                                          ["meal"],
                                      controller.mealsEdit.values.elementAt(
                                              controller.currentDay.value)[5]
                                          ["meal"],
                                      controller.mealsEdit.values.elementAt(
                                              controller.currentDay.value)[6]
                                          ["meal"]
                                    ])}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " Kcal",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Divider(),
                          Container(
                              height: 210.0,
                              child: new ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    _meals(controller.currentDay.value, 4,
                                        "LUNCH1", context),
                                    _meals(controller.currentDay.value, 5,
                                        "LUNCH2", context),
                                    _meals(controller.currentDay.value, 6,
                                        "LUNCH3", context),
                                  ])),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Cena",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: customGreen,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " ${controller.totalKcalByType([
                                      controller.mealsEdit.values.elementAt(
                                              controller.currentDay.value)[2]
                                          ["meal"],
                                      controller.mealsEdit.values.elementAt(
                                              controller.currentDay.value)[3]
                                          ["meal"]
                                    ])}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " Kcal",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Divider(),
                          Container(
                              height: 210.0,
                              child: new ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    _meals(controller.currentDay.value, 2,
                                        "DINNER1", context),
                                    _meals(controller.currentDay.value, 3,
                                        "DINNER2", context)
                                  ])),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Snack",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: customGreen,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " ${controller.totalKcalByType([
                                      controller.mealsEdit.values.elementAt(
                                              controller.currentDay.value)[7]
                                          ["meal"]
                                    ])}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " Kcal",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Divider(),
                          Container(
                              height: 210.0,
                              child: _meals(controller.currentDay.value, 7,
                                  "SNACK", context)),
                        ],
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _meals(int dayid, int i, String schedule, context) {
    return Card(
      child: InkWell(
        onTap: () {
          controller.getMealSchedule(schedule, i, dayid);
          controller.nutritionalData(
              controller.mealsEdit.values.elementAt(dayid)[i]["meal"]
                  ["carbohydrate_kcal"],
              controller.mealsEdit.values.elementAt(dayid)[i]["meal"]
                  ["fat_kcal"],
              controller.mealsEdit.values.elementAt(dayid)[i]["meal"]
                  ["protein_kcal"]);
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return _mealDetails(i, context);
            },
          );
        },
        child: Column(
          children: [
            Container(
              width: 200,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  controller.mealsEdit.values.elementAt(dayid)[i]["meal"]
                      ["image_url"],
                ),
              ),
            ),
            Container(
              width: 120,
              child: Text(
                controller.mealsEdit.values.elementAt(dayid)[i]["meal"]["name"],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: controller.mealsEdit.values
                                .elementAt(dayid)[i]["meal"]["name"]
                                .length >
                            43
                        ? 10
                        : 15),
                maxLines: 20,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  Widget _mealDetails(int index, BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Obx(
        () => Dialog(
          child: controller.dialogloading.value
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: LoadingIndicator(
                          colors: [Colors.green],
                          indicatorType: Indicator.ballClipRotateMultiple,
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                image: NetworkImage(controller.mealSchedule[
                                        controller.currentMeal.value]["meal"]
                                    ["image_url"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                              controller.mealSchedule[controller
                                      .currentMeal.value]["meal"]["name"] +
                                  "\n",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: customGreen,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  controller.decreaseMeal();
                                },
                                icon: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: customGreen,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    infoText("Carbohidratos", true),
                                    infoText(
                                        controller.mealSchedule[controller
                                                        .currentMeal
                                                        .value]["meal"]
                                                    ["carbohydrate_kcal"]
                                                .toStringAsFixed(1) +
                                            "Kcal",
                                        false),
                                    infoText("Proteínas", true),
                                    infoText(
                                        controller.mealSchedule[controller
                                                        .currentMeal.value]
                                                    ["meal"]["protein_kcal"]
                                                .toStringAsFixed(1) +
                                            "Kcal",
                                        false),
                                    infoText("Grasas", true),
                                    infoText(
                                        controller.mealSchedule[controller
                                                    .currentMeal
                                                    .value]["meal"]["fat_kcal"]
                                                .toStringAsFixed(1) +
                                            "Kcal",
                                        false),
                                    Divider(),
                                    Text(
                                      "Kcal totales",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      (controller.mealSchedule[controller.currentMeal.value]
                                                          ["meal"]
                                                      ["carbohydrate_kcal"] +
                                                  controller.mealSchedule[
                                                          controller.currentMeal
                                                              .value]["meal"]
                                                      ["protein_kcal"] +
                                                  controller.mealSchedule[
                                                          controller.currentMeal
                                                              .value]["meal"]
                                                      ["fat_kcal"])
                                              .toStringAsFixed(1) +
                                          " kcal",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.increaseMeal();
                                },
                                icon: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: customGreen,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  controller.editmenuid(
                                      controller.currentDay.value,
                                      index,
                                      controller.currentMeal.value);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: customGreen),
                                child: Text(
                                  "Seleccionar",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.amber),
                                child: Text(
                                  "Cancelar",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
