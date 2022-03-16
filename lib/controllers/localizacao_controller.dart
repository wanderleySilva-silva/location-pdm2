import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps_trakcer/pages/localizacoes_page.dart';
import 'package:gps_trakcer/repositories/localizacao_repository.dart';
import 'package:gps_trakcer/widgets/localizacao_detalhes.dart';

class LocalizacoesController extends ChangeNotifier {
  double latitude = 0.0;
  double longitude = 0.0;
  String erro = '';

  Set<Marker> markers = Set<Marker>();
  late GoogleMapController _mapsController;

  // LocalizacaoController() {
  //   getPosicao();
  // }

  get mapsController => _mapsController;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosicao();
    loadLocalizacoes();
  }

  loadLocalizacoes() {
    final localizacoes = LocalizacaoRepository().localizacoes;
    localizacoes.forEach((localizacao) async {
      markers.add(
        Marker(
          markerId: MarkerId(localizacao.nome),
          position: LatLng(localizacao.latitude, localizacao.longitude),
          onTap: () => {
            showModalBottomSheet(
              context: appKey.currentState!.context,
              builder: (context) => LocalizacaoDetalhes(localizacao: localizacao),
            )
          },
        ),
      );
    });
    notifyListeners();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      latitude = posicao.latitude;
      longitude = posicao.longitude;
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();

    if (!ativado) {
      return Future.error('Abilite a localização');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();

      if (permissao == LocationPermission.denied) {
        return Future.error('Autorize o acesso à localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Autorize o acesso a localização');
    }

    return await Geolocator.getCurrentPosition();
  }
}
