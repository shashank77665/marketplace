import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/pages/homepage.dart';
import 'package:marketplace/pages/login.dart';

class Authentication extends StatelessWidget {
  //const Authentication({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return HomePage();
    } else {
      return Login();
    }
  }
}
