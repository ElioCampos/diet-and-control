import 'package:diet_and_control/modules/controllers/new_plan_controller/new_plan_controller.dart';
import 'package:diet_and_control/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';


class MealsList extends GetView<NewPlanController> {
  final bool viewDetails = false;
  final int currentSelection = 0;
  final double carbo = 0.0;
  final double fat = 0.0;
  final double protein = 0.0;

  @override
  Widget build(BuildContext context) {
    
        return Obx(
          () => SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
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
              ],
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
