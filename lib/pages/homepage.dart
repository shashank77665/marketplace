import 'package:flutter/material.dart';
import 'package:marketplace/pages/addproducr.dart';
import 'package:marketplace/pages/globalmarket.dart';
import 'package:marketplace/pages/userproduct.dart';
import 'package:marketplace/pages/usersetting.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages corresponding to each bottom nav item
  final List<Widget> _pages = [
    GlobalMarket(),
    Userproduct(),
    AddProduct(),
    Usersetting()
  ];

  // Function to handle navigation between items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensures labels are always shown
        currentIndex: _selectedIndex, // Selected tab
        onTap: _onItemTapped, // Handle tap on items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory),
            label: 'Global Marketplace',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'User Added Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'User Settings',
          ),
        ],
      ),
    );
  }
}
