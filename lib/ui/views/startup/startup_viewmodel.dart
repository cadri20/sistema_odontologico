import 'dart:convert';

import 'package:stacked/stacked.dart';
import 'package:sistema_odontologico/app/app.locator.dart';
import 'package:sistema_odontologico/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import 'dart:io';

import '../../../services/config_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _configService = locator<ConfigService>();

  bool errorInStartup = false;
  String errorMessage = "";
  String backendMessage = "";

  // Place anything here that needs to happen before we get into the application

  Future runStartupLogic() async {
    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
    /*
    FlutterWindowClose.setWindowShouldCloseHandler(() async {
      await _configService.stopBackend();
      return true;
    });*/

    _configService.loadConfig();
    //inal config = _configService.configMap;

    if(await _configService.checkBackend()){
      _navigationService.replaceWith(Routes.loginView);
      return;
    }

    _configService.startBackend(() async{
      var backendIsRunning = await _configService.checkBackend();
      if(!backendIsRunning){
        errorInStartup = true;
        errorMessage = "La base de datos no ha sido iniciada";
        rebuildUi();
        return;
      }
      _navigationService.replaceWith(Routes.loginView);
    }, (error) {
      errorInStartup = true;
      errorMessage = error;
      rebuildUi();
    },
        (message){
      backendMessage = message;
      rebuildUi();
        }
    );
  }
}
