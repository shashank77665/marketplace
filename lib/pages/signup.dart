import 'package:flutter/material.dart';
import 'package:marketplace/auth_function.dart';
import 'package:marketplace/pages/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                      setState(() {
                        isLoading = true;
                      });
                      FocusScope.of(context).unfocus();
                      // call signup function here
                      createUser(context, email.text, pass.text);
                      setState(() {
                        isLoading = false;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.blueAccent[100])),
                    child: Text(
                      "SignUp",
                      style: TextStyle(color: Colors.white),
                    )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Exizting User ?'),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                    child: Text(
                      "Login",
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
