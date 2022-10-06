import 'package:flutter/material.dart';
import 'package:ijob_app/modules/Chat/views/mensagens.dart';
import 'package:ijob_app/modules/Chat/views/userChat.dart';

class chatMain extends StatefulWidget {
  final User user;

  chatMain({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<chatMain> {
  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.70,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5)
                  ]),
              child: Text(message.text),
            ),
          ),
          !isSameUser
              ? Container(
                  padding: EdgeInsets.only(right: 10),
                  alignment: Alignment.topRight,
                  child: Text(
                    message.time,
                    style: TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                )
              : Container(child: null)
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.70,
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5)
                      ]),
                  child: Text(message.text),
                ),
              ),
              !isSameUser
                  ? Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        message.time,
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                    )
                  : Container(child: null),
            ],
          ),
        ],
      );
    }
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 60,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
          Expanded(
            child: TextField(
              decoration:
                  InputDecoration.collapsed(hintText: 'Envie uma mensagem!'),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.send))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int timeFinal = 0;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.user.name,
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.all(15),
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Message message = messages[index];
                    final bool isMe = message.sender.id == currentUser.id;
                    final bool isSameUser = timeFinal == message.sender.id;
                    timeFinal = message.sender.id;
                    return _chatBubble(message, isMe, isSameUser);
                  })),
          _sendMessageArea(),
        ],
      ),
    );
  }
}
