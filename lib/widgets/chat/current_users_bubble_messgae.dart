import 'package:flutter/material.dart';

class OtherUserBubble extends StatelessWidget {
  final String userr;
  final String message;
  OtherUserBubble(this.message, this.userr);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          //alignment: Alignment.topRight,
          width: 100,
          // height: 50,
          color: Color.fromARGB(255, 201, 201, 201),
          child: Text(message),
        ),
      ],
    );
  }
}
