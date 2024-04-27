import 'dart:convert';

import 'package:sistema_odontologico/model/paciente.dart';
import 'package:sistema_odontologico/services/config_service.dart';

import '../app/app.locator.dart';
import 'paciente_dao.dart';
import 'package:http/http.dart' as http;

class PacienteDaoRest implements PacienteDao {
  static String baseUrl = "";

  String _token;
  PacienteDaoRest(this._token){
    baseUrl = "${locator<ConfigService>().configMap['url_backend']!}/api/pacientes";
    print("baseUrl $baseUrl");
  }

  @override
  Future<void> deletePaciente(int id) async {
    await http.delete(Uri.parse("$baseUrl/$id"),
        headers: {'Authorization': 'Bearer $_token'});
  }

  @override
  Future<Paciente> getPaciente(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));
    final jsonDecoded = json.decode(response.body)['data'];
    return Paciente.fromJson(jsonDecoded);
  }

  @override
  Future<List<Paciente>> getPacientes() async {
    final response = await http
        .get(Uri.parse("$baseUrl?pagination[pageSize]=1000"), headers: {'Authorization': 'Bearer $_token'});
    //print("response: ${response.body}");
    final jsonDecoded = json.decode(response.body)['data'];

    final pacientes = <Paciente>[];
    jsonDecoded.forEach((paciente) {
      final pacienteParsed = Paciente.fromJson(paciente);
      pacientes.add(pacienteParsed);
    });
    return pacientes;
  }

  @override
  Future<void> insertPaciente(Paciente paciente) async {
    final jsonEnviar = json.encode({'data': paciente.toJson()});
    final response = await http.post(Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token'
        },
        body: jsonEnviar);
    //print("Paciente insertado ${jsonEnviar}");
    //print("respuesta ${response.body}");
  }

  @override
  Future<List<Paciente>> searchPacientes(String nombre) async {
    final response = await http
        .get(Uri.parse("$baseUrl?filters[nombre][\$contains]=$nombre"));
    final jsonDecoded = json.decode(response.body)['data'];

    return _parsePacientes(jsonDecoded);
  }

  List<Paciente> _parsePacientes(List<dynamic> jsonDecoded) {
    final pacientes = <Paciente>[];
    jsonDecoded.forEach((paciente) {
      final pacienteParsed = Paciente.fromJson(paciente);
      pacientes.add(pacienteParsed);
    });
    return pacientes;
  }

  @override
  Future<void> updatePaciente(Paciente paciente) async {
    await http.put(Uri.parse("$baseUrl/${paciente.id}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token'
        },
        body: json.encode({'data': paciente.toJson()}));
  }

  @override
  Future<List<Paciente>> getPacientesOrderedByName(bool ascending) async {
    final response = await http
        .get(
        Uri.parse("$baseUrl?orderBy=nombre:${ascending ? 'asc' : 'desc'}"));

    final jsonDecoded = json.decode(response.body)['data'];

    return _parsePacientes(jsonDecoded);
  }



}
