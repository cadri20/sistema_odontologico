import 'package:sistema_odontologico/app/app.router.dart';
import 'package:sistema_odontologico/services/consulta_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/consulta.dart';

class ConsultasViewModel extends BaseViewModel implements Initialisable {
  final ConsultaService _consultaService = locator<ConsultaService>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<ConsultaAndTratamiento> consultas = [];

  @override
  Future<void> initialise() async {
    consultas = await _consultaService.getConsultasAndPacientesAndTratamiento();
    rebuildUi();
  }

  void navigateToCrearConsulta() {
    _navigationService
        .navigateToEditarConsultaView(consulta: null, isEditing: false)
        .then((value) {
      if (value != null) {
        initialise();
      }
    });
  }
}
