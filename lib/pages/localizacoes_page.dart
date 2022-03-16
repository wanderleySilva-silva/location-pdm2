import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps_trakcer/controllers/localizacao_controller.dart';
import 'package:provider/provider.dart';

final appKey = GlobalKey();

class LocalizacoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appKey,
      appBar: AppBar(
        title: Text('Localizações'),
      ),
      body: ChangeNotifierProvider<LocalizacoesController>(
        create: (context) => LocalizacoesController(),
        child: Builder(builder: (context) {
          final local = context.watch<LocalizacoesController>();

          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(local.latitude, local.longitude),
              zoom: 18,
            ),
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            myLocationEnabled: true,
            onMapCreated: local.onMapCreated,
            markers: local.markers,
          );
        }),
      ),
    );
  }
}
