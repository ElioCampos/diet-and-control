import 'package:flutter/material.dart';

class ButtonPicture extends StatefulWidget {

  final String title;
  final String pictureUrl;
  final Function() onTap;
  const ButtonPicture({ 
    Key? key,
    required this.title,
    required this.pictureUrl,
    required this.onTap
  }) : super(key: key);

  @override
  _ButtonPictureState createState() => _ButtonPictureState();
}

class _ButtonPictureState extends State<ButtonPicture> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: 130,
        padding: EdgeInsets.symmetric(vertical:10,horizontal:16),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 230, 137, 1),
          borderRadius: BorderRadius.circular(20.0),          
          border: Border.all(color: Color.fromRGBO(0, 230, 137, 1), width: 1.0),
          image: DecorationImage(
            image: NetworkImage(widget.pictureUrl),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
          ),
        ),
        child: Center(
        child: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.0,
            fontWeight: FontWeight.bold
          ),
        ),
        ),        
      ),
    );
  }
}