import 'package:flutter/material.dart';

import 'core/config/style/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Action Lab Test',
      theme: AppTheme.light,
      home: const Placeholder(),
    );
  }
}
