import 'package:flutter/material.dart';
import 'package:marketplace/auth_function.dart';

class Usersetting extends StatefulWidget {
  const Usersetting({super.key});

  @override
  State<Usersetting> createState() => _UsersettingState();
}

class _UsersettingState extends State<Usersetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
            onPressed: () {
              logout(context);
            },
            child: Text('Log Out')),
      )),
    );
  }
}
