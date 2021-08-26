import 'package:flutter/material.dart';

class EstadoSalud extends StatefulWidget {
  const EstadoSalud({Key? key}) : super(key: key);

  @override
  _EstadoSaludState createState() => _EstadoSaludState();
}

class _EstadoSaludState extends State<EstadoSalud> {
  String? valueChooseActual;
  String? valueChooseAnt;
  List enfermedades = ["Postrado en cama", "Baja actividad"];
  List options = [];

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
                  width: 190.0,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                          color: Color.fromRGBO(112, 112, 112, 1.0))),
                  child: DropdownButton<String>(
                      value: valueChooseActual,
                      icon: Icon(Icons.arrow_downward),
                      elevation: 16,
                      onChanged: (value) {
                        setState(() {
                          valueChooseActual = value;
                        });
                      },
                      items: enfermedades.map((valueItem) {
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
              ],
            ),
            SizedBox(height: 5.0,),
            Text(
              "Hábitos nocivos: ",
              style: TextStyle(
                color: Color.fromRGBO(59, 203, 90, 1.0),
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              child: Wrap(
                spacing: 5.0,
                runSpacing: 3.0,
                children: [
                  ChipOptions(chipName: "Alcoholismo", listOptions: options,),
                  ChipOptions(chipName: "Tabaco", listOptions: options,),
                  ChipOptions(chipName: "Drogas", listOptions: options)
                ],
              )
            ),
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
                  child: DropdownButton<String>(
                      value: valueChooseAnt,
                      icon: Icon(Icons.arrow_downward),
                      elevation: 16,
                      onChanged: (value) {
                        setState(() {
                          valueChooseAnt = value;
                        });
                      },
                      items: enfermedades.map((valueItem) {
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
              ],
            ),
            SizedBox(height: 5.0,),
            Text(
              "Algún familiar padece de: ",
              style: TextStyle(
                color: Color.fromRGBO(59, 203, 90, 1.0),
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              child: Wrap(
                spacing: 5.0,
                runSpacing: 3.0,
                children: [
                  ChipOptions(chipName: "Obesidad", listOptions: options,),
                  ChipOptions(chipName: "Diabetes", listOptions: options),
                  ChipOptions(chipName: "Hipertensión", listOptions: options)
                ],
              )
            ),
          ],
        ));
  }
}

class ChipOptions extends StatefulWidget {
  final String chipName;
  final List listOptions;

  const ChipOptions({ 
    Key? key,
    required this.chipName,
    required this.listOptions
  }) : super(key: key);

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
      onSelected: (isSelected){
        setState(() {
          _isSelected = isSelected;
          if(_isSelected == true){
            widget.listOptions.add(widget.chipName);
          }else{
            widget.listOptions.remove(widget.chipName);
          }
          print(widget.listOptions);
        });
      },
    );
  }
}