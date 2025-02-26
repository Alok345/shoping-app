// cart.dart

import 'package:flutter/material.dart';
import 'product.dart';

class CartPage extends StatelessWidget {
  final Map<int, int> cart;
  final List<Product> products;

  // Add 'const' to the constructor and 'key' parameter to the constructor
  const CartPage({super.key, required this.cart, required this.products});

  @override
  Widget build(BuildContext context) {
    List<Widget> cartItems = [];
    cart.forEach((index, quantity) {
      Product product = products[index];
      cartItems.add(
        ListTile(
          title: Text(product.name),
          subtitle: Text('Quantity: $quantity - \$${product.price * quantity}'),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: cartItems.isEmpty
          ? Center(child: Text('No items in the cart'))
          : ListView(children: cartItems),
    );
  }
}
