import 'package:flutter/material.dart';

import '../../../modules/exchange_rate/presentation/pages/exchange_rate_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const ExchangeRatePage(),
      };
}
