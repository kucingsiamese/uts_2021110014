import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2021110014/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(cart.items.values.toList()[i].title),
                trailing: Text('Rp ${cart.items.values.toList()[i].price}'),
              ),
            ),
          ),
          Text('Total: Rp ${cart.totalPrice}',
              style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // for checkout
            },
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
