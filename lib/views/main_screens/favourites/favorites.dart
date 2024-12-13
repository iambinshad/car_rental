import 'package:flutter/material.dart';
import 'package:rental_app_demo/views/widgets/widgets.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppText("Favorites Screen"),
      ),
    );
  }
}
