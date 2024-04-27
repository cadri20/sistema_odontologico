import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

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

  void startBackend(Function onSuccess,Function(String) onError, Function(String) onMessage) async{
    try {
      final String startCommand = _configMap['backend_start_command']!;
      print(startCommand);
      //remove last part in command

      backendProcess = await Process.start(
          startCommand, [],
          runInShell: true,
          workingDirectory: _configMap['backend_working_directory'],
        mode: ProcessStartMode.normal
      );
      print("start backend");

      backendProcess.stdout.transform(utf8.decoder).listen((data) {
        onMessage(data);
        if (data.contains(_configMap['backend_success_message']!)) {
          onSuccess();
        }
        if (data.contains("Error")) {
          if(data.contains("port")){
            onError("El puerto esta ocupado");
          }
        }
      });
    } on Exception catch (e) {
      onError(e.toString());
    }

    /*
    backendProcess.exitCode.then((value) {
      onError("Backend terminado con exit code $value");
    });*/
  }

  Future<bool> checkBackend() async{
    try {
      var response = await http.get(Uri.parse(_configMap['url_backend']! + "/api/pacientes"));
      return response.statusCode == 200;
    } on Exception catch (e) {
      return false;
    }
  }

  Future<void> stopBackend() async{
    await backendProcess.kill(ProcessSignal.sigint);
    print("backend killed");
  }
}
