import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/build_context_helper.dart';
import '../bloc/exchange_rate_bloc.dart';
import '../bloc/exchange_rate_event.dart';

class ExchangeRateForm extends StatelessWidget {
  const ExchangeRateForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 30,
      children: [
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Enter the currency code',
            labelStyle: TextStyle(color: Colors.black),
            floatingLabelStyle: TextStyle(color: Colors.blue),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
          ),
          onPressed: () {
            final currencyCode = controller.text.trim().toUpperCase();
            if (currencyCode.isNotEmpty) {
              context
                  .read<ExchangeRateBloc>()
                  .add(FetchExchangeRatesEvent(currencyCode));
            } else {
              context.showSnackBar('Please enter a valid currency code!');
            }
          },
          child: const Text(
            'EXCHANGE RESULT',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
