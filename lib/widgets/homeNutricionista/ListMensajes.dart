import 'package:diet_and_control/models/Mensajes.dart';
import 'package:flutter/material.dart';

class ListMensajes extends StatefulWidget {
  const ListMensajes({ Key? key }) : super(key: key);

  @override
  _ListMensajesState createState() => _ListMensajesState();
}

class _ListMensajesState extends State<ListMensajes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color.fromRGBO(148, 148, 148, 0.1),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          width: 0.7, 
          color: Color.fromRGBO(218, 218, 218, 1.0),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Text(
              "Mensajes",
              style: TextStyle(
                color: Color.fromRGBO(59, 203, 90, 1.0),
                fontSize: 23.0
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(122, 222, 144, 1.0),
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            messages[index].user + ": ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Container(
                            width: 235.0,
                            child: Text(
                              messages[index].message,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        width: MediaQuery.of(context).size.width,
                        height: 1.5,
                        decoration: BoxDecoration(color: Colors.white),
                      )
                    ]
                  ),
                  
                );
              }
            ),
          )
        ]
      )
    );
  }
}