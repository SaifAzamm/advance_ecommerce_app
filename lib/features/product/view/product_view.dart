import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Products Screen',
          style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
