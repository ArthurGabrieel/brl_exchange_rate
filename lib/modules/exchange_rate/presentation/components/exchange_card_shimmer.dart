import 'package:flutter/material.dart';

import '../../../../core/helpers/shimmer_helper.dart';

class ExchangeCardShimmer extends StatelessWidget {
  const ExchangeCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 16,
        children: [
          Divider(color: Colors.grey[300]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerHelper.rectangular(height: 18, width: 120),
                  const SizedBox(height: 8),
                  ShimmerHelper.rectangular(height: 12, width: 100),
                ],
              ),
              ShimmerHelper.rectangular(height: 45, width: 70),
            ],
          ),
          ShimmerHelper.rectangular(height: 72, width: double.infinity),
          ShimmerHelper.rectangular(height: 40, width: double.infinity),
        ],
      ),
    );
  }
}
