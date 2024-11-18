import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/current_exchange_rate.dart';
import '../repositories/exchange_rate_repository.dart';

class SearchExchangeRateUsecase
    implements UseCase<CurrentExchangeRate, String> {
  final ExchangeRateRepository repository;

  const SearchExchangeRateUsecase(this.repository);

  @override
  Future<Either<Failure, CurrentExchangeRate>> call(String currencyCode) async {
    return repository.searchCurrentExchangeRate(currencyCode);
  }
}
