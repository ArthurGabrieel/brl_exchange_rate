import 'package:equatable/equatable.dart';

abstract class ExchangeRateEvent extends Equatable {
  const ExchangeRateEvent();

  @override
  List<Object> get props => [];
}

class FetchCurrentExchangeRateEvent extends ExchangeRateEvent {
  final String currencyCode;

  const FetchCurrentExchangeRateEvent(this.currencyCode);

  @override
  List<Object> get props => [currencyCode];
}

class FetchDailyExchangeRatesEvent extends ExchangeRateEvent {
  final String currencyCode;

  const FetchDailyExchangeRatesEvent(this.currencyCode);

  @override
  List<Object> get props => [currencyCode];
}
