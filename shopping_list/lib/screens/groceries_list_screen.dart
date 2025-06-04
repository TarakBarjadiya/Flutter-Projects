import 'package:flutter/material.dart';

class GroceriesListScreen extends StatelessWidget {
  const GroceriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Groceries"),
        toolbarHeight: 70,
      ),
    );
  }
}
