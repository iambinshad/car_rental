import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_app_demo/utils/themes/app_colors.dart';
import 'package:rental_app_demo/viewmodels/bottomnav_viewmodel.dart';
import 'package:rental_app_demo/views/main_screens/home/widgets_elements.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomViewModel = Provider.of<BottomnavViewmodel>(context);

    return Scaffold(
      body: Consumer<BottomnavViewmodel>(
          builder: (context, value, child) =>
              value.screens[value.currentScreenIndex]),
      bottomNavigationBar: OrientationBuilder(
        builder: (context, orientation) => 
         Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          width: double.infinity,
          height: (orientation == Orientation.portrait)? MediaQuery.of(context).size.height / 13:MediaQuery.of(context).size.width / 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavItemWidget(
                isSelected: bottomViewModel.currentScreenIndex == 0,
                label: "Home",
                icon: Icons.home_outlined,
                ontap: () {
                  log(orientation.name);
                  bottomViewModel.changeScreenIndex(0);
                },
                orientation: orientation,
              ),
              NavItemWidget(
                isSelected: bottomViewModel.currentScreenIndex == 1,
                label: "Bookings",
                icon: Icons.book_outlined,
                ontap: () {
                  bottomViewModel.changeScreenIndex(1);
                },
                                orientation: orientation,

              ),
              NavItemWidget(
                isSelected: bottomViewModel.currentScreenIndex == 2,
                label: "Favorites",
                icon: Icons.favorite_outline,
                ontap: () {
                  bottomViewModel.changeScreenIndex(2);
                },
                                orientation: orientation,

              ),
              NavItemWidget(
                isSelected: bottomViewModel.currentScreenIndex == 3,
                label: "Profile",
                icon: Icons.person_outline,
                ontap: () {
                  bottomViewModel.changeScreenIndex(3);
                },
                                orientation: orientation,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
