import 'package:diet_and_control/modules/controllers/new_patient_controller/new_patient_controller.dart';
import 'package:diet_and_control/widgets/authWidget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:flutter/services.dart';

class DatosPersonales extends GetWidget<NewPatientController> {
  const DatosPersonales({Key? key}) : super(key: key);

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
                "DATOS PERSONALES",
                style: TextStyle(
                    color: Color.fromRGBO(7, 87, 55, 1.0), fontSize: 23.0),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    _textField("Usuario",
                        textController: controller.userController),
                    _textField("Correo",
                        textController: controller.emailController),
                    _textField("Contraseña",
                        textController: controller.passController),
                    _textField("Nombre",
                        textController: controller.nameController),
                    _textField("Apellido",
                        textController: controller.lastNameController),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          Container(
                            width: 85.0,
                            child: Text(
                              "Fecha de nacimiento: ",
                              style: TextStyle(
                                  color: Color.fromRGBO(59, 203, 90, 1.0),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 150.0,
                            height: 42.0,
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1.0))),
                            child: Obx(
                              () => TextField(
                                readOnly: true,
                                style: TextStyle(fontSize: 15.0),
                                decoration: InputDecoration(
                                  labelText: controller.dateFormat.value,
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 13.0),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.calendar_today_rounded),
                                    color: Color.fromRGBO(59, 203, 90, 1.0),
                                    onPressed: () {
                                      _selectDate(context);
                                      controller.calcIcmTmb();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(children: [
                        Container(
                            width: 85.0,
                            child: Text(
                              "Sexo: ",
                              style: TextStyle(
                                  color: Color.fromRGBO(59, 203, 90, 1.0),
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                          width: 150.0,
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                  color: Color.fromRGBO(112, 112, 112, 1.0))),
                          child: Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: controller.valueChooseSex.value,
                                icon: Icon(Icons.arrow_downward),
                                elevation: 16,
                                onChanged: (value) {
                                  controller.valueChooseSex.value = value!;
                                  controller.calcIcmTmb();
                                },
                                items: controller.sex.map((valueItem) {
                                  return DropdownMenuItem<String>(
                                    value: valueItem,
                                    child: Container(
                                      width: 90.0,
                                      child: Text(
                                        valueItem,
                                        style: TextStyle(fontSize: 15.0),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    _textField("Teléfono",
                        textController: controller.phoneController),
                    _textField("DNI", textController: controller.dniController),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(children: [
                        Container(
                            width: 85.0,
                            child: Text(
                              "Actividad física: ",
                              style: TextStyle(
                                  color: Color.fromRGBO(59, 203, 90, 1.0),
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                          width: 150.0,
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                  color: Color.fromRGBO(112, 112, 112, 1.0))),
                          child: Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  value: controller.valueChooseActivity.value,
                                  icon: Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  onChanged: (value) {
                                    controller.valueChooseActivity.value =
                                        value!;
                                    controller.calcIcmTmb();
                                  },
                                  items: controller.activities.map((valueItem) {
                                    return DropdownMenuItem<String>(
                                        value: valueItem,
                                        child: Container(
                                          width: 90.0,
                                          child: Text(
                                            valueItem,
                                            style: TextStyle(fontSize: 15.0),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ));
                                  }).toList()),
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
                SizedBox(
                  width: 8.0,
                ),
                Column(children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y&s=128"),
                    radius: 40.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Tomar Foto",
                        style: TextStyle(
                            color: Color.fromRGBO(59, 203, 90, 1.0),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ])
              ],
            )
          ],
        ));
  }

  _textField(String title, {required TextEditingController textController}) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          Container(
              width: 85.0,
              child: Text(
                title + ": ",
                style: TextStyle(
                    color: Color.fromRGBO(59, 203, 90, 1.0),
                    fontWeight: FontWeight.bold),
              )),
          Container(
            width: 150.0,
            height: 42.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Color.fromRGBO(112, 112, 112, 1.0))),
            child: TextField(
              controller: textController,
              style: TextStyle(fontSize: 15.0),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: controller.date,
        firstDate: DateTime(1947),
        lastDate: DateTime(2030),
        builder: (BuildContext context, Widget? child) {
          return Theme(
              data: ThemeData(primarySwatch: Colors.green), child: child!);
        });
    if (datePicker != null && datePicker != controller.date) {
      controller.date = datePicker;
      controller.dateFormat.value =
          "${datePicker.year.toString()}/${(datePicker.month < 10) ? '0' + datePicker.month.toString() : datePicker.month.toString()}/${(datePicker.day < 10) ? '0' + datePicker.day.toString() : datePicker.day.toString()}";
    }
  }
}
