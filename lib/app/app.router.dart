// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i14;
import 'package:flutter/material.dart';
import 'package:sistema_odontologico/model/consulta.dart' as _i18;
import 'package:sistema_odontologico/model/paciente.dart' as _i15;
import 'package:sistema_odontologico/model/tratamiento.dart' as _i16;
import 'package:sistema_odontologico/ui/views/consultas/consultas_view.dart'
    as _i9;
import 'package:sistema_odontologico/ui/views/crear_paciente/crear_paciente_view.dart'
    as _i5;
import 'package:sistema_odontologico/ui/views/dato_paciente/dato_paciente_view.dart'
    as _i11;
import 'package:sistema_odontologico/ui/views/datos_tratamiento/datos_tratamiento_view.dart'
    as _i12;
import 'package:sistema_odontologico/ui/views/editar_consulta/editar_consulta_view.dart'
    as _i10;
import 'package:sistema_odontologico/ui/views/editar_tratamiento/editar_tratamiento_view.dart'
    as _i7;
import 'package:sistema_odontologico/ui/views/home/home_view.dart' as _i2;
import 'package:sistema_odontologico/ui/views/login/login_view.dart' as _i13;
import 'package:sistema_odontologico/ui/views/pacientes/pacientes_view.dart'
    as _i4;
import 'package:sistema_odontologico/ui/views/seleccionar_paciente/seleccionar_paciente_view.dart'
    as _i8;
import 'package:sistema_odontologico/ui/views/seleccionar_paciente/seleccionar_paciente_viewmodel.dart'
    as _i17;
import 'package:sistema_odontologico/ui/views/startup/startup_view.dart' as _i3;
import 'package:sistema_odontologico/ui/views/tratamientos/tratamientos_view.dart'
    as _i6;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i19;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const pacientesView = '/pacientes-view';

  static const crearPacienteView = '/crear-paciente-view';

  static const tratamientosView = '/tratamientos-view';

  static const editarTratamientoView = '/editar-tratamiento-view';

  static const seleccionarPacienteView = '/seleccionar-paciente-view';

  static const consultasView = '/consultas-view';

  static const editarConsultaView = '/editar-consulta-view';

  static const datoPacienteView = '/dato-paciente-view';

  static const datosTratamientoView = '/datos-tratamiento-view';

  static const loginView = '/login-view';

  static const all = <String>{
    homeView,
    startupView,
    pacientesView,
    crearPacienteView,
    tratamientosView,
    editarTratamientoView,
    seleccionarPacienteView,
    consultasView,
    editarConsultaView,
    datoPacienteView,
    loginView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.pacientesView,
      page: _i4.PacientesView,
    ),
    _i1.RouteDef(
      Routes.crearPacienteView,
      page: _i5.CrearPacienteView,
    ),
    _i1.RouteDef(
      Routes.tratamientosView,
      page: _i6.TratamientosView,
    ),
    _i1.RouteDef(
      Routes.editarTratamientoView,
      page: _i7.EditarTratamientoView,
    ),
    _i1.RouteDef(
      Routes.seleccionarPacienteView,
      page: _i8.SeleccionarPacienteView,
    ),
    _i1.RouteDef(
      Routes.consultasView,
      page: _i9.ConsultasView,
    ),
    _i1.RouteDef(
      Routes.editarConsultaView,
      page: _i10.EditarConsultaView,
    ),
    _i1.RouteDef(
      Routes.datoPacienteView,
      page: _i11.DatoPacienteView,
    ),
    _i1.RouteDef(
      Routes.datosTratamientoView,
      page: _i12.DatosTratamientoView,
    ),
    _i1.RouteDef(
      Routes.datosTratamientoView,
      page: _i12.DatosTratamientoView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i13.LoginView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.PacientesView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.PacientesView(),
        settings: data,
      );
    },
    _i5.CrearPacienteView: (data) {
      final args = data.getArgs<CrearPacienteViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i5.CrearPacienteView(args.paciente, args.isEditing, key: args.key),
        settings: data,
      );
    },
    _i6.TratamientosView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.TratamientosView(),
        settings: data,
      );
    },
    _i7.EditarTratamientoView: (data) {
      final args = data.getArgs<EditarTratamientoViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.EditarTratamientoView(
            args.tratamiento, args.isEditing,
            key: args.key),
        settings: data,
      );
    },
    _i8.SeleccionarPacienteView: (data) {
      final args =
          data.getArgs<SeleccionarPacienteViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.SeleccionarPacienteView(args.entidad, key: args.key),
        settings: data,
      );
    },
    _i9.ConsultasView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ConsultasView(),
        settings: data,
      );
    },
    _i10.EditarConsultaView: (data) {
      final args = data.getArgs<EditarConsultaViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.EditarConsultaView(
            args.consulta, args.isEditing,
            key: args.key),
        settings: data,
      );
    },
    _i11.DatoPacienteView: (data) {
      final args = data.getArgs<DatoPacienteViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.DatoPacienteView(args.paciente, key: args.key),
        settings: data,
      );
    },
    _i12.DatosTratamientoView: (data) {
      final args = data.getArgs<DatosTratamientoViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i12.DatosTratamientoView(args.tratamiento, key: args.key),
        settings: data,
      );
    },
    _i13.LoginView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.LoginView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CrearPacienteViewArguments {
  const CrearPacienteViewArguments({
    required this.paciente,
    required this.isEditing,
    this.key,
  });

  final _i15.Paciente? paciente;

  final bool isEditing;

  final _i14.Key? key;

  @override
  String toString() {
    return '{"paciente": "$paciente", "isEditing": "$isEditing", "key": "$key"}';
  }

  @override
  bool operator ==(covariant CrearPacienteViewArguments other) {
    if (identical(this, other)) return true;
    return other.paciente == paciente &&
        other.isEditing == isEditing &&
        other.key == key;
  }

  @override
  int get hashCode {
    return paciente.hashCode ^ isEditing.hashCode ^ key.hashCode;
  }
}

class EditarTratamientoViewArguments {
  const EditarTratamientoViewArguments({
    required this.tratamiento,
    required this.isEditing,
    this.key,
  });

  final _i16.Tratamiento? tratamiento;

  final bool isEditing;

  final _i14.Key? key;

  @override
  String toString() {
    return '{"tratamiento": "$tratamiento", "isEditing": "$isEditing", "key": "$key"}';
  }

  @override
  bool operator ==(covariant EditarTratamientoViewArguments other) {
    if (identical(this, other)) return true;
    return other.tratamiento == tratamiento &&
        other.isEditing == isEditing &&
        other.key == key;
  }

  @override
  int get hashCode {
    return tratamiento.hashCode ^ isEditing.hashCode ^ key.hashCode;
  }
}

class SeleccionarPacienteViewArguments {
  const SeleccionarPacienteViewArguments({
    required this.entidad,
    this.key,
  });

  final _i17.EntidadSeleccionada entidad;

  final _i14.Key? key;

  @override
  String toString() {
    return '{"entidad": "$entidad", "key": "$key"}';
  }

  @override
  bool operator ==(covariant SeleccionarPacienteViewArguments other) {
    if (identical(this, other)) return true;
    return other.entidad == entidad && other.key == key;
  }

  @override
  int get hashCode {
    return entidad.hashCode ^ key.hashCode;
  }
}

class EditarConsultaViewArguments {
  const EditarConsultaViewArguments({
    required this.consulta,
    required this.isEditing,
    this.key,
  });

  final _i18.Consulta? consulta;

  final bool isEditing;

  final _i14.Key? key;

  @override
  String toString() {
    return '{"consulta": "$consulta", "isEditing": "$isEditing", "key": "$key"}';
  }

  @override
  bool operator ==(covariant EditarConsultaViewArguments other) {
    if (identical(this, other)) return true;
    return other.consulta == consulta &&
        other.isEditing == isEditing &&
        other.key == key;
  }

  @override
  int get hashCode {
    return consulta.hashCode ^ isEditing.hashCode ^ key.hashCode;
  }
}

class DatoPacienteViewArguments {
  const DatoPacienteViewArguments({
    required this.paciente,
    this.key,
  });

  final _i15.Paciente paciente;

  final _i14.Key? key;

  @override
  String toString() {
    return '{"paciente": "$paciente", "key": "$key"}';
  }

  @override
  bool operator ==(covariant DatoPacienteViewArguments other) {
    if (identical(this, other)) return true;
    return other.paciente == paciente && other.key == key;
  }

  @override
  int get hashCode {
    return paciente.hashCode ^ key.hashCode;
  }
}

class DatosTratamientoViewArguments {
  const DatosTratamientoViewArguments({
    required this.tratamiento,
    this.key,
  });

  final _i16.TratamientoAndPaciente tratamiento;

  final _i14.Key? key;

  @override
  String toString() {
    return '{"tratamiento": "$tratamiento", "key": "$key"}';
  }

  @override
  bool operator ==(covariant DatosTratamientoViewArguments other) {
    if (identical(this, other)) return true;
    return other.tratamiento == tratamiento && other.key == key;
  }

  @override
  int get hashCode {
    return tratamiento.hashCode ^ key.hashCode;
  }
}


extension NavigatorStateExtension on _i19.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPacientesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.pacientesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCrearPacienteView({
    required _i15.Paciente? paciente,
    required bool isEditing,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.crearPacienteView,
        arguments: CrearPacienteViewArguments(
            paciente: paciente, isEditing: isEditing, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTratamientosView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.tratamientosView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditarTratamientoView({
    required _i16.Tratamiento? tratamiento,
    required bool isEditing,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editarTratamientoView,
        arguments: EditarTratamientoViewArguments(
            tratamiento: tratamiento, isEditing: isEditing, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSeleccionarPacienteView({
    required _i17.EntidadSeleccionada entidad,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.seleccionarPacienteView,
        arguments: SeleccionarPacienteViewArguments(entidad: entidad, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConsultasView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.consultasView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditarConsultaView({
    required _i18.Consulta? consulta,
    required bool isEditing,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editarConsultaView,
        arguments: EditarConsultaViewArguments(
            consulta: consulta, isEditing: isEditing, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDatoPacienteView({
    required _i15.Paciente paciente,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.datoPacienteView,
        arguments: DatoPacienteViewArguments(paciente: paciente, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDatosTratamientoView({
    required _i16.TratamientoAndPaciente tratamiento,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.datosTratamientoView,
        arguments:
            DatosTratamientoViewArguments(tratamiento: tratamiento, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPacientesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.pacientesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCrearPacienteView({
    required _i15.Paciente? paciente,
    required bool isEditing,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.crearPacienteView,
        arguments: CrearPacienteViewArguments(
            paciente: paciente, isEditing: isEditing, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTratamientosView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.tratamientosView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditarTratamientoView({
    required _i16.Tratamiento? tratamiento,
    required bool isEditing,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editarTratamientoView,
        arguments: EditarTratamientoViewArguments(
            tratamiento: tratamiento, isEditing: isEditing, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSeleccionarPacienteView({
    required _i17.EntidadSeleccionada entidad,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.seleccionarPacienteView,
        arguments: SeleccionarPacienteViewArguments(entidad: entidad, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConsultasView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.consultasView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditarConsultaView({
    required _i18.Consulta? consulta,
    required bool isEditing,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editarConsultaView,
        arguments: EditarConsultaViewArguments(
            consulta: consulta, isEditing: isEditing, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDatoPacienteView({
    required _i15.Paciente paciente,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.datoPacienteView,
        arguments: DatoPacienteViewArguments(paciente: paciente, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDatosTratamientoView({
    required _i16.TratamientoAndPaciente tratamiento,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.datosTratamientoView,
        arguments:
            DatosTratamientoViewArguments(tratamiento: tratamiento, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
