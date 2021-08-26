import 'package:flutter/material.dart';

class ReparticionKCal extends StatefulWidget {
  const ReparticionKCal({Key? key}) : super(key: key);

  @override
  _ReparticionKCalState createState() => _ReparticionKCalState();
}

class _ReparticionKCalState extends State<ReparticionKCal> {
  final columns = ["%", "Kcal", "g", "g/Kg"];

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
                      child: Text(
                        "IMC: " + "25.5",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
                      width: 100.0,
                      child: Text(
                        "TMB: " + "2420",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Table(
              children: [
                TableRow(
                  children: [
                    nameCeldas("", Colors.transparent, Colors.transparent),
                    nameCeldas("%", Color.fromRGBO(59, 203, 90, 1.0), Colors.white),
                    nameCeldas("Kcal", Color.fromRGBO(59, 203, 90, 1.0), Colors.white),
                    nameCeldas("g", Color.fromRGBO(59, 203, 90, 1.0), Colors.white),
                    nameCeldas("g/Kg", Color.fromRGBO(59, 203, 90, 1.0), Colors.white)
                  ]
                ),
                TableRow(
                  children: [
                    nameCeldas("Carbohidratos", Color.fromRGBO(59, 203, 90, 1.0), Colors.white),
                    nameCeldas("25", Colors.white, Colors.black),
                    nameCeldas("500", Colors.white, Colors.black),
                    nameCeldas("106", Colors.white, Colors.black),
                    nameCeldas("1.45", Colors.white, Colors.black)
                  ]
                ),
                TableRow(
                  children: [
                    nameCeldas("Proteinas", Color.fromRGBO(59, 203, 90, 1.0), Colors.white),
                    nameCeldas("30", Colors.white, Colors.black),
                    nameCeldas("600", Colors.white, Colors.black),
                    nameCeldas("122", Colors.white, Colors.black),
                    nameCeldas("2.22", Colors.white, Colors.black)
                  ]
                ),
                TableRow(
                  children: [
                    nameCeldas("Grasas", Color.fromRGBO(59, 203, 90, 1.0), Colors.white),
                    nameCeldas("45", Colors.white, Colors.black),
                    nameCeldas("900", Colors.white, Colors.black),
                    nameCeldas("278", Colors.white, Colors.black),
                    nameCeldas("5.40", Colors.white, Colors.black)
                  ]
                ),
                TableRow(
                  children: [
                    nameCeldas("K Totales", Colors.redAccent, Colors.white),
                    nameCeldas("100", Colors.white, Colors.red),
                    nameCeldas("", Colors.transparent, Colors.transparent),
                    nameCeldas("", Colors.transparent, Colors.transparent),
                    nameCeldas("", Colors.transparent, Colors.transparent)
                  ]
                )
              ],
            ),
          ),
        ]
      )
    );
  }

  Widget nameCeldas(String name, Color color, Color textColor){
    return Container(
      padding: EdgeInsets.all(3.0),
      height: 40.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        )
      ),
    );
  }
}
