import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/exchange_rates.dart';
import '../repositories/exchange_rate_repository.dart';

class GetDailyExchangeRatesUsecase implements UseCase<ExchangeRates, String> {
  final ExchangeRateRepository repository;

  const GetDailyExchangeRatesUsecase(this.repository);

  @override
  Future<Either<Failure, ExchangeRates>> call(String currencyCode) async {
    return repository.getDailyExchangeRates(currencyCode);
  }
}
