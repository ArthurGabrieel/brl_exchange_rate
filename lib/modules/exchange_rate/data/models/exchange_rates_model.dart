import '../../domain/entities/exchange_rates.dart';
import 'exchange_rate_data_model.dart';

class ExchangeRatesModel extends ExchangeRates {
  ExchangeRatesModel({
    super.data,
    super.from,
    super.lastUpdatedAt,
    super.rateLimitExceeded,
    super.success,
    super.to,
  });

  factory ExchangeRatesModel.fromJson(Map<String, dynamic> json) {
    return ExchangeRatesModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => ExchangeRateDataModel.fromJson(item))
          .toList(),
      from: json['from'] as String?,
      lastUpdatedAt: json['lastUpdatedAt'] as String?,
      rateLimitExceeded: json['rateLimitExceeded'] as bool?,
      success: json['success'] as bool?,
      to: json['to'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data
          ?.map((item) => (item as ExchangeRateDataModel).toJson())
          .toList(),
      'from': from,
      'lastUpdatedAt': lastUpdatedAt,
      'rateLimitExceeded': rateLimitExceeded,
      'success': success,
      'to': to,
    };
  }
}
