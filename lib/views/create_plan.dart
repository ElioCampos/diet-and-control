import 'package:diet_and_control/utils/text_style.dart';
import 'package:diet_and_control/widgets/createPlan/new_plan.dart';
import 'package:flutter/material.dart';

class CreatePlan extends StatefulWidget {
  final Function confirmPlan;
  const CreatePlan({Key? key, required this.confirmPlan}) : super(key: key);

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
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return _confirmDialog(context);
                          },
                        ).then((value) => widget.confirmPlan(false));
                      },
                      child: Text("Confirmar plan nutricional"),
                      style: ElevatedButton.styleFrom(primary: customGreen),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        widget.confirmPlan(false);
                      },
                      child: Text("Cancelar"),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                  ],
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _confirmDialog(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        backgroundColor: customGreen,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Icon(
                    Icons.task_alt,
                    color: Colors.white,
                    size: 100,
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      "¡El plan fue creado exitosamente!",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 70),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
