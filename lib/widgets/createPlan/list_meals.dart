import 'package:diet_and_control/models/meal.dart';
import 'package:diet_and_control/utils/text_style.dart';
import 'package:flutter/material.dart';

class MealsList extends StatefulWidget {
  const MealsList({Key? key}) : super(key: key);

  @override
  _MealsListState createState() => _MealsListState();
}

class _MealsListState extends State<MealsList> {
  bool _viewDetails = false;
  int _currentSelection = 0;
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
      itemCount: _viewDetails ? 1 : 3,
      itemBuilder: (BuildContext context, i) {
        return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _currentSelection = i;
                      _viewDetails = !_viewDetails;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        _viewDetails
                            ? meals[_currentSelection].type
                            : meals[i].type,
                        style: TextStyle(
                            fontSize: 20,
                            color: customGreen,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        _viewDetails ? Icons.expand_less : Icons.expand_more,
                        color: customGreen,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: _viewDetails ? 400.0 : 200.0,
                  child: _mealsByDay(i),
                ),
              ],
            ));
      },
    );
  }

  Widget _mealsByDay(int i) {
    return Visibility(
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
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return _mealDetails(i, index, context);
                    },
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: 170,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          _viewDetails
                              ? meals[_currentSelection].imageUrl
                              : meals[i].imageUrl,
                        ),
                      ),
                    ),
                    Divider(),
                    Text(
                        _viewDetails
                            ? meals[_currentSelection].name
                            : meals[i].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17)),
                    Text(
                      _days[index],
                      style: TextStyle(color: customGreen, fontSize: 15),
                    ),
                  ],
                ),
              ),
            );
          }),
      replacement: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 0.5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: List.generate(7, (index) {
              return Container(
                child: Card(
                  child: InkWell(
                    onTap: () {
                      print(i);
                      print(meals[i].name);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 170,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              meals[_currentSelection].imageUrl,
                            ),
                          ),
                        ),
                        Text(meals[_currentSelection].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                        Divider(),
                        Container(
                          child: Column(
                            children: [
                              infoText("Carbohidratos", true),
                              infoText("30Kcal", false),
                              infoText("Proteínas", true),
                              infoText("30Kcal", false),
                              infoText("Grasas", true),
                              infoText("30Kcal", false),
                              Divider(),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Text(
                                  meals[_currentSelection].description,
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          _days[index],
                          style: TextStyle(color: customGreen, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
      visible: !_viewDetails,
    );
  }

  Widget _mealDetails(int index, int day, BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.keyboard_arrow_left, color: customGreen,),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Text(meals[index].name,
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: customGreen,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    meals[index].imageUrl,
                                    scale: 4,
                                  ),
                                ),
                              ),
                              Text(_days[day],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: customGreen,
                                  ),
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            infoText("Carbohidratos", true),
                            infoText("30Kcal", false),
                            infoText("Proteínas", true),
                            infoText("30Kcal", false),
                            infoText("Grasas", true),
                            infoText("30Kcal", false),
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
                              "90Kcal",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right, color: customGreen,),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                          child: Text(
                            meals[index].description,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Icon(Icons.edit),
                    ],
                  ),
                  Divider(),
                  Text(
                    "Requerimiento recomendado",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: customGreen,
                        fontSize: 20),
                  ),
                  Text(
                    "320Kcal",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
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
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
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
      );
    });
  }
}
