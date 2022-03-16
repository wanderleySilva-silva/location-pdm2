import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? latitude;
  double? longitude;
  String? endereco;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          latitude != null
              ? Text(
                  'Latitude: $latitude',
                  textAlign: TextAlign.center,
                )
              : Text(
                  'Latitude: ',
                  textAlign: TextAlign.center,
                ),
          longitude != null
              ? Text('Longitude: $longitude', textAlign: TextAlign.center)
              : Text('Longitude: ', textAlign: TextAlign.center),
          endereco != null
              ? Text('Endereço: $endereco', textAlign: TextAlign.center)
              : Text('Endereço: ', textAlign: TextAlign.center),
          TextButton(
            child: Text('Pegar posição'),
            onPressed: () {
              pegarPosicao();
            },
          ),
        ],
      ),
    );
  }

  pegarPosicao() async {
    Position posicao = await Geolocator.getCurrentPosition();

    setState(() {
      latitude = posicao.latitude;
      longitude = posicao.longitude;
    });

    List<Placemark> locais =
        await placemarkFromCoordinates(posicao.latitude, posicao.longitude);
    if (locais != null) {
      setState(() {
        endereco = locais[0].toString();
      });
    }
  }
  
}
