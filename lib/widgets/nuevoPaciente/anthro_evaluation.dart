import 'package:flutter/material.dart';

class EvaluacionAntro extends StatefulWidget {
  const EvaluacionAntro({Key? key}) : super(key: key);

  @override
  _EvaluacionAntroState createState() =>
      _EvaluacionAntroState();
}

class _EvaluacionAntroState extends State<EvaluacionAntro> {
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
                color: Color.fromRGBO(7, 87, 55, 1.0),
                fontSize: 23.0
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  _textField("Peso", "Kg"),
                  _textField("Talla", "Cm"),
                  Text(
                    "Circunferencias: ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0
                    ),
                  ),
                  _textField("Brazo", "Cm"),
                  _textField("Abdominal", "Cm"),
                  _textField("Cadera", "Cm"),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(59, 203, 90, 1.0),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 100.0,
                          child: Text(
                            "IMC: "+ "25.5",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          " Kg/m2",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                          ),
                        )
                      ]
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(59, 203, 90, 1.0),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 110.0,
                          child: Text(
                            "TMB: "+ "2420",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          " Kcal",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                          ),
                        )
                      ]
                    ),
                  )
                ],
              )
            ],
          )
        ],
      )
    );
  }

  _textField(String title, String medida){
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          Container(
            width: 70.0,
            child: Text(
              title + " ("+medida+"): ",
              style: TextStyle(
                color: Color.fromRGBO(59, 203, 90, 1.0),
                fontWeight: FontWeight.bold
              ),
            )
          ),
          Container(
            width: 70.0,
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
          ),
        ],
      ),
    );
  }
}
