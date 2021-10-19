import 'dart:convert';
import 'dart:developer';

import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:get/get.dart' as global;

class ErrorText extends StatelessWidget {
  final message;
  const ErrorText({Key? key, required String this.message}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(fontSize: 40, fontFamily: "Pacific"),
    );
  }
}

class ChatUI extends StatefulWidget {
  final String username;
  final int chatId;
  final WebSocketChannel channel;
  const ChatUI(
      {Key? key,
      required this.username,
      required this.chatId,
      required this.channel})
      : super(key: key);

  @override
  _ChatUIState createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  TextEditingController messageText = new TextEditingController();

  late int userId;
  late String name;
  late int chatId;
  var channel;
  List<dynamic> messages = [];
  var message = {"command": "", "username": "", "chat_id": ""};
  var commands = ["init_chat", "fetch_messages", "new_message"];

  initChat() {
    message["command"] = commands[0];
    message["user"] = userId.toString();
    message["chat_id"] = chatId.toString();
    channel.sink.add(json.encode(message));
  }

  fetchMessage() {
    message["command"] = commands[1];
    message["user"] = userId.toString();
    message["chat"] = chatId.toString();
    channel.sink.add(json.encode(message));
  }

  @override
  void initState() {
    userId = global.Get.find<AuthController>().userId.value;
    chatId = widget.chatId;
    log('UserName: $userId');
    channel = widget.channel;
    initChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: customGreen,
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://static-cdn.jtvnw.net/jtv_user_pictures/986abe5c-d7ee-4f2b-818f-a5a421e481f2-profile_image-300x300.png"),
            ),
            SizedBox(width: 20),
            Text(
              widget.username,
              style: TextStyle(
                  color: customGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(148, 148, 148, 0.1),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        width: 0.7,
                        color: Color.fromRGBO(218, 218, 218, 1.0),
                      )),
                  child: _chatMessages(),
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 300,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        width: 0.7,
                        color: Color.fromRGBO(218, 218, 218, 1.0),
                      ),
                    ),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          child: TextField(
                            cursorColor: customGreen,
                            controller: messageText,
                            maxLines: 10,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'Enviar un mensaje...',
                              hintText: "Mensaje",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    child: RawMaterialButton(
                      onPressed: () {
                        message = {
                          "command": "new_message",
                          "from": userId.toString(),
                          "text": "",
                          "chat": chatId.toString()
                        };
                        if (messageText.text != '') {
                          setState(() {
                            var text = messageText.text;
                            message["text"] = text;
                            messageText.text = '';
                            channel.sink.add(json.encode(message));
                          });
                        }
                      },
                      elevation: 2,
                      fillColor: customGreen,
                      child: Icon(
                        Icons.send,
                        size: 25,
                      ),
                      padding: EdgeInsets.all(15),
                      shape: CircleBorder(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  bool isMainUser(message) {
    return message["author"] == global.Get.find<AuthController>().userId.value;
  }

  Widget _chatMessages() {
    return StreamBuilder(
      stream: channel.stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          var response = json.decode(snapshot.data);

          if (response["command"] == "init_chat") {
            fetchMessage();
          } else if (response["command"] == "message") {
            var data = response["messages"];
            messages = data;
          } else if (response["command"] == "new_message") {
            var newMessage = response["message"];
            messages = [newMessage] + messages;
            response = null;
          }
          // fetchMessage();
          return SingleChildScrollView(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: messages.length,
              itemBuilder: (BuildContext context, i) {
                return Column(
                  children: <Widget>[
                    Align(
                      alignment: isMainUser(messages[i])
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 250),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isMainUser(messages[i])
                              ? customGreen
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            width: 0.7,
                            color: Color.fromRGBO(218, 218, 218, 1.0),
                          ),
                        ),
                        child: Text(
                          messages[i]["content"],
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                  ],
                );
              },
            ),
          );
        } else {
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                ErrorText(
                  message: "Error when try to connect to the chat",
                )
              ]);
        }
      },
    );
  }
}
