import 'package:diet_and_control/widgets/homePatient/nutritional_plan.dart';
import 'package:flutter/material.dart';

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
                Divider(),
                Row(
                  children: [
                    Image.asset('assets/logo.png', height: 70.0),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 290.0,
                      child: Text(
                        // "Bienvenido $name",
                        "Bienvenido Juan Carlos",
                        style: TextStyle(
                            color: Color.fromRGBO(59, 203, 90, 1.0),
                            fontSize: 27.0,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
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
