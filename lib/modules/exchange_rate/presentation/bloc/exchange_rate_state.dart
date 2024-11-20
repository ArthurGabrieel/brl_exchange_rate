import 'package:equatable/equatable.dart';

import '../../domain/entities/current_exchange_rate.dart';
import '../../domain/entities/exchange_rates.dart';

abstract class ExchangeRateState extends Equatable {
  const ExchangeRateState();

  @override
  List<Object> get props => [];
}

class ExchangeRateInitial extends ExchangeRateState {}

class ExchangeRateLoading extends ExchangeRateState {}

class ExchangeRatesLoaded extends ExchangeRateState {
  final ExchangeRates dailyExchangeRates;
  final CurrentExchangeRate currentExchangeRate;

  const ExchangeRatesLoaded(this.dailyExchangeRates, this.currentExchangeRate);

  @override
  List<Object> get props => [dailyExchangeRates];
}

class ExchangeRateError extends ExchangeRateState {
  final String message;

  const ExchangeRateError(this.message);

  @override
  List<Object> get props => [message];
}
