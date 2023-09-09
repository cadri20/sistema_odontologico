import 'dart:convert';

import 'package:sistema_odontologico/model/tratamiento.dart';
import 'package:sistema_odontologico/model/tratamiento_dao.dart';
import 'package:http/http.dart' as http;

import '../app/app.locator.dart';
import '../services/config_service.dart';
import 'paciente.dart';
import 'paciente_dao_rest.dart';

class TratamientoDaoRest implements TratamientoDao {
  static String baseUrl = "";

  String _token;
  TratamientoDaoRest(this._token){
    baseUrl = "${locator<ConfigService>().configMap['url_backend']!}/api/tratamientos";
  }

  @override
  Future<double> calcularSaldoDeTratamiento(Tratamiento tratamiento) async {
    final response =
        await http.get(Uri.parse("$baseUrl/${tratamiento.id}/saldo"));
    final jsonDecoded = json.decode(response.body);

    return jsonDecoded['data']['attributes']['saldo'] is double
        ? jsonDecoded['data']['attributes']['saldo']
        : jsonDecoded['data']['attributes']['saldo'].toDouble();
  }

  @override
  Future<void> deleteTratamiento(int id) async {
    await http.delete(Uri.parse("$baseUrl/$id"),
        headers: {'Authorization': 'Bearer $_token'});
  }

  @override
  Future<Tratamiento> getTratamiento(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));
    final jsonDecoded = json.decode(response.body)['data'];

    return Tratamiento.fromJson(jsonDecoded);
  }

  @override
  Future<List<Tratamiento>> getTratamientos() async {
    final response = await http.get(Uri.parse(baseUrl));
    final jsonDecoded = json.decode(response.body)['data'];

    final tratamientos = <Tratamiento>[];
    jsonDecoded.forEach((tratamiento) {
      final tratamientoParsed = Tratamiento.fromJson(tratamiento);
      tratamientos.add(tratamientoParsed);
    });

    return tratamientos;
  }

  @override
  Future<List<Tratamiento>> getTratamientosDePersona(int idPersona) async {
    final response = await http
        .get(Uri.parse("${PacienteDaoRest.baseUrl}/$idPersona/tratamientos"));
    final jsonDecoded = json.decode(response.body)['data'];

    final tratamientos = <Tratamiento>[];
    jsonDecoded.forEach((tratamiento) {
      final tratamientoParsed = Tratamiento.fromJson(tratamiento);
      tratamientos.add(tratamientoParsed);
    });

    return tratamientos;
  }

  @override
  Future<void> insertTratamiento(Tratamiento tratamiento) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token'
        },
        body: json.encode({'data': tratamiento.toJson()}));
    print("respuesta ${response.body}");
  }

  @override
  Future<void> updateTratamiento(Tratamiento tratamiento) async {
    final jsonEnviar = json.encode({'data': tratamiento.toJson()});
    final response = await http.put(Uri.parse("$baseUrl/${tratamiento.id}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token'
        },
        body: jsonEnviar);
    print("tratamiento:$jsonEnviar \nrespuesta ${response.body}");
  }

  @override
  Future<List<TratamientoAndPaciente>> getTratamientosAndPacientes() async {
    final response = await http.get(Uri.parse("$baseUrl?populate=paciente"));
    final jsonDecoded = json.decode(response.body)['data'];

    final tratamientosAndPacientes = <TratamientoAndPaciente>[];
    jsonDecoded.forEach((tratamiento) {
      final tratamientoParsed = Tratamiento.fromJson(tratamiento);
      final pacienteParsed = Paciente.fromJson(tratamiento['paciente']);
      tratamientosAndPacientes.add(TratamientoAndPaciente(
          tratamiento: tratamientoParsed, paciente: pacienteParsed));
    });

    return tratamientosAndPacientes;
  }
}
