import 'package:flutter/cupertino.dart';
import 'package:gps_trakcer/models/localizacao_usuario.dart';

class LocalizacaoRepository extends ChangeNotifier {
  final List<LocalizacaoUsuario> _localizacoes = [
    LocalizacaoUsuario(
      nome: 'IFPE Campus Garanhuns',
      endereco:
          'R. Padre Agobar Valença, s/n - Severiano Moraes Filho, Garanhuns - PE',
      latitude: -8.876868,
      longitude: -36.461736,
    ),
    LocalizacaoUsuario(
      nome: 'Assaí Atacadista',
      endereco:
          'R. Padre Agobar Valença, s/n - Severiano Moraes Filho, Garanhuns - PE',
      latitude: -8.875524,
      longitude: -36.462205,
    ),
    LocalizacaoUsuario(
      nome: 'Casa',
      endereco: 'Avenida Bela Vista, sn - Bela Vista, Iati - PE',
      latitude: -9.012472,
      longitude: -36.865425,
    ),
  ];

  List<LocalizacaoUsuario> get localizacoes => _localizacoes;
}
