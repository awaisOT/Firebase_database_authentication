import 'package:flutter/material.dart';

import '../widgets/auth_form.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final auth = FirebaseAuth.instance;

  void submit(
      String email, String? username, String password, bool islogin) async {
    UserCredential usercredential;
    if (islogin) {
      await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      print('login done');
    } else {
      await auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      print('Signup done');
      FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .set({
        'email': email,
        'username': username,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: SingleChildScrollView(
            child: AuthForm(submit),
          ),
        ),
      ),
    );
  }
}
