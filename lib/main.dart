import 'package:flutter/material.dart';

import '5-10-2020(poll)/FirstPoolScreen.dart';

void main() {
  runApp(Splah());
}

class Splah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPollScreen(),
    );
  }
}
