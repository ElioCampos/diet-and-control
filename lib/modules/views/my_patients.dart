import 'package:diet_and_control/models/patient.dart';
import 'package:diet_and_control/modules/controllers/nutritionist_home_controller/nutritionist_home_controller.dart';
import 'package:diet_and_control/modules/views/view_plan.dart';
import 'package:diet_and_control/widgets/myPatients/button_patients.dart';
import 'package:diet_and_control/widgets/myPatients/data_patient.dart';
import 'package:diet_and_control/widgets/myPatients/patient_log.dart';
import 'package:diet_and_control/widgets/myPatients/view_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPatients extends GetView<NutritionistHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 70.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 250.0,
                        child: Text(
                          "Mis Pacientes",
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
                  Container(
                    child: controller.patients.length > 0
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.patients.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1.0,
                                      decoration:
                                          BoxDecoration(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 35.0,
                                          backgroundImage: NetworkImage(
                                              pacientes[index].photo),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            DataPatient(
                                                data: "Nombre: " +
                                                    controller.patients[index]
                                                        ["first_name"] +
                                                    " " +
                                                    controller.patients[index]
                                                        ["last_name"]),
                                            DataPatient(
                                                data: "Enfermedad: " +
                                                    pacientes[index]
                                                        .enfermedad),
                                            DataPatient(
                                                data: "Progreso: " +
                                                    pacientes[index].status),
                                          ],
                                        )
                                      ],
                                    ),
                                    ViewStatus(paciente: pacientes[index]),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ButtonPatients(
                                            title: "Ver Historial",
                                            onTap: () {
                                              showDialog(
                                                  barrierLabel: "Barrier",
                                                  barrierDismissible: true,
                                                  barrierColor: Color.fromRGBO(
                                                      30, 30, 30, 0.7),
                                                  context: context,
                                                  builder: (_) {
                                                    return PatientLog(
                                                      patientName:
                                                          pacientes[index].name,
                                                    );
                                                  });
                                            }),
                                        ButtonPatients(
                                          title: "Ver plan nutricional",
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ViewPlan(
                                                  controller.patients[index]["user"],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            })
                        : Center(
                            child: Text(
                              "No tienes pacientes.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
