import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(
      String email, String userame, String password, bool isLogin) Submit;

  AuthForm(this.Submit);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final formkey = GlobalKey<FormState>();

  String userEmail = '';
  String userName = '';
  String userPassword = '';
  bool islogin = true;

  void submit() {
    final validate = formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (validate) {
      formkey.currentState!.save();
      widget.Submit(userEmail, userName, userPassword, islogin);
      print(userEmail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal,
      margin: const EdgeInsets.all(20),
      child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: ValueKey('email'),
                    validator: ((value) {
                      if (value == null || !value.contains('@')) {
                        return 'Please make sure the Email is Vaild!';
                      }
                      return null;
                    }),
                    decoration: InputDecoration(
                      label: const Text('Email'),
                      labelStyle:
                          const TextStyle(color: Colors.white, fontSize: 16.0),
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
                    onSaved: (value) {
                      userEmail = value!;
                    },
                  ),
                ),
                if (!islogin)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      key: ValueKey('username'),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please make sure the Username Field is not empty!';
                        }
                        return null;
                      }),
                      decoration: InputDecoration(
                        label: const Text('Username'),
                        labelStyle: const TextStyle(
                            color: Colors.white, fontSize: 16.0),
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
                      onSaved: (value) {
                        userName = value!;
                      },
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    key: ValueKey('Password'),
                    validator: ((value) {
                      if (value == null || value.length < 7) {
                        return 'Please make sure the password is Vaild!';
                      }
                      return null;
                    }),
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      labelStyle:
                          const TextStyle(color: Colors.white, fontSize: 16.0),
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
                    onSaved: (value) {
                      userPassword = value!;
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: submit,
                    child: Text(islogin ? 'Sign In' : 'Sign UP')),
                TextButton(
                    onPressed: () {
                      setState(() {
                        islogin = !islogin;
                      });
                    },
                    child: Text(islogin
                        ? 'Don\'t have an account Signup'
                        : 'already have an account Sign In'))
              ],
            ),
          )),
    );
  }
}
