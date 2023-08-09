import 'package:sistema_odontologico/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/consulta.dart';
import '../../../model/tratamiento.dart';
import '../../../services/consulta_service.dart';
import '../../../services/tratamiento_service.dart';

class DatosTratamientoViewModel extends BaseViewModel implements Initialisable {
  final _consultaService = locator<ConsultaService>();
  final _navigationService = locator<NavigationService>();
  final _tratamientoService = locator<TratamientoService>();

  TratamientoAndPaciente tratamiento;
  List<Consulta> consultas = [];
  double saldo = 0;

  DatosTratamientoViewModel(this.tratamiento);

  @override
  Future<void> initialise() async {
    consultas = await _consultaService
        .getConsultasDeTratamiento(tratamiento.tratamiento.id);
    saldo = await _tratamientoService
        .calcularSaldoDeTratamiento(tratamiento.tratamiento);
    rebuildUi();
  }

  void navigateToCrearConsulta() {
    _navigationService
        .navigateToEditarConsultaView(
            consulta: Consulta.empty()
                .copy(idTratamiento: tratamiento.tratamiento.id),
            isEditing: false)
        .then((value) {
      if (value != null) {
        initialise();
      }
    });
  }

  void navigateToEditarConsulta(Consulta consulta) {
    _navigationService
        .navigateToEditarConsultaView(consulta: consulta, isEditing: true)
        .then((value) {
      if (value != null) {
        initialise();
      }
    });
  }

  void sortByFecha(bool ascending) {
    consultas.sort((a, b) =>
        ascending ? a.fecha.compareTo(b.fecha) : b.fecha.compareTo(a.fecha));
    rebuildUi();
  }

  void eliminarConsulta(Consulta consulta) async {
    await _consultaService.deleteConsulta(consulta.id);
    initialise();
  }
}
