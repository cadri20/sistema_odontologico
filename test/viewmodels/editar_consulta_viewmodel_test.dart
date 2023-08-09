import 'package:flutter_test/flutter_test.dart';
import 'package:sistema_odontologico/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('EditarConsultaViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
