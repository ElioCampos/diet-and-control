import 'package:flutter/material.dart';

class TextFieldContainer extends StatefulWidget {
  final Widget child;
  const TextFieldContainer({ 
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  _TextFieldContainerState createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      width: MediaQuery.of(context).size.width*0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Colors.grey,
            offset: Offset(2.0, 2.0)
          )
        ]
      ),
      child: widget.child
    );
  }
}