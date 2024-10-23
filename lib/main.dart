import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const NekoShopApp());
}

class NekoShopApp extends StatelessWidget {
  const NekoShopApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.purple[300],
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
          textTheme: const TextTheme(
            headlineMedium:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
