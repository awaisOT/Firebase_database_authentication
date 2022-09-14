import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/Ci8IICcputQBaEs0PNYP/messages')
            .snapshots(),
        builder: ((context, snapshot) => ListView.builder(
              itemBuilder: ((context, index) {
                return Container(
                  height: 24,
                  child: Text(snapshot.data!.docs[index]['text']),
                );
              }),
              itemCount: snapshot.data!.docs.length,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => FirebaseFirestore.instance
            .collection('chats/Ci8IICcputQBaEs0PNYP/messages')
            .add({'text': 'added on device!'}),
        child: Icon(Icons.add),
      ),
    );
  }
}
