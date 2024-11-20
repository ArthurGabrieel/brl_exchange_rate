import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/exchange_rate_bloc.dart';
import '../bloc/exchange_rate_state.dart';
import '../components/exchange_card_shimmer.dart';
import '../components/exchange_rate_form.dart';
import '../components/exchange_rate_header.dart';
import '../components/exchange_rates_card.dart';

class ExchangeRatePage extends StatefulWidget {
  const ExchangeRatePage({super.key});

  @override
  State<ExchangeRatePage> createState() => _ExchangeRatePageState();
}

class _ExchangeRatePageState extends State<ExchangeRatePage> {
  Widget _buildCopyRight() {
    return Container(
      height: 40,
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Copyright 2022 - Action Labs',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildCopyRight(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
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
                      return const ExchangeCardShimmer();
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
        ),
      ),
    );
  }
}
