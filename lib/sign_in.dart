import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  FilteringTextInputFormatter loginFilter = FilteringTextInputFormatter.deny(' ', replacementString: '_');

  _togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: textControllerForLogin,
                maxLength: 12,
                inputFormatters: [loginFilter],
                decoration: const InputDecoration(
                    hintText: 'Login',
                    border: OutlineInputBorder()
                ),
              ),
              TextField(
                controller: textControllerForPassword,
                obscureText: obscureText,
                maxLength: 12,
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
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: _togglePasswordVisibility,
                    child: Text('Sign In')
                  ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: ElevatedButton(
                    onPressed: _togglePasswordVisibility,
                    child: Text('Sign Up'),
                  ),
              )
            ],
          ),
        )
      ),
    );
  }
}

