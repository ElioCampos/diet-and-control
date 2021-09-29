import 'package:diet_and_control/modules/controllers/new_patient_controller/new_patient_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class EstadoSalud extends GetView<NewPatientController> {
  const EstadoSalud({Key? key}) : super(key: key);

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
                "ESTADO DE SALUD",
                style: TextStyle(
                    color: Color.fromRGBO(7, 87, 55, 1.0), fontSize: 23.0),
              ),
            ),
            Row(
              children: [
                Container(
                    width: 150.0,
                    child: Text(
                      "Enfermedad(s) Actual: ",
                      style: TextStyle(
                          color: Color.fromRGBO(59, 203, 90, 1.0),
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                          color: Color.fromRGBO(112, 112, 112, 1.0))),
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: controller.valueChooseActual.value,
                          icon: Icon(Icons.arrow_downward),
                          elevation: 16,
                          onChanged: (value) {
                            controller.valueChooseActual.value = value!;
                          },
                          items: controller.enfermedades.map((valueItem) {
                            return DropdownMenuItem<String>(
                                value: valueItem,
                                child: Container(
                                  width: 130.0,
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
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Hábitos nocivos: ",
              style: TextStyle(
                  color: Color.fromRGBO(59, 203, 90, 1.0),
                  fontWeight: FontWeight.bold),
            ),
            Container(
                child: Wrap(
              spacing: 5.0,
              runSpacing: 3.0,
              children: [
                ChipOptions(
                  chipName: "Alcoholismo",
                  listOptions: controller.options,
                ),
                ChipOptions(
                  chipName: "Tabaco",
                  listOptions: controller.options,
                ),
                ChipOptions(chipName: "Drogas", listOptions: controller.options)
              ],
            )),
            Row(
              children: [
                Container(
                    width: 150.0,
                    child: Text(
                      "Enfermedad(s) Anteriores: ",
                      style: TextStyle(
                          color: Color.fromRGBO(59, 203, 90, 1.0),
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                          color: Color.fromRGBO(112, 112, 112, 1.0))),
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: controller.valueChooseAnt.value,
                          icon: Icon(Icons.arrow_downward),
                          elevation: 16,
                          onChanged: (value) {
                            controller.valueChooseAnt.value = value!;
                          },
                          items: controller.enfermedades.map((valueItem) {
                            return DropdownMenuItem<String>(
                                value: valueItem,
                                child: Container(
                                  width: 130.0,
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
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Algún familiar padece de: ",
              style: TextStyle(
                  color: Color.fromRGBO(59, 203, 90, 1.0),
                  fontWeight: FontWeight.bold),
            ),
            Container(
                child: Wrap(
              spacing: 5.0,
              runSpacing: 3.0,
              children: [
                ChipOptions(
                  chipName: "Obesidad",
                  listOptions: controller.options,
                ),
                ChipOptions(
                    chipName: "Diabetes", listOptions: controller.options),
                ChipOptions(
                    chipName: "Hipertensión", listOptions: controller.options)
              ],
            )),
          ],
        ));
  }
}

class ChipOptions extends StatefulWidget {
  final String chipName;
  final List listOptions;

  const ChipOptions(
      {Key? key, required this.chipName, required this.listOptions})
      : super(key: key);

  @override
  _ChipOptionsState createState() => _ChipOptionsState();
}

class _ChipOptionsState extends State<ChipOptions> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: Text(widget.chipName),
      selected: _isSelected,
      selectedColor: Colors.green,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
          if (_isSelected == true) {
            widget.listOptions.add(widget.chipName);
          } else {
            widget.listOptions.remove(widget.chipName);
          }
          print(widget.listOptions);
        });
      },
    );
  }
}
