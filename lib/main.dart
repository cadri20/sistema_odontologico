import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sistema_odontologico/app/app.bottomsheets.dart';
import 'package:sistema_odontologico/app/app.dialogs.dart';
import 'package:sistema_odontologico/app/app.locator.dart';
import 'package:sistema_odontologico/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();


  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('es', 'ES'),
        ]);
  }
}
