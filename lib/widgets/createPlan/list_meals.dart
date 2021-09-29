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
  List _dList = [];
  List _aList = [];
  List _cList = [];
  List _sList = [];
  Map _mealsCount = {
    "Desayuno": 2,
    "Almuerzo": 3,
    "Cena": 2,
    "Snack": 1,
  };
  Map _allMeals = {};

  @override
  void initState() {
    super.initState();
    for (var meal in meals) {
      switch (meal.type) {
        case "Desayuno":
          {
            _dList.add(meal);
          }
          break;
        case "Almuerzo":
          {
            _aList.add(meal);
          }
          break;
        case "Cena":
          {
            _cList.add(meal);
          }
          break;
        case "Snack":
          {
            _sList.add(meal);
          }
          break;
      }
    }
    _allMeals = {
      "Desayuno": _dList,
      "Almuerzo": _aList,
      "Cena": _cList,
      "Snack": _sList
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _viewDetails ? 1 : 4,
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
                            ? _allMeals.keys.elementAt(_currentSelection)
                            : _allMeals.keys.elementAt(i),
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
          itemCount: _mealsCount[_allMeals.keys.elementAt(i)],
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return _mealDetails(
                          index, _allMeals.keys.elementAt(i), context);
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
                          _allMeals.values.elementAt(i)[index].imageUrl,
                        ),
                      ),
                    ),
                    Divider(),
                    Text(
                      _allMeals.values.elementAt(i)[index].name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
            childAspectRatio: 0.6,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: List.generate(
                _mealsCount[_allMeals.keys.elementAt(_currentSelection)],
                (index) {
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
                              _allMeals.values
                                  .elementAt(_currentSelection)[index]
                                  .imageUrl,
                            ),
                          ),
                        ),
                        Text(
                            _allMeals.values
                                .elementAt(_currentSelection)[index]
                                .name,
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
                            ],
                          ),
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

  Widget _mealDetails(int index, String type, BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
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
                          setState(() {
                            if (index == 0){
                              index = (_allMeals[type].length-1);
                            }
                            else  {
                              index--;
                            }
                          });
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
                              Text(_allMeals[type][index].name,
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
                                    _allMeals[type][index].imageUrl,
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
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (index == (_allMeals[type].length-1)){
                              index = 0;
                            }
                            else  {
                              index++;
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
                  SizedBox(height: 10),
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
