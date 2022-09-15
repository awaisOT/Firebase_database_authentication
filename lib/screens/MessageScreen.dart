import 'package:firebase/widgets/chat/messages.dart';
import 'package:firebase/widgets/chat/send_message.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/chat/send_message.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
              onPressed: (() {
                FirebaseAuth.instance.signOut();
              }),
              child: Text('Logout'),
            )
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(child: Messages()),
              SendMessage(),
            ],
          ),
        ));
  }
}
