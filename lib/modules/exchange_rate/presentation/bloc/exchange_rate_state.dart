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

class CurrentExchangeRateLoaded extends ExchangeRateState {
  final CurrentExchangeRate currentExchangeRate;

  const CurrentExchangeRateLoaded(this.currentExchangeRate);

  @override
  List<Object> get props => [currentExchangeRate];
}

class DailyExchangeRatesLoaded extends ExchangeRateState {
  final ExchangeRates dailyExchangeRates;

  const DailyExchangeRatesLoaded(this.dailyExchangeRates);

  @override
  List<Object> get props => [dailyExchangeRates];
}

class ExchangeRateError extends ExchangeRateState {
  final String message;

  const ExchangeRateError(this.message);

  @override
  List<Object> get props => [message];
}
