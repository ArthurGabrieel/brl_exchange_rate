import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/current_exchange_rate.dart';
import '../entities/exchange_rates.dart';

abstract class ExchangeRateRepository {
  Future<Either<Failure, CurrentExchangeRate>> searchCurrentExchangeRate(
      String currencyCode);

  Future<Either<Failure, ExchangeRates>> getDailyExchangeRates(
      String currencyCode);
}
