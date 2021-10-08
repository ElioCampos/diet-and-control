import 'package:diet_and_control/widgets/authWidget/textfield_container.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final bool isValid;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.isValid,
      required this.onChanged,
      required this.controller})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(
              widget.icon,
              color: Color.fromRGBO(0, 214, 129, 1),
            ),
            hintText: widget.hintText,
            errorText: widget.isValid ? null : "Complete este campo."),
      ),
    );
  }
}
