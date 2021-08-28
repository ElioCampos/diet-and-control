import 'package:flutter/material.dart';

class RoundedButtonRegister extends StatefulWidget {
  final String title;
  final Function() onTap;
  const RoundedButtonRegister({ 
    Key? key,
    required this.title,
    required this.onTap
  }) : super(key: key);

  @override
  _RoundedButtonRegisterState createState() => _RoundedButtonRegisterState();
}

class _RoundedButtonRegisterState extends State<RoundedButtonRegister> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30.0),
        padding: EdgeInsets.symmetric(vertical: 15.0),
        width: MediaQuery.of(context).size.width*0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(width: 2.0, color: Color.fromRGBO(0, 214, 129, 1)),
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: Colors.grey,
              offset: Offset(1.0, 2.0)
            )
          ]
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: Color.fromRGBO(0, 214, 129, 1),
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
        ),
      ),
    );
  }
}