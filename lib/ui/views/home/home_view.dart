import 'package:flutter/material.dart';
import 'package:sistema_odontologico/ui/views/crear_paciente/crear_paciente_view.dart';
import 'package:sistema_odontologico/ui/views/tratamientos/tratamientos_view.dart';
import 'package:stacked/stacked.dart';
import 'package:sistema_odontologico/ui/common/app_colors.dart';
import 'package:sistema_odontologico/ui/common/ui_helpers.dart';

import '../../../model/paciente.dart';
import '../consultas/consultas_view.dart';
import '../pacientes/pacientes_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            groupAlignment: 0.0,
            selectedIndex: viewModel.currentIndex,
            onDestinationSelected: (index) => viewModel.currentIndex = index,
            labelType: NavigationRailLabelType.selected,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.calendar_today),
                selectedIcon: Icon(Icons.calendar_today),
                label: Text('Consultas'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.medical_information),
                selectedIcon: Icon(Icons.medical_information),
                label: Text('Tratamientos'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people),
                selectedIcon: Icon(Icons.people),
                label: Text('Pacientes'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: getGurrentView(viewModel.currentIndex))
        ],
      ),
    );
  }

  Widget getGurrentView(int index) {
    switch (index) {
      case 0:
        return const ConsultasView();
      case 1:
        return const TratamientosView();
      case 2:
        return const PacientesView();
      default:
        return const ConsultasView();
    }
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
