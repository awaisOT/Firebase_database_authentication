import 'package:firebase/widgets/chat/current_users_bubble_messgae.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(5),
                width: 100,
                color: Colors.teal,
                child: Column(
                  children: [
                    FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection('users')
                            .doc(user)
                            .get(),
                        builder: ((context, snapshot) {
                          // final user = FirebaseAuth.instance.currentUser;
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return Text(
                            snapshot.data!['username'].toString(),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 251, 0)),
                          );
                        })),
                    Text(
                      message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
