import 'package:diet_and_control/models/messages.dart';
import 'package:diet_and_control/utils/text_style.dart';
import 'package:flutter/material.dart';

import 'chat_ui.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset('assets/logo.png', height: 70.0),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 290.0,
                      child: Text(
                        // "Bienvenido $name",
                        "Mensajes",
                        style: TextStyle(
                            color: Color.fromRGBO(59, 203, 90, 1.0),
                            fontSize: 27.0,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(148, 148, 148, 0.1),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        width: 0.7,
                        color: Color.fromRGBO(218, 218, 218, 1.0),
                      )),
                  height: 600,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, i) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(messages[i].user),
                              subtitle: Text(messages[i].message),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://static-cdn.jtvnw.net/jtv_user_pictures/986abe5c-d7ee-4f2b-818f-a5a421e481f2-profile_image-300x300.png"),
                                backgroundColor: customGreen,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => ChatUI(username: messages[i].user,),
                                  ),
                                );
                              },
                            ),
                            Divider(),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
