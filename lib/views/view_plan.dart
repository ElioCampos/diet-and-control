import 'package:diet_and_control/models/meal.dart';
import 'package:diet_and_control/models/patient.dart';
import 'package:diet_and_control/utils/text_style.dart';
import 'package:diet_and_control/widgets/myPatients/button_patients.dart';
import 'package:diet_and_control/widgets/myPatients/data_patient.dart';
import 'package:diet_and_control/widgets/myPatients/view_status.dart';
import 'package:flutter/material.dart';

Map days = {
  "Lu": "Lunes",
  "Ma": "Martes",
  "Mi": "Miércoles",
  "Ju": "Jueves",
  "Vi": "Viernes",
  "Sa": "Sábado",
  "Do": "Domingo"
};


class ViewPlan extends StatefulWidget {

  final Paciente paciente;

  const ViewPlan({
    Key? key,
    required this.paciente
  }) : super(key: key);

  @override
  _ViewPlanState createState() => _ViewPlanState();
}

class _ViewPlanState extends State<ViewPlan> {
  int _currentWeek = 1;
  int _selectedDay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, size: 30.0)),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: NetworkImage(widget.paciente.photo),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DataPatient(data: "Nombre: " + widget.paciente.name),
                        DataPatient(data: "Enfermedad: " + widget.paciente.enfermedad),
                      ],
                    )
                  ],
                ),
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
                          color: Color.fromRGBO(0, 230, 137, 1),
                        ),
                      ),
                      Text(
                        "Semana $_currentWeek",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 230, 137, 1),
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
                          color: Color.fromRGBO(0, 230, 137, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                ViewStatus(paciente: widget.paciente),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonPatients(title: "Modificar plan", onTap: () => null),
                    ButtonPatients(title: "Ver datos estadísticos", onTap: () => null),
                  ],
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(0, 230, 137, 1),
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
                                    fontWeight: index == _selectedDay
                                        ? FontWeight.bold
                                        : FontWeight.w300,
                                    color:
                                        index == _selectedDay ? Color.fromRGBO(0, 230, 137, 1) : null),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _selectedDay = index;
                              });
                            });
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: List.generate(meals.length, (index) {
                      return Column(
                        children: [
                          SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.network(
                                      meals[index].imageUrl,
                                      scale: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return _mealDetails(index, context);
                                      },
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          meals[index].type,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Divider(),
                                        Text(
                                          meals[index].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Color.fromRGBO(0, 230, 137, 1),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            meals[index].description,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
      ));
  }

  Widget _mealDetails(int index, BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 50, 20, 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    meals[index].imageUrl,
                                    scale: 4,
                                  ),
                                ),
                              ),
                              Text(days[days.keys.elementAt(_selectedDay)],
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
                            Divider(),
                            infoText("Proteínas", true),
                            infoText("30Kcal", false),
                            Divider(),
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
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                    child: Text(
                      "Cerrar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
