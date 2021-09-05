import 'package:diet_and_control/models/patient.dart';
import 'package:flutter/material.dart';

class ViewStatus extends StatefulWidget {
  final Paciente paciente;
  const ViewStatus({ Key? key, required this.paciente }) : super(key: key);

  @override
  _ViewStatusState createState() => _ViewStatusState();
}

class _ViewStatusState extends State<ViewStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.paciente.statusDay.length,
            itemBuilder: (context, index){
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: statusColor(widget.paciente.statusDay.values.elementAt(index))
                    ),
                  ),
                  Text(
                    widget.paciente.statusDay.keys.elementAt(index),
                    style: TextStyle(
                      color: Color.fromRGBO(7, 87, 55, 1),
                      fontWeight: FontWeight.bold
                    ),
                  )
                ]
              );
            }
          )
        ],
      )
    );
  }
  Color statusColor(value){
    if(value == 0){
      return Color.fromRGBO(109, 109, 109, 1);
    }else if(value == 1){
      return Color.fromRGBO(0, 214, 129, 1);
    }else if(value == 2){
      return Color.fromRGBO(255, 120, 4, 1);
    }else{
      return Color.fromRGBO(255, 244, 137, 1);
    }
  }
}