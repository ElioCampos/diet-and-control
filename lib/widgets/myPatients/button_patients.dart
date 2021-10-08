import 'package:flutter/material.dart';

class ButtonPatients extends StatefulWidget {

  final String title;
  final Function() onTap;
  const ButtonPatients({ 
    Key? key,
    required this.title,
    required this.onTap
  }) : super(key: key);

  @override
  _ButtonPatientsState createState() => _ButtonPatientsState();
}

class _ButtonPatientsState extends State<ButtonPatients> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical:10,horizontal:16),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 230, 137, 1),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Color.fromRGBO(112, 112, 112, 1), width: 1.0)
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}