import 'package:flutter/material.dart';
import 'package:gabo/providers/user_location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final UserLocation userLocation =
        Provider.of<UserLocation>(context, listen: false);

    handleLocationPermission(context).then((hasPermission) {
      if (hasPermission) {
        getAndSetUserLocation(context, userLocation);
      }
    });
    return const Center(child: Text('Herramientas'));
  }
}

Future<bool> handleLocationPermission(context) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Los servicios de localización están desactivados. Por favor, active los servicios de localización.')));
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Los permisos de localización están denegados')));
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Los permisos de localización están denegados permanentemente. Por favor, active los permisos de localización en la configuración del dispositivo.')));
    return false;
  }
  return true;
}

Future<void> getAndSetUserLocation(context, UserLocation userLocation) async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  userLocation.updateLocation(position.latitude, position.longitude);
}
