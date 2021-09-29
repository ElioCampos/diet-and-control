import 'package:diet_and_control/utils/validators.dart';
import 'package:diet_and_control/widgets/authWidget/textfield_container.dart';
import 'package:flutter/material.dart';

class CustomTextFieldPassword extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final bool isRepeat;
  final String title;
  final TextEditingController controller;
  final TextEditingController? repeatController;
  const CustomTextFieldPassword(
      {Key? key,
      required this.onChanged,
      required this.isRepeat,
      required this.title,
      required this.controller,
      this.repeatController})
      : super(key: key);

  @override
  _CustomTextFieldPasswordState createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isVisible,
        onChanged: widget.onChanged,
        controller:
            widget.isRepeat ? widget.repeatController : widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.lock,
            color: Color.fromRGBO(0, 214, 129, 1),
          ),
          hintText: widget.title,
          errorText: widget.isRepeat
              ? errorPassword(widget.controller.text, widget.repeatController!.text)
              : errorPassword(
                  widget.controller.text, null),
          suffixIcon: _visibilityIcon(),
        ),
      ),
    );
  }

  Widget _visibilityIcon() {
    return IconButton(
        onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        icon: isVisible
            ? Icon(Icons.visibility, color: Color.fromRGBO(0, 214, 129, 1))
            : Icon(Icons.visibility_off,
                color: Color.fromRGBO(0, 214, 129, 1)));
  }
}
