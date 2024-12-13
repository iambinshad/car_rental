import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_app_demo/utils/themes/app_theme.dart';
import 'package:rental_app_demo/viewmodels/bottomnav_viewmodel.dart';
import 'package:rental_app_demo/viewmodels/home_viewmodel.dart';
import 'package:rental_app_demo/views/common/bottom_nav.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomnavViewmodel(),),
        ChangeNotifierProvider(create: (context) => HomeViewmodel(),)
      ],
      child: MaterialApp(
          title: 'MVVM Demo',
        theme: AppTheme.lightTheme, // Apply the light theme
        darkTheme: AppTheme.darkTheme, // Optional: Apply the dark theme
        themeMode: ThemeMode.light, // Switches based on system preference
        debugShowCheckedModeBanner: false,
        home: const BottomNav(),
      ),
    );
  }
}

