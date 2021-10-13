import 'package:diet_and_control/models/meal.dart';
import 'package:diet_and_control/modules/controllers/patient_home_controller/patient_home_controller.dart';
import 'package:diet_and_control/utils/text_style.dart';
import 'package:diet_and_control/widgets/homeNutricionista/list_messages.dart';
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

class  NutritionalPlan extends GetView<PatientHomeController> {
  List<bool> checkedmeals = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: Column(
          children: [
            Text(
              (() {
                if (controller.traceIds[controller.currentDay.value]
                        ["success"] ==
                    true) {
                  return "Completado";
                }
                return "Por completar";
              })(),
              // controller.traceIds[controller.currentDay.value]["id"].toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: customGreen,
                  fontWeight: FontWeight.bold),
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
                                fontWeight: index == controller.currentDay.value
                                    ? FontWeight.bold
                                    : FontWeight.w300,
                                color: index == controller.currentDay.value
                                    ? customGreen
                                    : null),
                          ),
                        ),
                        onTap: () {
                          controller.selectDay(index);
                          checkedmeals = List.filled(8, false);
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
            Divider(),
            ListMensajes(),
          ],
        ),
      ),
    );
  }

  Widget _mealsByType(int i) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Obx(
        () => ListView.builder(
          itemCount:
              controller.mealsCount[controller.orderedMeals.keys.elementAt(i)],
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                /* Text( 
                (
                (() {
                if(i == 1){
                return 1;}else if (i==2){return 3;} else if (i==3){return 4;}
                return 0;
                })()
                + 
                i+index
                ).toString()

              ), */
                Expanded(
                  child: Checkbox(
                    checkColor: Colors.white,
                    activeColor: customGreen,
                    value: (() {
                      if (controller.traceIds[controller.currentDay.value]
                          ["success"]) {
                        return controller.traceIds[controller.currentDay.value]
                            ["success"];
                      }
                      return checkedmeals[((() {
                            if (i == 1) {
                              return 1;
                            } else if (i == 2) {
                              return 3;
                            } else if (i == 3) {
                              return 4;
                            }
                            return 0;
                          })() +
                          i +
                          index)];
                    })(),
                    // controller.traceIds[controller.currentDay.value]["success"],
                    onChanged: (bool? value) {
                      setState(() {
                        checkedmeals[((() {
                              if (i == 1) {
                                return 1;
                              } else if (i == 2) {
                                return 3;
                              } else if (i == 3) {
                                return 4;
                              }
                              return 0;
                            })() +
                            i +
                            index)] = true;
                      });

                      if (checkedmeals.contains(false)) {
                      } else {
                        controller.updateTrace(controller
                            .traceIds[controller.currentDay.value]["id"]);
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      );
    });
  }
}
