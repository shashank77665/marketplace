import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace/crud.dart';

class GlobalMarket extends StatefulWidget {
  const GlobalMarket({super.key});

  @override
  State<GlobalMarket> createState() => _GlobalMarketState();
}

class _GlobalMarketState extends State<GlobalMarket> {
  final FirestoreService _firestoreService =
      FirestoreService(); // Instantiate FirestoreService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Market'),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestoreService
              .getAllProducts(), // Call the getAllProducts stream
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                      CircularProgressIndicator()); // Show a loading indicator while waiting
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Error loading products.'));
            }

            // Check if there are any products
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No products found.'));
            }

            // Get the product data and display it
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
