import '../../domain/entities/exchange_rate_data.dart';

class ExchangeRateDataModel extends ExchangeRateData {
  ExchangeRateDataModel({
    super.close,
    super.date,
    super.high,
    super.low,
    super.open,
  });

  factory ExchangeRateDataModel.fromJson(Map<String, dynamic> json) {
    return ExchangeRateDataModel(
      close: (json['close'] as num?)?.toDouble(),
      date: json['date'] as String?,
      high: (json['high'] as num?)?.toDouble(),
      low: (json['low'] as num?)?.toDouble(),
      open: (json['open'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'close': close,
      'date': date,
      'high': high,
      'low': low,
      'open': open,
    };
  }
}
