import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/pages/homepage.dart';
import 'package:marketplace/pages/login.dart';

Future createUser(context, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (_auth.currentUser != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }
  } on FirebaseAuthException catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(e.message ?? "error occured"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'))
        ],
      ),
    );
  }
}

Future<void> login(context, String email, String password) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    if (_auth.currentUser != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Logged in Sucessfull')));
    }
  } on FirebaseAuthException catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Login Alert'),
        content: Text(e.message ?? 'Failed to login'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'))
        ],
      ),
    );
  }
}

Future<dynamic>? logout(context) {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    _auth.signOut();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Logged out Sucessfully')));
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.message ?? 'Failed to logout')));
  }
  return null;
}
