import 'package:flutter/material.dart';

import 'app_widget.dart';
import 'core/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const AppWidget());
}
