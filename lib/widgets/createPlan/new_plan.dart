import 'package:diet_and_control/utils/text_style.dart';
import 'package:diet_and_control/widgets/createPlan/list_meals.dart';
import 'package:flutter/material.dart';

class NewPlan extends StatefulWidget {
  const NewPlan({Key? key}) : super(key: key);

  @override
  _NewPlanState createState() => _NewPlanState();
}

class _NewPlanState extends State<NewPlan> {
  List _days = [
    "Lunes",
    "Martes",
    "Miércoles",
    "Jueves",
    "Viernes",
    "Sábado",
    "Domingo"
  ];
  int _currentDay = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_currentDay > 0) {
                        _currentDay--;
                      } else {
                        _currentDay = 6;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: customGreen,
                  ),
                ),
                Text(
                  "${_days[_currentDay]}",
                  style: TextStyle(
                      color: customGreen,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_currentDay < 6) {
                        _currentDay++;
                      }
                      else {
                        _currentDay = 0;
                      }
                    });
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
    );
  }
}
