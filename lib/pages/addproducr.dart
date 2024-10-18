import 'package:flutter/material.dart';
import 'package:marketplace/crud.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();

  void _resetFields() {
    _titleController.clear();
    _descriptionController.clear();
    FocusScope.of(context).unfocus();
  }

  void _addProduct() async {
    String title = _titleController.text;
    String description = _descriptionController.text;

    // Close the keyboard
    FocusScope.of(context).unfocus();

    try {
      // Call the Firestore service to add the product
      await _firestoreService.addProduct(
          title: title, description: description);

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added successfully!')),
      );

      // Optionally, clear fields after adding product
      _resetFields();
    } catch (e) {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add product: $e')),
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _resetFields,
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: _addProduct,
                  child: const Text('Add Product'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
