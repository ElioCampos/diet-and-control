import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String title; 
  final bool isInactive;
  final Function() onTap;
  const RoundedButton({ 
    Key? key,
    required this.title,
    required this.onTap, 
    this.isInactive = false, 
  }) : super(key: key);

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30.0),
        padding: EdgeInsets.symmetric(vertical: 15.0),
        width: MediaQuery.of(context).size.width*0.7,
        decoration: BoxDecoration(
          color: widget.isInactive ? Colors.grey.shade300 : Color.fromRGBO(0, 214, 129, 1),
          borderRadius: BorderRadius.circular(30.0),
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
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
        ),
      ),
    );
  }
}