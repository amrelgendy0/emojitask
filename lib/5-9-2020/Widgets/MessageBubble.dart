import 'package:flutter/material.dart';

class MessageBubbles extends StatelessWidget {
  double redius = 10;
  String sendername;
  CrossAxisAlignment cc;
  bool isResev;
  String TEXT;
  Color Col;
  BorderRadius R;
  MessageBubbles({
    this.sendername,
    this.TEXT,
    this.isResev,
  }) {
    Col = isResev ? Colors.white : Color(0xff784661);
    cc = isResev ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    R = isResev
        ? BorderRadius.only(
            topLeft: Radius.circular(redius),
            topRight: Radius.circular(redius),
            bottomLeft: Radius.circular(redius),
            bottomRight: Radius.circular(redius))
        : BorderRadius.only(
            topRight: Radius.circular(redius),
            topLeft: Radius.circular(redius),
            bottomLeft: Radius.circular(redius),
            bottomRight: Radius.circular(redius));
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isResev
          ? EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.3)
          : EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
      child: Column(
        crossAxisAlignment: cc,
        children: <Widget>[
          isResev
              ? Text('$sendername',
                  style: TextStyle(
                      color: !isResev ? Colors.white : Color(0xff784661)))
              : SizedBox(),
          Material(
            elevation: 10,
            textStyle: TextStyle(fontSize: 15, color: Colors.white),
            borderRadius: R,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                TEXT,
                style: TextStyle(
                    color: !isResev ? Colors.white : Color(0xff784661),
                    fontWeight: FontWeight.w500),
              ),
            ),
            color: Col,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
