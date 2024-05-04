import 'package:sistema_odontologico/model/tratamiento.dart';

import 'paciente.dart';

class Consulta {
  int id;
  int? idTratamiento;
  int? idPaciente;
  DateTime fecha;
  String actividadRealizada;
  double abono;
  String indicaciones;

  Consulta({
    required this.id,
    required this.idTratamiento,
    required this.idPaciente,
    required this.fecha,
    required this.actividadRealizada,
    required this.abono,
    required this.indicaciones,
  });

  Consulta.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          idTratamiento: json['attributes']['tratamiento'],
          idPaciente: json['attributes']['paciente'],
          fecha: DateTime.parse(json['attributes']['fecha']),
          actividadRealizada: json['attributes']['actividad_realizada'],
          abono: json['attributes']['abono'] is double
              ? json['attributes']['abono']
              : json['attributes']['abono'].toDouble(),
          indicaciones: json['attributes']['indicaciones'],
        );

  Consulta.empty()
      : this(
            id: 0,
            idTratamiento: null,
            idPaciente: null,
            fecha: DateTime.now(),
            actividadRealizada: '',
            abono: 0,
            indicaciones: '');

  Consulta copy({
    int? id,
    int? idTratamiento,
    int? idPaciente,
    DateTime? fecha,
    String? actividadRealizada,
    double? abono,
    String? indicaciones,
  }) =>
      Consulta(
        id: id ?? this.id,
        idTratamiento: idTratamiento ?? this.idTratamiento,
        idPaciente: idPaciente ?? this.idPaciente,
        fecha: fecha ?? this.fecha,
        actividadRealizada: actividadRealizada ?? this.actividadRealizada,
        abono: abono ?? this.abono,
        indicaciones: indicaciones ?? this.indicaciones,
      );

  Map<String, dynamic> toJson() => {
        'tratamiento': idTratamiento,
        'paciente': idPaciente,
        'fecha': fecha.toIso8601String(),
        'actividad_realizada': actividadRealizada,
        'abono': abono,
        'indicaciones': indicaciones,
      };
}

class ConsultaAndTratamiento {
  Consulta consulta;
  Tratamiento? tratamiento;

  ConsultaAndTratamiento({
    required this.consulta,
    required this.tratamiento,
  });
}
