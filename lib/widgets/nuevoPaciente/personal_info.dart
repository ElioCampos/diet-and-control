import 'package:flutter/material.dart';

class DatosPersonales extends StatefulWidget {
  const DatosPersonales({ Key? key }) : super(key: key);

  @override
  _DatosPersonalesState createState() => _DatosPersonalesState();
}

class _DatosPersonalesState extends State<DatosPersonales> {
  DateTime _date = new DateTime.now();
  String _dateFormat = "";
  String? valueChoose;
  List activities = ["Postrado en cama", "Baja actividad"];

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
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              "DATOS PERSONALES",
              style: TextStyle(
                color: Color.fromRGBO(7, 87, 55, 1.0),
                fontSize: 23.0
              ),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  _textField("Nombre"),
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
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                        Container(
                          width: 150.0,
                          height: 42.0,
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(color: Color.fromRGBO(112, 112, 112, 1.0))
                          ),
                          child: TextField(
                            readOnly: true,
                            style: TextStyle(fontSize: 15.0),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: _dateFormat,
                              labelStyle: TextStyle(color: Colors.black, fontSize: 13.0),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today_rounded),
                                color: Color.fromRGBO(59, 203, 90, 1.0),
                                onPressed: (){
                                  setState(() {
                                    _selectDate(context);
                                  });
                                },
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  _textField("Sexo"),
                  _textField("Teléfono"),
                  _textField("DNI"),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: [
                        Container(
                          width: 85.0,
                          child: Text(
                            "Actividad física: ",
                            style: TextStyle(
                              color: Color.fromRGBO(59, 203, 90, 1.0),
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                        Container(
                          width: 150.0,
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(color: Color.fromRGBO(112, 112, 112, 1.0))
                          ),
                          child: DropdownButton<String>(
                            value: valueChoose,
                            icon: Icon(Icons.arrow_downward),
                            elevation: 16,
                            onChanged: (value){
                              setState(() {
                                this.valueChoose = value;
                                          });
                            },
                            items: activities.map((valueItem) {
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
                                )
                              );
                            }).toList()
                          ),
                        ),
                      ]
                    ),
                  )
                ],
              ),
              SizedBox(width: 8.0,),
              Column(
                children: [
                  CircleAvatar(
                  backgroundImage: NetworkImage("https://static-cdn.jtvnw.net/jtv_user_pictures/986abe5c-d7ee-4f2b-818f-a5a421e481f2-profile_image-300x300.png"),
                  radius: 45.0,
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Tomar Foto",
                        style: TextStyle(
                          color: Color.fromRGBO(59, 203, 90, 1.0),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ]
               )
            ],
          )
        ],
      )
    );
  }
  _textField(String title){
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
                fontWeight: FontWeight.bold
              ),
            )
          ),
          Container(
            width: 150.0,
            height: 42.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(color: Color.fromRGBO(112, 112, 112, 1.0))
            ),
            child: TextField(
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

  Future<Null> _selectDate(BuildContext context) async{
    DateTime? datePicker = await showDatePicker(
      context: context, 
      initialDate: _date, 
      firstDate: DateTime(1947), 
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child){
        return Theme(data: ThemeData(
          primarySwatch: Colors.green
          ), 
        child: child!);
      }
    );
    if(datePicker != null && datePicker != _date){
      setState(() {
        _date=datePicker;
        _dateFormat = datePicker.year.toString()+"/"+datePicker.month.toString()+"/"+datePicker.day.toString();
      });
    }
  }
}