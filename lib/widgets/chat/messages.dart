import 'package:firebase/widgets/chat/other_users_bubble_messgae.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'current_user_bubble.dart';

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
        final user = FirebaseAuth.instance.currentUser;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return ListView.builder(
          reverse: true,
          itemBuilder: ((context, index) {
            return SizedBox(
                height: 24,
                child: Row(
                  children: <Widget>[
                    CurrentUserBubble(
                        snapshot.data!.docs[index]['text'], user!.uid),

                    //Text(snapshot.data!.docs[index]['uid']),
                  ],
                ));
          }),
          itemCount: snapshot.data!.docs.length,
        );
      }),
    );
  }
}
