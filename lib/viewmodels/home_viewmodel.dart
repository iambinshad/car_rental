import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier{
    RangeValues currentRangeValues = const RangeValues(30, 50);
  String selectedCarType = 'Economy';

  final List<String> carTypes = [
    'Economy',
    'Luxury',
    'Sedan',
    'Compact',
    'Hatchback',
    'Suv',
  ];

  changeSliderValue(value){
    currentRangeValues = value;
    notifyListeners();
  }
 changeCarType(value){
    selectedCarType = value;
    notifyListeners();
  }
}