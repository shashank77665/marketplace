import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace/crud.dart';

class Userproduct extends StatefulWidget {
  const Userproduct({super.key});

  @override
  State<Userproduct> createState() => _UserproductState();
}

class _UserproductState extends State<Userproduct> {
  final FirestoreService _firestoreService =
      FirestoreService(); // Instantiate FirestoreService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestoreService
              .getUserProducts(), // Call the getUserProducts stream
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            // Check if there's an error
            if (snapshot.hasError) {
              print('Error loading products: ${snapshot.error}');
              return Center(
                  child: Text('Error loading products: ${snapshot.error}'));
            }

            // Show loading indicator while waiting for data
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // Check if there are any products
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No products found.'));
            }

            // Display the user's products
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['title'] ?? 'No Title'),
                  subtitle: Text(data['description'] ?? 'No Description'),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
