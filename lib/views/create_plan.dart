import 'package:diet_and_control/widgets/createPlan/new_plan.dart';
import 'package:flutter/material.dart';

class CreatePlan extends StatefulWidget {
  const CreatePlan({Key? key}) : super(key: key);

  @override
  _CreatePlanState createState() => _CreatePlanState();
}

class _CreatePlanState extends State<CreatePlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
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
                        "Plan Nutricional: Juan Perez",
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
                NewPlan(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
