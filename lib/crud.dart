import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addProduct(
      {required String title, required String description}) async {
    print('Trying to add product');
    try {
      // Get current timestamp
      final Timestamp currentTime = Timestamp.now();

      // Define the product data
      final Map<String, dynamic> productData = {
        'title': title,
        'description': description,
        'userUid': _auth.currentUser?.uid,
        'createdAt': currentTime,
      };

      // Add product to the "products" collection
      await _firestore.collection('products').add(productData);

      print('Product added successfully!');
    } catch (e) {
      print('Error adding product: $e');
    }
  }

  Stream<QuerySnapshot> getAllProducts() {
    return _firestore
        .collection('products')
        .orderBy('createdAt',
            descending: true) // Sort by timestamp, newest first
        .snapshots(); // Return as stream to listen for real-time changes
  }

  Stream<QuerySnapshot> getUserProducts() {
    final String? userUid = _auth.currentUser?.uid; // Get current user's UID

    // If user is logged in, return products by the user
    if (userUid != null) {
      return _firestore
          .collection('products')
          .where('userUid', isEqualTo: userUid) // Filter by user UID
          .orderBy('createdAt', descending: true) // Sort by timestamp
          .snapshots(); // Return as stream to listen for real-time changes
    } else {
      // If no user is logged in, return an empty stream
      return const Stream.empty();
    }
  }
}
