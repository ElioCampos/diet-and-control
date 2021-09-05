import 'package:flutter/material.dart';

class DataPatient extends StatefulWidget {
  final String data;
  const DataPatient({ Key? key, required this.data }) : super(key: key);

  @override
  _DataPatientState createState() => _DataPatientState();
}

class _DataPatientState extends State<DataPatient> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      margin: EdgeInsets.symmetric(vertical: 3.0),
      child: Text(
        widget.data,
        style: TextStyle(
          color: Color.fromRGBO(109, 109, 109, 1),
          fontSize: 17.0
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}