import 'package:flutter/material.dart';

class OtherUserBubble extends StatelessWidget {
  final String userr;
  final String message;
  OtherUserBubble(this.message, this.userr);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          color: Colors.teal,
          child: Text(message),
        ),
        Text(userr)
      ],
    );
  }
}
