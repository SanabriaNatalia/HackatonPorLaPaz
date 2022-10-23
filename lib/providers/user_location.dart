import 'package:flutter/material.dart';

class UserLocation with ChangeNotifier {
  double? latitude;
  double? longitude;

  void updateLocation(double latitude, double longitude) {
    this.latitude = latitude;
    this.longitude = longitude;
    notifyListeners();
  }
}
