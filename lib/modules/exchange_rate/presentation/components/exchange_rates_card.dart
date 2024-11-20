import 'package:flutter/material.dart';

import '../../../../core/helpers/double_helper.dart';
import '../../../../core/helpers/string_helper.dart';
import '../../domain/entities/current_exchange_rate.dart';
import '../../domain/entities/exchange_rates.dart';
import 'daily_card.dart';

class ExchangeRatesCard extends StatelessWidget {
  const ExchangeRatesCard({
    super.key,
    required this.currentExchangeRate,
    required this.dailyExchangeRates,
  });

  final CurrentExchangeRate currentExchangeRate;
  final ExchangeRates dailyExchangeRates;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CurrentExchangeRateCard(currentExchangeRate: currentExchangeRate),
        const SizedBox(height: 16),
        DailyExchangeRatesCard(dailyExchangeRates: dailyExchangeRates),
      ],
    );
  }
}

class CurrentExchangeRateCard extends StatelessWidget {
  const CurrentExchangeRateCard({super.key, required this.currentExchangeRate});

  final CurrentExchangeRate currentExchangeRate;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 18,
      children: [
        Divider(color: Colors.grey[300]),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Exchange rate now',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  currentExchangeRate.lastUpdatedAt!.toFormattedDateWithHour(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                      ),
                ),
              ],
            ),
            const Spacer(),
            Text(
                '${currentExchangeRate.fromSymbol}/${currentExchangeRate.toSymbol}',
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        SizedBox(
          height: 72,
          child: Card(
            child: Center(
              child: Text(
                currentExchangeRate.exchangeRate?.toCurrency() ?? '',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.blue,
                      fontSize: 32,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
