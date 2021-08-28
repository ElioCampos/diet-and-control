import 'package:diet_and_control/widgets/authWidget/textfield_container.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const CustomTextField({ 
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(widget.icon, color: Color.fromRGBO(0, 214, 129, 1),),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}