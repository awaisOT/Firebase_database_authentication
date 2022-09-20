import 'package:firebase/widgets/chat/current_users_bubble_messgae.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Other_user_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('timeStamp', descending: true)
          .snapshots(),
      builder: ((context, snapshot) {
        // final user = FirebaseAuth.instance.currentUser;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          reverse: true,
          itemBuilder: ((context, index) {
            return CurrentUserBubble(snapshot.data!.docs[index]['text'],
                snapshot.data!.docs[index]['userID']);
          }),
          itemCount: snapshot.data!.docs.length,
        );
      }),
    );
  }
}
