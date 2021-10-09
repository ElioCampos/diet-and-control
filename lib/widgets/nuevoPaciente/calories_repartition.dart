import 'package:diet_and_control/modules/controllers/new_patient_controller/new_patient_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ReparticionKCal extends GetView<NewPatientController> {
  const ReparticionKCal({Key? key}) : super(key: key);

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              "REPARTICIÓN DE KCAL",
              style: TextStyle(
                  color: Color.fromRGBO(7, 87, 55, 1.0), fontSize: 23.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(59, 203, 90, 1.0),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Row(children: [
                    Container(
                      width: 90.0,
                      child: Obx(
                        () => Text(
                          "IMC: ${controller.icmIndice.value}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),
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
                          fontSize: 14.0),
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
                  child:Row(children: [
                    Text(
                      "TMB: ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                    Container(
                      width: 70.0,
                      child:                       
                      TextField(
                          keyboardType: TextInputType.number,                          
                          controller: controller.tmbController,
                          onChanged: (value) {
                            if (value.length > 4) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              controller.tmbController.text =
                                  controller.tmbController.text[0] + controller.tmbController.text[1]
                                  + controller.tmbController.text[2] + controller.tmbController.text[3]
                                  + controller.tmbController.text[4] + controller.tmbController.text[5]
                                  + controller.tmbController.text[6];
                            }
                            if (value != "") {                              
                                  controller.tbmIndice.value = controller.tmbController.text;                              
                            }
                          },
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                          decoration: InputDecoration(                            
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          ),
                        ),
                    ),
                    Text(
                      " Kg/m2",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    )
                  ]),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Obx(
              () => Table(
                children: [
                  TableRow(children: [
                    nameCeldas("", Colors.transparent, Colors.transparent),
                    nameCeldas(
                        "%", Color.fromRGBO(59, 203, 90, 1.0), Colors.white),
                    nameCeldas(
                        "Kcal", Color.fromRGBO(59, 203, 90, 1.0), Colors.white),
                    nameCeldas(
                        "g", Color.fromRGBO(59, 203, 90, 1.0), Colors.white),
                    nameCeldas(
                        "g/Kg", Color.fromRGBO(59, 203, 90, 1.0), Colors.white)
                  ]),
                  TableRow(children: [
                    nameCeldas("Carbohidratos",
                        Color.fromRGBO(59, 203, 90, 1.0), Colors.white),
                    _textField(context,
                        textController: controller.carbohydrateController,
                        type: 1),
                    nameCeldas(
                        (controller.carbohydrates *
                                double.parse(controller.tbmIndice.value) /
                                100)
                            .toStringAsFixed(0),
                        Colors.white,
                        Colors.black),
                    nameCeldas(
                        (controller.carbohydrates *
                                double.parse(controller.tbmIndice.value) /
                                400)
                            .toStringAsFixed(0),
                        Colors.white,
                        Colors.black),
                    nameCeldas(
                        (controller.carbohydrates *
                                double.parse(controller.tbmIndice.value) /
                                400 /
                                double.parse(
                                  (controller.weightController.text.length == 0
                                      ? "0"
                                      : controller.weightController.text),
                                ))
                            .toStringAsFixed(2),
                        Colors.white,
                        Colors.black)
                  ]),
                  TableRow(children: [
                    nameCeldas("Proteinas", Color.fromRGBO(59, 203, 90, 1.0),
                        Colors.white),
                    _textField(context,
                        textController: controller.proteinController, type: 2),
                    nameCeldas(
                        (controller.protein *
                                double.parse(controller.tbmIndice.value) /
                                100)
                            .toStringAsFixed(0),
                        Colors.white,
                        Colors.black),
                    nameCeldas(
                        (controller.protein *
                                double.parse(controller.tbmIndice.value) /
                                400)
                            .toStringAsFixed(0),
                        Colors.white,
                        Colors.black),
                    nameCeldas(
                        (controller.protein *
                                double.parse(controller.tbmIndice.value) /
                                400 /
                                double.parse(
                                  (controller.weightController.text.length == 0
                                      ? "0"
                                      : controller.weightController.text),
                                ))
                            .toStringAsFixed(2),
                        Colors.white,
                        Colors.black)
                  ]),
                  TableRow(children: [
                    nameCeldas("Grasas", Color.fromRGBO(59, 203, 90, 1.0),
                        Colors.white),
                    _textField(context,
                        textController: controller.fatController, type: 3),
                    nameCeldas(
                        (controller.fat *
                                double.parse(controller.tbmIndice.value) /
                                100)
                            .toStringAsFixed(0),
                        Colors.white,
                        Colors.black),
                    nameCeldas(
                        (controller.fat *
                                double.parse(controller.tbmIndice.value) /
                                900)
                            .toStringAsFixed(0),
                        Colors.white,
                        Colors.black),
                    nameCeldas(
                        (controller.fat *
                                double.parse(controller.tbmIndice.value) /
                                900 /
                                double.parse(
                                  (controller.weightController.text.length == 0
                                      ? "0"
                                      : controller.weightController.text),
                                ))
                            .toStringAsFixed(2),
                        Colors.white,
                        Colors.black)
                  ]),
                  TableRow(children: [
                    nameCeldas("K Totales", Colors.redAccent, Colors.white),
                    Obx(() {
                      return nameCeldas(
                          "${controller.fat.value + controller.carbohydrates.value + controller.protein.value}",
                          Colors.white,
                          Colors.red);
                    }),
                    nameCeldas("", Colors.transparent, Colors.transparent),
                    nameCeldas("", Colors.transparent, Colors.transparent),
                    nameCeldas("", Colors.transparent, Colors.transparent)
                  ])
                ],
              ),
            ),
          ),
        ]));
  }

  Widget requerimentText(String text, double size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        text,
        style: TextStyle(
            color: Color.fromRGBO(59, 203, 90, 1.0),
            fontWeight: FontWeight.bold,
            fontSize: size),
      ),
    );
  }

  _textField(BuildContext context,
      {required TextEditingController textController, required int type}) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 70.0,
        height: 42.0,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: Colors.transparent)),
        child: TextField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          controller: textController,
          onChanged: (value) {
            if (value.length > 2) {
              FocusScope.of(context).requestFocus(FocusNode());
              textController.text =
                  textController.text[0] + textController.text[1];
            }
            if (value != "") {
              switch (type) {
                case 1:
                  controller.carbohydrates.value =
                      int.parse(textController.text);
                  break;
                case 2:
                  controller.protein.value = int.parse(textController.text);
                  break;
                case 3:
                  controller.fat.value = int.parse(textController.text);
                  break;
                case 4:
                  controller.tbmIndice.value = textController.text;
                  break;
              }
            }
          },
          style: TextStyle(fontSize: 15.0),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget nameCeldas(String name, Color color, Color textColor) {
    return Container(
      padding: EdgeInsets.all(3.0),
      height: 40.0,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(20.0)),
      child: Center(
          child: Text(
        name,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      )),
    );
  }
}
