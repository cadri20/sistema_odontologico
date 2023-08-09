import 'package:sistema_odontologico/app/app.bottomsheets.dart';
import 'package:sistema_odontologico/app/app.dialogs.dart';
import 'package:sistema_odontologico/app/app.locator.dart';
import 'package:sistema_odontologico/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void set currentIndex(int index) {
    _currentIndex = index;
    rebuildUi();
  }

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
