import 'package:diet_and_control/models/meal.dart';
import 'package:diet_and_control/widgets/createPlan/new_plan.dart';
import 'package:flutter/material.dart';

class MealsList extends StatefulWidget {
  const MealsList({Key? key}) : super(key: key);

  @override
  _MealsListState createState() => _MealsListState();
}

class _MealsListState extends State<MealsList> {
  List _days = [
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
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, i) {
        return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                Text(
                  meals[i].type,
                  style: TextStyle(
                      fontSize: 20,
                      color: customGreen,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 200.0,
                  child: ListView.builder(
                      itemCount: 7,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          child: InkWell(
                            onTap: () {
                              print(i);
                              print(meals[i].name);
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 170,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.network(
                                      meals[i].imageUrl,
                                    ),
                                  ),
                                ),
                                Divider(),
                                Text(meals[i].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                                Divider(),
                                Text(
                                  _days[index],
                                  style: TextStyle(
                                      color: customGreen, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Divider(),
              ],
            ));
      },
    );
  }
}
