import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool obscureText = true;
  bool isNumberCorrect = true;
  bool isLoginCorrect = true;

  TextEditingController textControllerForFirstName = TextEditingController();
  TextEditingController textControllerForLastName = TextEditingController();
  TextEditingController textControllerForTelNumber = TextEditingController();
  TextEditingController textControllerForLogin = TextEditingController();
  TextEditingController textControllerForPassword = TextEditingController();

  RegExp numberValidator = RegExp("[0-9]+");
  RegExp loginValidator = RegExp(" ");

  _togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  setNumberCorrectness(bool valid) {
    setState(() {
      isNumberCorrect = valid;
    });
  }

  setLoginCorrectness(bool valid) {
    setState(() {
      isLoginCorrect = valid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                    controller: textControllerForFirstName,
                    decoration: const InputDecoration(
                        hintText: 'First Name',
                        border: OutlineInputBorder()
                    ),
                ),
                TextField(
                    controller: textControllerForLastName,
                    decoration: const InputDecoration(
                        hintText: 'Last Name',
                        border: OutlineInputBorder(),
                    ),
                ),
                TextField(
                    controller: textControllerForTelNumber,
                    onChanged: (inputValue){
                      if (inputValue.isEmpty || numberValidator.stringMatch(inputValue)?.length == inputValue.length) {
                        setNumberCorrectness(true);
                      }
                      else {
                        setNumberCorrectness(false);
                      }
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: 'Number',
                        border: OutlineInputBorder(),
                        errorText: isNumberCorrect ? null : "Please enter your number ('+' is not required)"
                    ),
                ),
                TextField(
                  controller: textControllerForLogin,
                  maxLength: 12,
                  onChanged: (inputValue){
                    if (inputValue.isEmpty || !loginValidator.hasMatch(inputValue)) {
                      setLoginCorrectness(true);
                    }
                    else {
                      setLoginCorrectness(false);
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Login',
                      border: OutlineInputBorder(),
                      errorText: isLoginCorrect ? null : "Login mast not contain spaces, use underline symbol instead"
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                      onPressed: _togglePasswordVisibility,
                      child: const Text('Sign Up')
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}


