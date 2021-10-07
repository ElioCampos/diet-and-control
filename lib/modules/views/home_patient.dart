import 'package:diet_and_control/widgets/homePatient/nutritional_plan.dart';
import 'package:flutter/material.dart';
import 'package:diet_and_control/modules/views/auth/login.dart';
import 'package:get/get.dart';

class HomePatient extends StatefulWidget {
  const HomePatient({Key? key}) : super(key: key);

  @override
  _HomePatientState createState() => _HomePatientState();
}

class _HomePatientState extends State<HomePatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset('assets/logo.png', height: 70.0),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 290.0,
                      child: Row (children: [
                      Text(
                        "Bienvenido\nJuan Carlos",
                        style: TextStyle(
                            color: Color.fromRGBO(59, 203, 90, 1.0),
                            fontSize: 27.0,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ), 
                      IconButton(
                        icon: Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return  AlertDialog(                                  
                                content: Text("¿Desar cerrar sesión?"),
                                actions: [
                                  TextButton(
                                    child: Text("Cerrar Sesión"),
                                    onPressed:  () { Get.offAll(Login()); },
                                  ),
                                  TextButton(
                                    child: Text("Regresar"),
                                    onPressed:  () { Navigator.of(context).pop(); },
                                  )
                                ],
                              );
                            },
                          );
                        },
                      )
                    ],
                )
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 7.0),
                  child: Text(
                    "Mi Plan Nutricional",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 214, 129, 1.0),
                        fontSize: 25.0),
                  ),
                ),
                NutritionalPlan(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
