import 'package:sistema_odontologico/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../model/tratamiento.dart';
import '../../../services/tratamiento_service.dart';

class TratamientosViewModel extends BaseViewModel implements Initialisable {
  final _tratamientoService = locator<TratamientoService>();
  final _navigationService = locator<NavigationService>();

  List<TratamientoAndPaciente> tratamientos = [];

  @override
  Future<void> initialise() async {
    tratamientos = await _tratamientoService.getTratamientosAndPacientes();
    rebuildUi();
  }

  void navigateToCrearTratamiento() {
    _navigationService
        .navigateToEditarTratamientoView(tratamiento: null, isEditing: false)
        .then((value) {
      if (value != null) {
        initialise();
      }
    });
  }

  void navigateToDatosTratamiento(Tratamiento tratamiento) {}
}
