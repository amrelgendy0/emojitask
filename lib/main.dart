import 'package:emoji_picker/emoji_picker.dart';
import 'package:emojitask/5-8-2020/FinalAvatarScreen.dart';
import 'package:emojitask/5-9-2020/UIChatScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [Image.network("https://f.top4top.io/p_1709uj9pw1.gif")],
        ),
      ),
    );
  }
}
