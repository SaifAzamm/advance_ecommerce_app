import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cart Screen', style: Theme.of(context).textTheme.titleLarge),
    );
  }
}