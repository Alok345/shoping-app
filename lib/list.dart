// list.dart

import 'package:flutter/material.dart';
import 'product.dart';
import 'cart.dart';

List<Product> products = [
  Product(
    name: 'Product 1',
    price: 29.99,
    imageUrl:
        'https://4.imimg.com/data4/TF/MS/ANDROID-1691793/product-500x500.jpeg', // Placeholder image
  ),
  Product(
    name: 'Product 2',
    price: 49.99,
    imageUrl:
        'https://4.imimg.com/data4/TF/MS/ANDROID-1691793/product-500x500.jpeg', // Placeholder image
  ),
  Product(
    name: 'Product 3',
    price: 19.99,
    imageUrl:
        'https://4.imimg.com/data4/TF/MS/ANDROID-1691793/product-500x500.jpeg', // Placeholder image
  ),
];

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  ProductListPageState createState() => ProductListPageState();
}

class ProductListPageState extends State<ProductListPage> {
  Map<int, int> cart = {}; // Map to hold product index and quantity in cart

  void _updateCart(int index, int quantity) {
    setState(() {
      if (quantity <= 0) {
        cart.remove(index); // Remove from cart if quantity is 0
      } else {
        cart[index] = quantity; // Update the quantity
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Pass the cart and products list to the CartPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    cart: cart,
                    products: products, // Pass products to cart page
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          int quantity = cart[index] ?? 0;

          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListTile(
              leading: Image.network(product.imageUrl),
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: quantity > 0
                        ? () => _updateCart(index, quantity - 1)
                        : null,
                  ),
                  Text('$quantity'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => _updateCart(index, quantity + 1),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // Pass the cart and products list to the CartPage
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(
                  cart: cart,
                  products: products, // Pass products to cart page
                ),
              ),
            );
          },
          child: Text('Go to Cart'),
        ),
      ),
    );
  }
}
