import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/icons/app_vectors.dart';

class ExchangeRateHeader extends StatelessWidget {
  const ExchangeRateHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 22,
      children: [
        SvgPicture.asset(AppVectors.logo),
        Divider(color: Colors.grey[400]),
        Text(
          'BRL EXCHANGE RATE',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
