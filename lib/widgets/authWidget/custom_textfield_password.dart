import 'package:diet_and_control/widgets/authWidget/textfield_container.dart';
import 'package:flutter/material.dart';

class CustomTextFieldPassword extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String title;
  const CustomTextFieldPassword({ 
    Key? key,
    required this.onChanged,
    required this.title
  }) : super(key: key);

  @override
  _CustomTextFieldPasswordState createState() => _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool isVissible = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isVissible,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.lock, color: Color.fromRGBO(0, 214, 129, 1),),
          hintText: widget.title,
          suffixIcon: VisibilityIcon(),
        ),
      ),
    );
  }

  Widget VisibilityIcon(){
    return IconButton(
      onPressed: (){
        setState(() {
          isVissible = !isVissible;
        });
      }, 
      icon: isVissible ? Icon(
          Icons.visibility, 
          color: Color.fromRGBO(0, 214, 129, 1)
        ):
        Icon(
          Icons.visibility_off, 
          color: Color.fromRGBO(0, 214, 129, 1)
        )
    ); 
  }
}