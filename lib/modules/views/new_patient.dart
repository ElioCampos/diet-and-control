import 'package:diet_and_control/modules/controllers/new_patient_controller/new_patient_controller.dart';
import 'package:diet_and_control/widgets/nuevoPaciente/personal_info.dart';
import 'package:diet_and_control/widgets/nuevoPaciente/health_status.dart';
import 'package:diet_and_control/widgets/nuevoPaciente/anthro_evaluation.dart';
import 'package:diet_and_control/widgets/nuevoPaciente/calories_repartition.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

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
                            padding:
                                const EdgeInsets.only(bottom: 25.0, top: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      goToCreatePlan(true);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(59, 203, 90, 1.0),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
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
                                ]),
                          )
                        ])))));
  }
}
