import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/HomePages/profile/sign_up.dart';
import 'package:flutter_app/current_user.dart';

import '../../home.dart';
import '../../user.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool obscureText = true;
  bool switchButtonValue = false;
  bool isSignInFailed = false;

  TextEditingController textControllerForLogin = TextEditingController();
  TextEditingController textControllerForPassword = TextEditingController();

  _togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  _doSignIn() async {
    var db = (await FirebaseFirestore.instance.collection('users').get()).docs;
    for (var i in db) {
      if (i.get('login').toString() == textControllerForLogin.text && i.get('password').toString() == textControllerForPassword.text) {
        CurrentUser currentUser = CurrentUser();
        currentUser.setUser(User(
          i.id,
          i.get('image_path'),
          i.get('first_name'),
          i.get('last_name'),
          i.get('number'),
          i.get('login'),
          i.get('password'),
          i.get('favorites'),
          i.get('cart')
        ));
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (Route<dynamic> route) => false);
        break;
      }
    }
    setState(() {
      isSignInFailed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                onChanged: (inputValue) { setState(() { isSignInFailed = false; }); },
                controller: textControllerForLogin,
                decoration: InputDecoration(
                    errorText: isSignInFailed ? "Sign In failed" : null,
                    hintText: 'Login',
                    border: OutlineInputBorder()
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              TextField(
                controller: textControllerForPassword,
                obscureText: obscureText,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: _togglePasswordVisibility,
                        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off)
                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                      value: switchButtonValue,
                      onChanged: (value) {
                        setState(() {
                          switchButtonValue = value;
                          CurrentUser().rememberMe = switchButtonValue;
                        });
                      }
                  ),
                  const Text('Remember me')
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: _doSignIn,
                    child: const Text('Sign In')
                  ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: InkWell(
                    child: const Text('Sign Up', style: TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline)),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));},
                  )
              )
            ],
          ),
        )
      ),
    );
  }
}

