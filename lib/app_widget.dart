import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/routes/app_routes.dart';
import 'core/config/style/theme.dart';
import 'core/service_locator.dart';
import 'modules/exchange_rate/presentation/bloc/exchange_rate_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ExchangeRateBloc>(),
      child: MaterialApp(
        title: 'Action Lab Test',
        theme: AppTheme.light,
        routes: AppRoutes.routes,
      ),
    );
  }
}
