import 'package:diet_and_control/modules/controllers/new_plan_controller/new_plan_controller.dart';
import 'package:diet_and_control/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealsList extends GetView<NewPlanController> {
  final bool viewDetails = false;
  final int currentSelection = 0;
  final double carbo = 0.0;
  final double fat = 0.0;
  final double protein = 0.0;

  final Map mealsCount = {
    "Desayuno": 2,
    "Almuerzo": 3,
    "Cena": 2,
    "Snack": 1,
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (BuildContext context, i) {
        return Obx(
          () => SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        viewDetails
                            ? controller.orderedMeals.keys
                                .elementAt(currentSelection)
                            : controller.orderedMeals.keys.elementAt(i) + ":",
                        style: TextStyle(
                            fontSize: 20,
                            color: customGreen,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " ${controller.totalKcalByType(controller.orderedMeals.values.elementAt(i))}",
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
                ),
                Container(
                  height: 210.0,
                  child: _mealsByDay(i),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _mealsByDay(int i) {
    return Obx(
      () => ListView.builder(
        itemCount: mealsCount[controller.orderedMeals.keys.elementAt(i)],
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(children: [
            Card(
              child: InkWell(
                onTap: () {
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
                          controller.orderedMeals.keys.elementAt(i), context);
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            // setState(() {
                            //   if (index == 0) {
                            //     index = (_allMeals[type].length - 1);
                            //   } else {
                            //     index--;
                            //   }
                            // });
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_left,
                            color: customGreen,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                    controller.orderedMeals[type][index]
                                        ["name"],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: customGreen,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.network(
                                      controller.orderedMeals[type][index]
                                          ["image_url"],
                                      scale: 4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              infoText("Carbohidratos", true),
                              infoText("${controller.carbo.value}Kcal", false),
                              infoText("Proteínas", true),
                              infoText(
                                  "${controller.protein.value}Kcal", false),
                              infoText("Grasas", true),
                              infoText("${controller.fat.value}Kcal", false),
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
                                "${controller.totalKcal.value}Kcal",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // setState(() {
                            //   if (index == (_allMeals[type].length - 1)) {
                            //     index = 0;
                            //   } else {
                            //     index++;
                            //   }
                            // });
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
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(primary: customGreen),
                          child: Text(
                            "Guardar cambios",
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
