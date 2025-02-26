import 'package:flutter/material.dart';
import 'list.dart';  // Import the list.dart file where products are defined

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Image.network(product.imageUrl),  // Display product image
                title: Text(product.name),  // Display product name
                subtitle: Text('\$${product.price}'),  // Display product price
                isThreeLine: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
