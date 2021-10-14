import 'package:diet_and_control/models/log.dart';
import 'package:diet_and_control/widgets/myPatients/button_patients.dart';
import 'package:flutter/material.dart';
import 'dart:ui' show ImageFilter;

class PatientLog extends StatefulWidget {  
  final String patientName;
  final String patientRegisterDate;
  final String patientIMC;
  final String patientWeight; 
  const PatientLog({
    Key? key,   
    required this.patientName,
    required this.patientRegisterDate,
    required this.patientIMC,
    required this.patientWeight    
  }) : super(key: key);

  @override
  _PatientLogState createState() => _PatientLogState();
}


class _PatientLogState extends State<PatientLog> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                "HISTORIAL",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromRGBO(59, 203, 90, 1.0),
                    fontWeight: FontWeight.bold),
              ),
              Container(
                child: Scrollbar(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    Text(
                      widget.patientName + "\n",
                      style: TextStyle(
                          color: Color.fromRGBO(109, 109, 109, 1),
                          fontSize: 17.0),
                    ),
                    Row(
                      children: [
                        Text(
                          "Fecha Inicio: ",
                          style: TextStyle(
                              color: Color.fromRGBO(59, 203, 90, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        Text(
                          widget.patientRegisterDate,
                          style: TextStyle(
                              color: Color.fromRGBO(109, 109, 109, 1),
                              fontSize: 17.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Peso al Inicio: ",
                          style: TextStyle(
                              color: Color.fromRGBO(59, 203, 90, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        Text(
                          widget.patientWeight + "kg",
                          style: TextStyle(
                              color: Color.fromRGBO(109, 109, 109, 1),
                              fontSize: 17.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Ultima Fecha: ",
                          style: TextStyle(
                              color: Color.fromRGBO(59, 203, 90, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        Text(
                         widget.patientRegisterDate,
                          style: TextStyle(
                              color: Color.fromRGBO(109, 109, 109, 1),
                              fontSize: 17.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Ultimo Peso: \n",
                          style: TextStyle(
                              color: Color.fromRGBO(59, 203, 90, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        Text(
                          widget.patientWeight +
                              "kg\n",
                          style: TextStyle(
                              color: Color.fromRGBO(109, 109, 109, 1),
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Table(
                        border: TableBorder(
                            verticalInside: BorderSide(
                                width: 2,
                                color: Colors.green,
                                style: BorderStyle.solid)),
                        children: [
                          TableRow(children: [
                            Text('Fecha',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Peso',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('IMC',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ]),
                          TableRow(children: [
                            Text(widget.patientRegisterDate,
                                textAlign: TextAlign.center,),
                            Text(widget.patientWeight + "kg",
                                textAlign: TextAlign.center,),
                            Text(widget.patientIMC,
                                textAlign: TextAlign.center,),
                          ]),
                        ]),
                  ]),
                )),
                width: double.infinity,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              ButtonPatients(
                  title: "Regresar",
                  onTap: () {
                    Navigator.of(context).pop();
                  })
            ])));
  }
}











/* class _PatientLogState extends State<PatientLog> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                "HISTORIAL",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromRGBO(59, 203, 90, 1.0),
                    fontWeight: FontWeight.bold),
              ),
              Container(
                child: Scrollbar(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    Text(
                      widget.patientName + "\n",
                      style: TextStyle(
                          color: Color.fromRGBO(109, 109, 109, 1),
                          fontSize: 17.0),
                    ),
                    Row(
                      children: [
                        Text(
                          "Fecha Inicio: ",
                          style: TextStyle(
                              color: Color.fromRGBO(59, 203, 90, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        Text(
                          patientLogs[0].date.day.toString() +
                              "/" +
                              patientLogs[0].date.month.toString() +
                              "/" +
                              patientLogs[0].date.year.toString(),
                          style: TextStyle(
                              color: Color.fromRGBO(109, 109, 109, 1),
                              fontSize: 17.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Peso al Inicio: ",
                          style: TextStyle(
                              color: Color.fromRGBO(59, 203, 90, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        Text(
                          patientLogs[0].weight.toString() + "kg",
                          style: TextStyle(
                              color: Color.fromRGBO(109, 109, 109, 1),
                              fontSize: 17.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Ultima Fecha: ",
                          style: TextStyle(
                              color: Color.fromRGBO(59, 203, 90, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        Text(
                          patientLogs[patientLogs.length - 1]
                                  .date
                                  .day
                                  .toString() +
                              "/" +
                              patientLogs[patientLogs.length - 1]
                                  .date
                                  .month
                                  .toString() +
                              "/" +
                              patientLogs[patientLogs.length - 1]
                                  .date
                                  .year
                                  .toString(),
                          style: TextStyle(
                              color: Color.fromRGBO(109, 109, 109, 1),
                              fontSize: 17.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Ultimo Peso: \n",
                          style: TextStyle(
                              color: Color.fromRGBO(59, 203, 90, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        Text(
                          patientLogs[patientLogs.length - 1]
                                  .weight
                                  .toString() +
                              "kg\n",
                          style: TextStyle(
                              color: Color.fromRGBO(109, 109, 109, 1),
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Table(
                        border: TableBorder(
                            verticalInside: BorderSide(
                                width: 2,
                                color: Colors.green,
                                style: BorderStyle.solid)),
                        children: [
                          TableRow(children: [
                            Text('Fecha',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Peso',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('IMC',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ]),
                          for (var patientLog in patientLogs)
                            TableRow(children: [
                              new Text(
                                  patientLog.date.day.toString() +
                                      "/" +
                                      patientLog.date.month.toString() +
                                      "/" +
                                      patientLog.date.year.toString(),
                                  textAlign: TextAlign.center),
                              new Text(patientLog.weight.toString(),
                                  textAlign: TextAlign.center),
                              new Text(patientLog.imc.toString(),
                                  textAlign: TextAlign.center),
                            ])
                        ]),
                  ]),
                )),
                width: double.infinity,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              ButtonPatients(
                  title: "Regresar",
                  onTap: () {
                    Navigator.of(context).pop();
                  })
            ])));
  }
}
 */