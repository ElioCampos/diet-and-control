import 'package:diet_and_control/modules/controllers/new_patient_controller/new_patient_controller.dart';
import 'package:diet_and_control/modules/controllers/new_plan_controller/new_plan_controller.dart';
import 'package:diet_and_control/modules/controllers/nutritionist_home_controller/nutritionist_home_controller.dart';
import 'package:diet_and_control/utils/text_style.dart';
import 'package:diet_and_control/widgets/createPlan/new_plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CreatePlan extends GetView<NewPlanController> {
  
  final Function confirmPlan;
  CreatePlan(this.confirmPlan);

  @override  
  Widget build(BuildContext context) {
    controller.loading.value = true;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => controller.loading.value
                ? Center(
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: LoadingIndicator(
                        colors: [Colors.green],
                        indicatorType: Indicator.ballClipRotateMultiple,
                      ),
                    ),
                  )
                : Container(                  
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
                                "Plan Nutricional:",
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
                              onPressed: () async {
                                await Get.find<NewPlanController>()
                                    .assignPlan();
                                await Get.find<NutritionistHomeController>()
                                    .getPatients();
                                Get.find<NewPatientController>().clearSpaces();
                                showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return _confirmDialog(context);
                                  },
                                ).then((value) => confirmPlan(false));
                              },
                              child: Text("Confirmar plan nutricional"),
                              style: ElevatedButton.styleFrom(
                                  primary: customGreen),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                confirmPlan(false);
                                controller.loading.value = true;
                              },
                              child: Text("Cancelar"),
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                            ),
                          ],
                        ),
                        SizedBox(height: 10)
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _confirmDialog(BuildContext context) {
    return Builder(builder: (context) {
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
