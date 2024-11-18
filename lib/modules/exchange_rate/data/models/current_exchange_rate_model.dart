import '../../domain/entities/current_exchange_rate.dart';

class CurrentExchangeRateModel extends CurrentExchangeRate {
  CurrentExchangeRateModel({
    super.exchangeRate,
    super.fromSymbol,
    super.lastUpdatedAt,
    super.rateLimitExceeded,
    super.success,
    super.toSymbol,
  });

  factory CurrentExchangeRateModel.fromJson(Map<String, dynamic> json) {
    return CurrentExchangeRateModel(
      exchangeRate: (json['exchangeRate'] as num?)?.toDouble(),
      fromSymbol: json['fromSymbol'] as String?,
      lastUpdatedAt: json['lastUpdatedAt'] as String?,
      rateLimitExceeded: json['rateLimitExceeded'] as bool?,
      success: json['success'] as bool?,
      toSymbol: json['toSymbol'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exchangeRate': exchangeRate,
      'fromSymbol': fromSymbol,
      'lastUpdatedAt': lastUpdatedAt,
      'rateLimitExceeded': rateLimitExceeded,
      'success': success,
      'toSymbol': toSymbol,
    };
  }
}
