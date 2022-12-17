import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController textControllerForLogin = TextEditingController();
  TextEditingController textControllerForPassword = TextEditingController();
  FilteringTextInputFormatter loginFilter = FilteringTextInputFormatter.deny(' ', replacementString: '_');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            TextField(
              controller: textControllerForLogin,
              maxLength: 12,
              inputFormatters: [loginFilter],
              decoration: const InputDecoration(
                  hintText: 'Login',
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green))
              ),
            ),
            TextField(
              controller: textControllerForPassword,
              obscureText: true,
              maxLength: 12,
              decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

