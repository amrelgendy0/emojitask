import 'package:emojitask/5-9-2020/Widgets/MessageBubble.dart';
import 'package:emojitask/5-9-2020/Widgets/SendMessageArea.dart';
import 'package:flutter/material.dart';
import 'Widgets/Timer.dart';

class UIChatScreen extends StatelessWidget {
  UIChatScreen(this.sendername);
  String sendername = "Sender Name";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          appBar(),
          CustomTimer(),
          Expanded(
            child: ListView(
              children: [
                MessageBubbles(
                  sendername: sendername,
                  TEXT:
                      "Hello!\nMy laptop broke and need to repair it, so i am little bit upset. Anybody knows a good,trustworthy place?",
                  isResev: true,
                ),
                MessageBubbles(
                  sendername: sendername,
                  TEXT:
                      "Hello!\nMy laptop broke and need to repair it, so i am little bit upset. Anybody knows a good,trustworthy place?",
                  isResev: false,
                ),
                MessageBubbles(
                  sendername: sendername,
                  TEXT: "Thanks",
                  isResev: false,
                ),
                MessageBubbles(
                  sendername: sendername,
                  TEXT: "▶ 00:25",
                  isResev: false,
                ),
                MessageBubbles(
                  sendername: sendername,
                  TEXT: "Ok",
                  isResev: true,
                ),
              ],
            ),
          ),
          SendMessageArea(),
        ],
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      brightness: Brightness.light,
      title: GestureDetector(
        onTap: () {},
        child: Text(
          "$sendername",
          style: TextStyle(color: Colors.black),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25),
      )),
      leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.do_not_disturb_on),
          onPressed: () {}),
      actions: <Widget>[
        Padding(
            padding: (true)
                ? EdgeInsets.only(right: 20.0, top: 0.0)
                : EdgeInsets.only(left: 20.0, top: 0.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 15, 0, 15),
                child: Icon(Icons.do_not_disturb_on,
                    color: Colors.black, size: 25),
              ),
            ))
      ],
    );
  }

  Widget CustomTimer() {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.grey.shade700, // set border color
            width: 1.0), // set border width
        borderRadius: BorderRadius.all(
            Radius.circular(40.0)), // set rounded corner radius
      ),
      child: Timer(
        duration: 65453,
        color: Colors.black,
        fontSize: 14.6,
        onComplete: () {},
      ),
    );
  }
}
