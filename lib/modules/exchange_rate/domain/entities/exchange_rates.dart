import 'exchange_rate_data.dart';

class ExchangeRates {
  List<ExchangeRateData>? data;
  String? from;
  String? lastUpdatedAt;
  bool? rateLimitExceeded;
  bool? success;
  String? to;

  ExchangeRates({
    this.data,
    this.from,
    this.lastUpdatedAt,
    this.rateLimitExceeded,
    this.success,
    this.to,
  });
}
