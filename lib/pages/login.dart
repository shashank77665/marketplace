import 'package:flutter/material.dart';
import 'package:marketplace/auth_function.dart';
import 'package:marketplace/pages/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    label: Text('User Email'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                    label: Text('Password'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            isLoading
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        isLoading = true;
                      });
                      // call login function here
                      login(context, email.text, pass.text);
                      setState(() {
                        isLoading = false;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.blueAccent[100])),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('New User ?'),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ));
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
