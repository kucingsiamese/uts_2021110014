import 'package:flutter/material.dart';
import 'package:uts_2021110014/models/product.dart';
import 'package:uts_2021110014/screens/cart_screen.dart';
import 'package:uts_2021110014/screens/product_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Product> products = [
    Product(
        id: 'p1',
        title: 'Product A',
        description: 'Description A',
        price: 9999999,
        imageUrl: 'https://via.placeholder.com/150'),
    Product(
        id: 'p2',
        title: 'Product B',
        description: 'Description B',
        price: 9999999,
        imageUrl: 'https://via.placeholder.com/150'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const CartScreen()));
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () {
            final selectedProduct = products[i];
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ProductScreen(product: selectedProduct),
              ),
            );
          },
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(products[i].title),
            ),
            child: Image.network(products[i].imageUrl),
          ),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
