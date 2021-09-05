import 'package:diet_and_control/utils/text_style.dart';
import 'package:flutter/material.dart';

class ChatMessage {
  String message;
  bool isMainUser;
  String hour;

  ChatMessage(
      {required this.message, required this.isMainUser, required this.hour});
}

class ChatUI extends StatefulWidget {
  final String username;
  const ChatUI({Key? key, required this.username}) : super(key: key);

  @override
  _ChatUIState createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  TextEditingController messageText = new TextEditingController();

  List<ChatMessage> chat = [
    ChatMessage(
        message: "Qué tal, como estás", isMainUser: true, hour: "10:00"),
    ChatMessage(message: "Bien, bien", isMainUser: false, hour: "10:20"),
    ChatMessage(
        message:
            "Gracias por las recomendaciones, me está viniendo muy bien la dieta",
        isMainUser: false,
        hour: "10:20"),
    ChatMessage(message: "Qué genial", isMainUser: true, hour: "10:30"),
    ChatMessage(message: "Sigue así", isMainUser: true, hour: "10:30"),
  ];

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
                        if (messageText.text != '') {
                          setState(() {
                            var text = messageText.text;
                            messageText.text = '';
                            chat.add(
                              ChatMessage(
                                  message: text,
                                  isMainUser: true,
                                  hour: "10:20"),
                            );
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

  Widget _chatMessages() {
    return SingleChildScrollView(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: chat.length,
        itemBuilder: (BuildContext context, i) {
          return Column(
            children: <Widget>[
              Align(
                alignment: chat[i].isMainUser
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 250),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: chat[i].isMainUser ? customGreen : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      width: 0.7,
                      color: Color.fromRGBO(218, 218, 218, 1.0),
                    ),
                  ),
                  child: Text(
                    chat[i].message,
                  ),
                ),
              ),
              SizedBox(height: 3),
            ],
          );
        },
      ),
    );
  }
}
