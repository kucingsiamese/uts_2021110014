import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(
        children: [
          Image.network(product.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.description,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Text('Rp ${product.price}', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .addProduct(product);
              Navigator.of(context).pop();
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
