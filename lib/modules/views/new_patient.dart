import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/modules/controllers/new_patient_controller/new_patient_controller.dart';
import 'package:diet_and_control/modules/controllers/new_plan_controller/new_plan_controller.dart';
import 'package:diet_and_control/modules/controllers/nutritionist_home_controller/nutritionist_home_controller.dart';
import 'package:diet_and_control/modules/providers/new_plan_provider/new_plan_provider.dart';
import 'package:diet_and_control/widgets/nuevoPaciente/personal_info.dart';
import 'package:diet_and_control/widgets/nuevoPaciente/health_status.dart';
import 'package:diet_and_control/widgets/nuevoPaciente/anthro_evaluation.dart';
import 'package:diet_and_control/widgets/nuevoPaciente/calories_repartition.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class NuevoPaciente extends GetView<NewPatientController> {
  final Function goToCreatePlan;
  const NuevoPaciente({Key? key, required this.goToCreatePlan})
      : super(key: key);

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
                Row(
                  children: [
                    Image.asset('assets/logo.png', height: 70.0),
                    Container(
                      width: 300.0,
                      child: Text(
                        "Agregar Nuevo Paciente",
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
                DatosPersonales(),
                EvaluacionAntro(),
                EstadoSalud(),
                ReparticionKCal(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0, top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          int carbo = int.parse((controller.carbohydrates *
                                  double.parse(controller.tbmIndice.value) /
                                  100)
                              .toStringAsFixed(0));
                          int protein = int.parse((controller.protein *
                                  double.parse(controller.tbmIndice.value) /
                                  100)
                              .toStringAsFixed(0));
                          int fat = int.parse((controller.fat *
                                  double.parse(controller.tbmIndice.value) /
                                  100)
                              .toStringAsFixed(0));
                          Get.find<AuthController>().usernameController.text =
                              controller.userController.text;
                          Get.find<AuthController>().passwordController.text =
                              controller.passController.text;
                          Get.find<AuthController>().emailController.text =
                              controller.emailController.text;
                          if (controller.userController.text.isNotEmpty &&
                              controller.emailController.text.isNotEmpty &&
                              controller.passController.text.isNotEmpty &&
                              controller.nameController.text.isNotEmpty &&
                              controller.lastNameController.text.isNotEmpty &&
                              controller.date != DateTime.now() &&
                              controller.phoneController.text.isNotEmpty &&
                              controller.abdomenController.text.isNotEmpty &&
                              controller.armController.text.isNotEmpty &&
                              controller.hipsController.text.isNotEmpty &&
                              controller.valueChooseSex.value !=
                                  "Seleccionar" &&
                              controller.dniController.text.isNotEmpty &&
                              controller.valueChooseActual.value !=
                                  "Seleccionar" &&
                              carbo != 0 &&
                              protein != 0 &&
                              fat != 0) {
                            controller.loading.value = true;
                            goToCreatePlan(true);
                            await Get.find<AuthController>().signUpUser(true);
                            await controller.createUserProfile();
                            await controller.postIllness();
                            await controller.updateProfile();
                            await Get.find<NewPlanController>()
                                .getPlan(carbo, protein, fat);
                            controller.loading.value = false;
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(59, 203, 90, 1.0),
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    offset: Offset(1.0, 1.0))
                              ]),
                          child: Text(
                            "Crear posible plan nutricional",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
