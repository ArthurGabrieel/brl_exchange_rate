import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/current_exchange_rate.dart';
import '../../domain/entities/exchange_rates.dart';
import '../../domain/repositories/exchange_rate_repository.dart';
import '../datasources/exchange_rate_remote_data_source.dart';

class ExchangeRateRepositoryImpl implements ExchangeRateRepository {
  const ExchangeRateRepositoryImpl({required this.remoteDataSource});

  final ExchangeRateRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, CurrentExchangeRate>> searchCurrentExchangeRate(
      String currencyCode) async {
    try {
      final currentExchangeRate =
          await remoteDataSource.searchCurrentExchangeRate(currencyCode);
      return Right(currentExchangeRate);
    } on ServerException {
      return const Left(
          ServerFailure('Error loading data, please try again later!'));
    }
  }

  @override
  Future<Either<Failure, ExchangeRates>> getDailyExchangeRates(
      String currencyCode) async {
    try {
      final dailyExchangeRates =
          await remoteDataSource.getDailyExchangeRates(currencyCode);
      return Right(dailyExchangeRates);
    } on ServerException {
      return const Left(
          ServerFailure('Error loading data, please try again later!'));
    }
  }
}
