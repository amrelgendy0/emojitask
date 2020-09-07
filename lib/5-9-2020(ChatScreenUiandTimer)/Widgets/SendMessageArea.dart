import 'package:flutter/material.dart';

class SendMessageArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 60,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.mic),
            iconSize: 31,
            color: Color(0xff784661),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.newline,
              maxLines: 2,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 1),
                hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Color(0xffD7D6D4).withOpacity(.6),
                hintText: 'Aa',
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              "Send",
              style: TextStyle(color: Color(0xff784661)),
            ),
          )
        ],
      ),
    );
  }
}
