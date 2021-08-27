import 'package:diet_and_control/widgets/createPlan/list_meals.dart';
import 'package:flutter/material.dart';

Color customGreen = Color.fromRGBO(0, 214, 129, 1.0);

class NewPlan extends StatefulWidget {
  const NewPlan({Key? key}) : super(key: key);

  @override
  _NewPlanState createState() => _NewPlanState();
}

class _NewPlanState extends State<NewPlan> {
  int _currentWeek = 1;
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
                    if (_currentWeek == 1) {
                      print(_currentWeek);
                    } else {
                      setState(() {
                        _currentWeek--;
                      });
                    }
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: customGreen,
                  ),
                ),
                Text(
                  "Semana $_currentWeek",
                  style: TextStyle(
                      color: customGreen,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _currentWeek++;
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
