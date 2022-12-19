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
  bool isPasswordCorrect = true;
  bool isConfirmCorrect = true;

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

  setPasswordCorrectness(bool valid) {
    setState(() {
      isPasswordCorrect = valid;
    });
  }

  setConfirmCorrectness(bool valid) {
    setState(() {
      isConfirmCorrect = valid;
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
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                TextField(
                    controller: textControllerForLastName,
                    decoration: const InputDecoration(
                        hintText: 'Last Name',
                        border: OutlineInputBorder(),
                    ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
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
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                TextField(
                  controller: textControllerForLogin,
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
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                TextField(
                  controller: textControllerForPassword,
                  obscureText: obscureText,
                  onSubmitted: (inputValue) {
                    if (inputValue.length <= 16 && inputValue.length >= 6) {
                      setPasswordCorrectness(true);
                    }
                    else {
                      setPasswordCorrectness(false);
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: const OutlineInputBorder(),
                      errorText: isPasswordCorrect ? null : "Password must be longer than 5 characters and shorter than 17",
                      suffixIcon: IconButton(
                          onPressed: _togglePasswordVisibility,
                          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off)
                      )
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                TextField(
                  obscureText: obscureText,
                  onSubmitted: (inputValue) {
                    if (inputValue == textControllerForPassword.text) {
                      setConfirmCorrectness(true);
                    }
                    else {
                      setConfirmCorrectness(false);
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    border: const OutlineInputBorder(),
                    errorText: isConfirmCorrect ? null : "Passwords do not match",
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


