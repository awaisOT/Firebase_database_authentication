import 'package:firebase/widgets/chat/current_users_bubble_messgae.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUserBubble extends StatelessWidget {
  final String user;
  final String message;
  CurrentUserBubble(this.message, this.user);
  final userr = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return userr == user
        ? OtherUserBubble(message, userr)
        : Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                width: 100,
                color: Colors.teal,
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
  }
}
