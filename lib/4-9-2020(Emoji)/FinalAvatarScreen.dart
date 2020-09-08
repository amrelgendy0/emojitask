import 'package:flutter/material.dart';

class FinalAvatarScreen extends StatelessWidget {
  FinalAvatarScreen(this.emoji);
  String emoji;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          emoji,
          style: TextStyle(
            fontSize: 300,
          ),
        ),
      ),
    );
  }
}
