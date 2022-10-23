import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:gabo/providers/user_location.dart';
import 'package:gabo/screens/home_screen.dart';
import 'package:provider/provider.dart';

class WarningScreen extends StatelessWidget {
  const WarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserLocation userLocation =
        Provider.of<UserLocation>(context, listen: false);
    handleLocationPermission(context).then((hasPermission) {
      if (hasPermission) {
        getAndSetUserLocation(context, userLocation);
      }
    });
    return Container(
      padding: const EdgeInsets.all(70),
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 255, 74, 61),
        child: IconButton(
            iconSize: 170,
            icon: const Icon(
              Icons.warning_amber_rounded,
              color: Colors.white,
            ),
            onPressed: () => _showDialog(
                context, userLocation.latitude, userLocation.longitude)),
      ),
    );
  }
}

void sendSMSDialog(latitud, longitud) async {
  String username = 'Laura Poveda';
  String status = 'cubriendo el paro nacional en Cúcuta';
  String currentHourMinutes = DateTime.now().toString().substring(11, 16);

  List<String> recipients = ['+573114847430', "+573213332722"];

  String message =
      'Soy $username, estoy $status a las $currentHourMinutes en [$latitud, $longitud] #Diametro';
  await sendSMS(message: message, recipients: recipients, sendDirect: true);
}

void _showDialog(context, latitude, longitude) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirmacion de envio"),
        content: const Text("¿Desea enviar un mensaje de alerta?"),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("Enviar"),
            onPressed: () {
              sendSMSDialog(latitude, longitude);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
