import 'dart:convert';

import 'package:sistema_odontologico/model/consulta.dart';
import 'package:sistema_odontologico/model/tratamiento_dao_rest.dart';
import 'package:sistema_odontologico/services/config_service.dart';

import '../app/app.locator.dart';
import 'consulta_dao.dart';
import 'package:http/http.dart' as http;

class ConsultaDaoRest implements ConsultaDao {
  late String baseUrl;
  String _token;

  ConsultaDaoRest(this._token){
    final apiUrl = locator<ConfigService>().configMap['url_backend']!;
    baseUrl = "$apiUrl/api/consultas";
  }

  @override
  Future<void> deleteConsulta(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"),
        headers: {'Authorization': 'Bearer $_token'});
    //print("response: ${response.body}");
  }

  @override
  Future<Consulta> getConsulta(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));
    final jsonDecoded = json.decode(response.body)['data'];

    return Consulta.fromJson(jsonDecoded);
  }

  @override
  Future<List<Consulta>> getConsultas() async {
    final response = await http.get(Uri.parse(baseUrl));
    final jsonDecoded = json.decode(response.body)['data'];

    final consultas = <Consulta>[];
    jsonDecoded.forEach((consulta) {
      final consultaParsed = Consulta.fromJson(consulta);
      consultas.add(consultaParsed);
    });

    return consultas;
  }

  @override
  Future<List<Consulta>> getConsultasDeTratamiento(int idTratamiento) async {
    final response = await http.get(
        Uri.parse("${TratamientoDaoRest.baseUrl}/$idTratamiento/consultas"));
    final jsonDecoded = json.decode(response.body)['data'];

    final consultas = <Consulta>[];
    jsonDecoded.forEach((consulta) {
      final consultaParsed = Consulta.fromJson(consulta);
      consultas.add(consultaParsed);
    });

    return consultas;
  }

  @override
  Future<void> insertConsulta(Consulta consulta) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token'
        },
        body: json.encode({'data': consulta.toJson()}));
    print("response: ${response.body}");
  }

  @override
  Future<void> updateConsulta(Consulta consulta) async {
    final response = await http.put(Uri.parse("$baseUrl/${consulta.id}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token'
        },
        body: json.encode({'data': consulta.toJson()}));
  }
}
