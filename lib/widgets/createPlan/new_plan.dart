import 'package:diet_and_control/modules/controllers/new_plan_controller/new_plan_controller.dart';
import 'package:diet_and_control/utils/text_style.dart';
import 'package:diet_and_control/widgets/createPlan/list_meals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPlan extends GetView<NewPlanController> {
  final List days = [
    "Lunes",
    "Martes",
    "Miércoles",
    "Jueves",
    "Viernes",
    "Sábado",
    "Domingo"
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.decreaseDay();
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: customGreen,
                    ),
                  ),
                  Text(
                    "${days[controller.currentDay.value]}",
                    style: TextStyle(
                        color: customGreen,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.increaseDay();
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: customGreen,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(148, 148, 148, 0.1),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Color.fromRGBO(218, 218, 218, 1.0),
                  )),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Text(
                          "PROPUESTA DE PLAN NUTRICIONAL",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Datos generales"),
                        style: ElevatedButton.styleFrom(primary: customGreen),
                      )
                    ],
                  ),
                  Divider(),
                  MealsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
