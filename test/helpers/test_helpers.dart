import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sistema_odontologico/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sistema_odontologico/services/paciente_service.dart';
import 'package:sistema_odontologico/services/tratamiento_service.dart';
import 'package:sistema_odontologico/services/consulta_service.dart';
import 'package:sistema_odontologico/services/auth_service.dart';
import 'package:sistema_odontologico/services/config_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PacienteService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TratamientoService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ConsultaService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ConfigService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterPacienteService();
  getAndRegisterTratamientoService();
  getAndRegisterConsultaService();
  getAndRegisterAuthService();
  getAndRegisterConfigService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockPacienteService getAndRegisterPacienteService() {
  _removeRegistrationIfExists<PacienteService>();
  final service = MockPacienteService();
  locator.registerSingleton<PacienteService>(service);
  return service;
}

MockTratamientoService getAndRegisterTratamientoService() {
  _removeRegistrationIfExists<TratamientoService>();
  final service = MockTratamientoService();
  locator.registerSingleton<TratamientoService>(service);
  return service;
}

MockConsultaService getAndRegisterConsultaService() {
  _removeRegistrationIfExists<ConsultaService>();
  final service = MockConsultaService();
  locator.registerSingleton<ConsultaService>(service);
  return service;
}

MockAuthService getAndRegisterAuthService() {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}

MockConfigService getAndRegisterConfigService() {
  _removeRegistrationIfExists<ConfigService>();
  final service = MockConfigService();
  locator.registerSingleton<ConfigService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
