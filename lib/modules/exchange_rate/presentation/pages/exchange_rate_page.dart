import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/exchange_rate_bloc.dart';
import '../bloc/exchange_rate_state.dart';
import '../components/exchange_rate_form.dart';
import '../components/exchange_rate_header.dart';
import '../components/exchange_rates_card.dart';

class ExchangeRatePage extends StatefulWidget {
  const ExchangeRatePage({super.key});

  @override
  State<ExchangeRatePage> createState() => _ExchangeRatePageState();
}

class _ExchangeRatePageState extends State<ExchangeRatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 16,
                  children: [
                    const ExchangeRateHeader(),
                    const ExchangeRateForm(),
                    BlocBuilder<ExchangeRateBloc, ExchangeRateState>(
                      builder: (context, state) {
                        if (state is ExchangeRateLoading) {
                          return const CircularProgressIndicator();
                        } else if (state is ExchangeRateError) {
                          return Text(state.message);
                        } else if (state is ExchangeRatesLoaded) {
                          return ExchangeRatesCard(
                            currentExchangeRate: state.currentExchangeRate,
                            dailyExchangeRates: state.dailyExchangeRates,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
