import 'package:flutter/material.dart';
import 'package:rental_app_demo/views/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppText("Profile Screen"),
      ),
    );
  }
}
