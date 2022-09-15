import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({Key? key}) : super(key: key);

  @override
  _SendMessageState createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  TextEditingController cntrlr = TextEditingController();
  var message = '';
  void sendMessage() async {
    final auth = await FirebaseAuth.instance.currentUser!.uid;
    FocusScope.of(context).unfocus();
    cntrlr.clear();
    FirebaseFirestore.instance.collection('chat').add({
      'text': message,
      'timeStamp': Timestamp.now(),
      'userID': auth,
    });
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
                  controller: cntrlr,
                  decoration: InputDecoration(
                    label: const Text('Enter a message to send'),
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 127, 245),
                        fontSize: 16.0),
                    fillColor: Colors.amber.withOpacity(0.6),
                    filled: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                  onChanged: ((value) {
                    setState(() {
                      message = value.trim();
                    });
                    // print(message);
                  }))),
          IconButton(
            onPressed: (message.trim().isEmpty ? null : sendMessage),
            icon: const Icon(
              Icons.send,
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }
}
