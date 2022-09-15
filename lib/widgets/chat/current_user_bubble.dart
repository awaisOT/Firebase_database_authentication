import 'package:firebase/widgets/chat/other_users_bubble_messgae.dart';
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
                width: 150,
                color: const Color.fromARGB(255, 156, 156, 156),
                child: Text(message),
              ),
              Text(userr)
            ],
          );
  }
}
