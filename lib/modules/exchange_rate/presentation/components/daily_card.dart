import 'package:flutter/material.dart';

import '../../../../core/helpers/build_context_helper.dart';
import '../../../../core/helpers/string_helper.dart';
import '../../domain/entities/exchange_rate_data.dart';
import '../../domain/entities/exchange_rates.dart';

class DailyExchangeRatesCard extends StatefulWidget {
  const DailyExchangeRatesCard({super.key, required this.dailyExchangeRates});

  final ExchangeRates dailyExchangeRates;

  @override
  State<DailyExchangeRatesCard> createState() => _DailyExchangeRatesCardState();
}

class _DailyExchangeRatesCardState extends State<DailyExchangeRatesCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final dataList = widget.dailyExchangeRates.data ?? [];

    Widget buildExpandButton() {
      return Column(
        children: [
          Row(
            children: [
              Text(
                'LAST 30 DAYS',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(isExpanded ? Icons.remove : Icons.add),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  if (dataList.isNotEmpty) {
                    setState(() => isExpanded = !isExpanded);
                  } else {
                    context.showSnackBar('No data available');
                  }
                },
              ),
            ],
          ),
        ],
      );
    }

    return Column(
      children: [
        buildExpandButton(),
        if (isExpanded) ...[
          Container(
            color: Colors.grey[200],
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final currentData = dataList[index];
                double? previousClose;

                // Check if there is a previous day
                if (index + 1 < dataList.length) {
                  previousClose = dataList[index + 1].close;
                }

                return _buildCard(currentData, previousClose);
              },
            ),
          ),
        ],
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 2,
        ),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildCard(ExchangeRateData rate, double? previousClose) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          alignment: WrapAlignment.start,
          runSpacing: 8,
          children: [
            Text(
              rate.date!.toFormattedDate(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildAndFormatText('OPEN', rate.open),
                _buildAndFormatText('HIGHT', rate.high),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildAndFormatText('CLOSE', rate.close),
                _buildAndFormatText('LOW', rate.low),
              ],
            ),
            _buildCloseDiff(rate, previousClose),
          ],
        ),
      ),
    );
  }

  Widget _buildAndFormatText(String label, double? value) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
        ),
        Text(
          'R\$ ${value?.toStringAsFixed(4)}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Widget _buildCloseDiff(ExchangeRateData rate, double? previousClose) {
    double? closeDiff;
    double? diffPercentage;
    Color diffColor = Colors.grey;
    IconData diffIcon = Icons.remove;

    if (previousClose != null && rate.close != null) {
      closeDiff = rate.close! - previousClose;
      diffPercentage = (closeDiff / previousClose) * 100;
      diffColor = closeDiff >= 0 ? Colors.green : Colors.red;
      diffIcon = closeDiff >= 0 ? Icons.arrow_upward : Icons.arrow_downward;

      return Row(
        children: [
          const Text('CLOSE DIFF (%): ', style: TextStyle(fontSize: 14)),
          Text(
            '${diffPercentage.toStringAsFixed(2)}%',
            style: TextStyle(color: diffColor, fontWeight: FontWeight.bold),
          ),
          Icon(diffIcon, color: diffColor),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
