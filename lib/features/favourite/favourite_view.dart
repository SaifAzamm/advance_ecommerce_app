import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites Screen',
          style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
