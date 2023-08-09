import 'dart:convert';
import 'dart:io';

import 'package:flutter_window_close/flutter_window_close.dart';

class ConfigService {
  Map<String, String> _configMap = {};

  Map<String, String> get configMap => _configMap;

  late Process backendProcess;
  File _crearArchivoDeConfiguracionSiNoExiste() {
    final archivo = File("config.json");
    if (!archivo.existsSync()) {
      archivo.writeAsStringSync(json.encode({
        "url_backend": "http://localhost:1337",
        "backend_start_command":
            "npm --prefix ..\\sistema-odontologico-backend run start"
      }));
      print("archivo creado");
    }

    return archivo;
  }

  void loadConfig(){
    final configArchivo = _crearArchivoDeConfiguracionSiNoExiste();
    final config = json.decode(configArchivo.readAsStringSync());
    _configMap = config.cast<String, String>();
  }

  void startBackend(Function onSuccess,Function(String) onError) async{
    final String startCommand = _configMap['backend_start_command']!;
    print(startCommand);
    backendProcess = await Process.start(
        startCommand, [],
        runInShell: true);
    print("start backend");

    backendProcess.stdout.transform(utf8.decoder).listen((data) {
      print(data);
      if (data.contains("Welcome back")) {
        onSuccess();
      }
      if (data.contains("error")) {
        if(data.contains("port")){

        }
      }
    });

    backendProcess.exitCode.then((value) {
      onError("Backend terminado con exit code $value");
    });
  }

  Future<void> stopBackend() async{
    await backendProcess.kill(ProcessSignal.sigint);
    print("backend killed");
  }
}
