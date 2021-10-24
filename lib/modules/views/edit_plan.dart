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
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios, size: 30.0)),
                                Text("Modificar Plan", 
                                style: TextStyle(
                                            fontSize: 20,
                                            color: customGreen,
                                            fontWeight: FontWeight.bold),),
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
                                            fontWeight: index ==
                                                    controller.currentDay.value
                                                ? FontWeight.bold
                                                : FontWeight.w300,
                                            color: index ==
                                                    controller.currentDay.value
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
                                  Row(
                                    children: [
                                      Text(
                                        controller.orderedMeals.keys
                                            .elementAt(index),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: customGreen,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                        " ${controller.totalKcalByType(controller.orderedMeals.values.elementAt(index))}",
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
                                        child:_mealsByType(index),
                                      ),                                                                    
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
        itemCount: controller.mealsCount[controller.orderedMeals.keys.elementAt(i)],
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(children: [
            Card(
              child: InkWell(
                onTap: () {
                  controller.getMealSchedule(controller.orderedMeals.keys.elementAt(i), index);
                  controller.nutritionalData(
                      controller.orderedMeals.values.elementAt(i)[index]
                          ["carbohydrate_kcal"],
                      controller.orderedMeals.values.elementAt(i)[index]
                          ["fat_kcal"],
                      controller.orderedMeals.values.elementAt(i)[index]
                          ["protein_kcal"]);
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return _mealDetails(index,
                          controller.orderedMeals.keys.elementAt(i),                                                  
                          context);
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
                          controller.orderedMeals.values.elementAt(i)[index]
                              ["image_url"],
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      child: Text(
                        controller.orderedMeals.values.elementAt(i)[index]
                            ["name"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: controller.orderedMeals.values
                                        .elementAt(i)[index]["name"]
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
            )
          ]);
        },
      ),
    );
  }

  Widget _mealDetails(int index, String type, BuildContext context) {    

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
                      margin: EdgeInsets.only(bottom:10),
                      height:100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(                          
                          image: NetworkImage(controller.mealSchedule[controller.currentMeal.value]["meal"]["image_url"]),
                          fit: BoxFit.cover,
                        ),
                      ),        
                      ),                    
                      Text(        
                        controller.mealSchedule[controller.currentMeal.value]["meal"]["name"] + "\n",
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
                              infoText( controller.mealSchedule[controller.currentMeal.value]["meal"]["carbohydrate_kcal"].toStringAsFixed(1) + "Kcal", false),
                              infoText("Proteínas", true),
                              infoText(
                                  controller.mealSchedule[controller.currentMeal.value]["meal"]["protein_kcal"].toStringAsFixed(1) + "Kcal", false),
                              infoText("Grasas", true),
                              infoText(controller.mealSchedule[controller.currentMeal.value]["meal"]["fat_kcal"].toStringAsFixed(1) + "Kcal", false),
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
                                (controller.mealSchedule[controller.currentMeal.value]["meal"]["carbohydrate_kcal"] +
                                controller.mealSchedule[controller.currentMeal.value]["meal"]["protein_kcal"] +
                                controller.mealSchedule[controller.currentMeal.value]["meal"]["fat_kcal"]
                                ).toStringAsFixed(1) + " kcal",
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
                    // Divider(),
                    // Text(
                    //   "Requerimiento recomendado",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       color: customGreen,
                    //       fontSize: 20),
                    // ),
                    // Text(
                    //   "320Kcal",
                    //   textAlign: TextAlign.center,
                    //   style:
                    //       TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            controller.editmenuid(controller.currentDay.value, type,index, controller.mealSchedule[controller.currentMeal.value]["id"]);
                            if (controller.mealChanged.value){
                            controller.updateTreatment(
                             [
                              json.decode(controller.menuMon.toString().replaceAll('{','').replaceAll('}', '')), 
                              json.decode(controller.menuTue.toString().replaceAll('{','').replaceAll('}', '')), 
                              json.decode(controller.menuWed.toString().replaceAll('{','').replaceAll('}', '')), 
                              json.decode(controller.menuThu.toString().replaceAll('{','').replaceAll('}', '')), 
                              json.decode(controller.menuFri.toString().replaceAll('{','').replaceAll('}', '')), 
                              json.decode(controller.menuSat.toString().replaceAll('{','').replaceAll('}', '')), 
                              json.decode(controller.menuSun.toString().replaceAll('{','').replaceAll('}', ''))
                            ]
                            ); }                           
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(primary: customGreen),
                          child: Text(
                            "Guardar",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style:
                              ElevatedButton.styleFrom(primary: Colors.amber),
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
