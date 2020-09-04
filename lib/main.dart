import 'package:emoji_picker/emoji_picker.dart';
import 'package:emojitask/FinalAvatarScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var emo = '';
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
            rows: 2,
            columns: 6,
            buttonMode: ButtonMode.MATERIAL,
            numRecommended: 10,
            onEmojiSelected: (emoji, category) {
              setState(() {
                emo = emoji.emoji;
              });
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
