import 'package:sistema_odontologico/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:sistema_odontologico/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:sistema_odontologico/ui/views/home/home_view.dart';
import 'package:sistema_odontologico/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sistema_odontologico/ui/views/pacientes/pacientes_view.dart';
import 'package:sistema_odontologico/services/paciente_service.dart';
import 'package:sistema_odontologico/ui/views/crear_paciente/crear_paciente_view.dart';
import 'package:sistema_odontologico/ui/views/tratamientos/tratamientos_view.dart';
import 'package:sistema_odontologico/services/tratamiento_service.dart';
import 'package:sistema_odontologico/ui/views/editar_tratamiento/editar_tratamiento_view.dart';
import 'package:sistema_odontologico/ui/views/seleccionar_paciente/seleccionar_paciente_view.dart';
import 'package:sistema_odontologico/ui/views/consultas/consultas_view.dart';
import 'package:sistema_odontologico/services/consulta_service.dart';
import 'package:sistema_odontologico/ui/views/editar_consulta/editar_consulta_view.dart';
import 'package:sistema_odontologico/ui/views/dato_paciente/dato_paciente_view.dart';
import 'package:sistema_odontologico/ui/views/datos_tratamiento/datos_tratamiento_view.dart';
import 'package:sistema_odontologico/ui/views/datos_tratamiento/datos_tratamiento_view.dart';
import 'package:sistema_odontologico/services/auth_service.dart';
import 'package:sistema_odontologico/ui/views/login/login_view.dart';
import 'package:sistema_odontologico/services/config_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: PacientesView),
    MaterialRoute(page: CrearPacienteView),
    MaterialRoute(page: TratamientosView),
    MaterialRoute(page: EditarTratamientoView),
    MaterialRoute(page: SeleccionarPacienteView),
    MaterialRoute(page: ConsultasView),
    MaterialRoute(page: EditarConsultaView),
    MaterialRoute(page: DatoPacienteView),
    MaterialRoute(page: DatosTratamientoView),
    MaterialRoute(page: DatosTratamientoView),
    MaterialRoute(page: LoginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: PacienteService),
    LazySingleton(classType: TratamientoService),
    LazySingleton(classType: ConsultaService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: ConfigService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
