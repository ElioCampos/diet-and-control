import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/modules/controllers/nutritionist_home_controller/nutritionist_home_controller.dart';
import 'package:diet_and_control/widgets/homeNutricionista/list_messages.dart';
import 'package:diet_and_control/widgets/homeNutricionista/list_patients.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class HomeNutricionista extends GetWidget<NutritionistHomeController> {
  final Function navigate;
  const HomeNutricionista({Key? key, required this.navigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map userData = Get.find<AuthController>().userData;
    String name = userData["first_name"] + " " + userData["last_name"];
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/logo.png', height: 70.0),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: 290.0,
                    child: Text(
                      "Bienvenido $name",
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
                child: Text(
                  "¿Qué quieres hacer hoy?",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 214, 129, 1.0), fontSize: 20.0),
                ),
              ),
              InkResponse(
                onTap: () {
                  navigate(1);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(148, 148, 148, 0.1),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        width: 0.7,
                        color: Color.fromRGBO(218, 218, 218, 1.0),
                      )),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20.0),
                        child: Image.asset(
                          'assets/image01.png',
                          height: 100.0,
                        ),
                      ),
                      Container(
                        width: 155.0,
                        child: Text(
                          "Agregar Nuevo Paciente",
                          style: TextStyle(
                              color: Color.fromRGBO(59, 203, 90, 1.0),
                              fontSize: 23.0),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ListPacientes(),
              InkResponse(
                onTap: () {
                  navigate(3);
                },
                child: ListMensajes(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
