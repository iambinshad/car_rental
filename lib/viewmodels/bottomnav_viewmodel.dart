import 'package:flutter/material.dart';
import 'package:rental_app_demo/views/main_screens/bookings/bookings_screen.dart';
import 'package:rental_app_demo/views/main_screens/favourites/favorites.dart';
import 'package:rental_app_demo/views/main_screens/home/home_screen.dart';
import 'package:rental_app_demo/views/main_screens/profile/profile.dart';

class BottomnavViewmodel extends ChangeNotifier {
  int currentScreenIndex = 0;
    List<Widget> screens = [
    const HomeScreenTwo(),
    const BookingsScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];


  changeScreenIndex(index) {
    currentScreenIndex = index;
    notifyListeners();
  }
}
