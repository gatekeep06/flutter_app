import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/HomePages/profile/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool obscureText = true;
  bool switchButtonValue = false;

  TextEditingController textControllerForLogin = TextEditingController();
  TextEditingController textControllerForPassword = TextEditingController();

  _togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
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
                controller: textControllerForLogin,
                decoration: const InputDecoration(
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
                      onChanged: (value) => setState(() => switchButtonValue = value)
                  ),
                  const Text('Remember me')
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: _togglePasswordVisibility,
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

