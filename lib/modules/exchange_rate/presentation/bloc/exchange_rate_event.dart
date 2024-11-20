import 'package:equatable/equatable.dart';

abstract class ExchangeRateEvent extends Equatable {
  const ExchangeRateEvent();

  @override
  List<Object> get props => [];
}

class FetchExchangeRatesEvent extends ExchangeRateEvent {
  final String currencyCode;

  const FetchExchangeRatesEvent(this.currencyCode);

  @override
  List<Object> get props => [currencyCode];
}
