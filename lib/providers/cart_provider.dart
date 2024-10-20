import 'package:flutter/material.dart';
import '/models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Product> _items = {};

  Map<String, Product> get items => _items;

  void addProduct(Product product) {
    _items.putIfAbsent(product.id, () => product);
    notifyListeners();
  }

  double get totalPrice {
    return _items.values.fold(0, (sum, item) => sum + item.price);
  }
}
