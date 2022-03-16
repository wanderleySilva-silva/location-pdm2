import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:gps_trakcer/pages/localizacoes_page.dart';
import 'package:gps_trakcer/repositories/localizacao_repository.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(
    ChangeNotifierProvider<LocalizacaoRepository>(
      create: (_) => LocalizacaoRepository(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizações Locais',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: LocalizacoesPage(),
    );
  }
}
