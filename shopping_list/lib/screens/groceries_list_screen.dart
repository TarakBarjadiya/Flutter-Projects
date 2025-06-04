import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';

class GroceriesListScreen extends StatelessWidget {
  const GroceriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        toolbarHeight: 70,
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) => ListTile(
          leading: Container(
            width: 24,
            height: 24,
            color: groceryItems[index].category.categoryColor,
          ),
          title: Text(groceryItems[index].name),
          trailing: Text('${groceryItems[index].quantity}'),
        ),
      ),
    );
  }
}
