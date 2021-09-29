import 'package:diet_and_control/modules/controllers/new_patient_controller/new_patient_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';

class EvaluacionAntro extends GetView<NewPatientController> {
  const EvaluacionAntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Color.fromRGBO(148, 148, 148, 0.1),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              width: 0.7,
              color: Color.fromRGBO(218, 218, 218, 1.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                "EVALUACIÓN ANTROPOMETRICA",
                style: TextStyle(
                    color: Color.fromRGBO(7, 87, 55, 1.0), fontSize: 23.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    _textField("Peso", "Kg", context,
                        textController: controller.weightController),
                    _textField("Talla", "Cm", context,
                        textController: controller.heightController),
                    Text(
                      "Circunferencias: ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                    _textField("Brazo", "Cm", context,
                        textController: controller.armController),
                    _textField("Abdominal", "Cm", context,
                        textController: controller.abdomenController),
                    _textField("Cadera", "Cm", context,
                        textController: controller.hipsController),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(59, 203, 90, 1.0),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(children: [
                        Container(
                          width: 100.0,
                          child: Obx(
                            () => Text(
                              "IMC: ${controller.icmIndice.value}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Text(
                          " Kg/m2",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(59, 203, 90, 1.0),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(children: [
                        Container(
                          width: 120.0,
                          child: Obx(
                            () => Text(
                              "TMB: ${controller.tbmIndice}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Text(
                          " Kcal",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        )
                      ]),
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }

  _textField(String title, String medida, BuildContext context,
      {required TextEditingController textController}) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          Container(
              width: 70.0,
              child: Text(
                title + " (" + medida + "): ",
                style: TextStyle(
                    color: Color.fromRGBO(59, 203, 90, 1.0),
                    fontWeight: FontWeight.bold),
              )),
          Container(
            width: 70.0,
            height: 42.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Color.fromRGBO(112, 112, 112, 1.0))),
            child: TextField(
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                if (value.length > 3) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  textController.text = textController.text[0] +
                      textController.text[1] +
                      textController.text[2];
                }
                controller.calcIcmTmb();
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: textController,
              style: TextStyle(fontSize: 15.0),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
