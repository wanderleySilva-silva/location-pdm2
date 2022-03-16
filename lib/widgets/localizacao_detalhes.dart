import 'package:flutter/cupertino.dart';
import 'package:gps_trakcer/models/localizacao_usuario.dart';

class LocalizacaoDetalhes extends StatelessWidget {
  LocalizacaoUsuario localizacao;
  LocalizacaoDetalhes({Key? key, required this.localizacao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24, left: 24),
            child: Text(
              localizacao.nome,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 60, left: 24),
            child: Text(
              localizacao.endereco,
            ),
          ),
        ],
      ),
    );
  }
}
