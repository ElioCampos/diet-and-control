import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/modules/controllers/nutritionist_home_controller/nutritionist_home_controller.dart';
import 'package:diet_and_control/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as global;
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'chat_ui.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {

  String getName(chat) {
     return chat["sender_id"] ==
         global.Get.find<AuthController>()
             .userId
             .value
         ? "${chat["receiver_name"]}"
         : "${chat["sender_name"]}";
  }

  @override
  Widget build(BuildContext context) {
    RxList chats = global.Get.find<NutritionistHomeController>().chats;
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
                        "Chats",
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
                      itemCount:  chats.length,
                      itemBuilder: (BuildContext context, i) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(getName(chats[i]),),
                              // subtitle: Text(messages[i].message),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y&s=128"),
                                backgroundColor: customGreen,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => ChatUI(
                                      username:getName(chats[i]),
                                      chatId: chats[i]["id"],
                                    ),
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
