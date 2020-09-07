import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';

import 'FinalAvatarScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _ignored = ["😂","🤣"];
  String emo = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            emo,
            style: TextStyle(fontSize: 50, color: Colors.blueAccent),
          ),
          EmojiPicker(
            ignored: _ignored,
            rows: 2,
            columns: 6,
            buttonMode: ButtonMode.MATERIAL,
            numRecommended: 10,
            onEmojiSelected: (emoji, category) {
              setState(() {
                emo = emoji.emoji;
              });
              print(emoji);
            },
          ),
          FlatButton(color: Colors.purpleAccent,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return FinalAvatarScreen(emo);
                  }));
            },
            child: Text("Select Avatar"),
          )
        ],
      ),
    );
  }
}