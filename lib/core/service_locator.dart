import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../modules/exchange_rate/data/datasources/exchange_rate_remote_data_source.dart';
import '../modules/exchange_rate/data/repositories/exchange_rate_repository_impl.dart';
import '../modules/exchange_rate/domain/repositories/exchange_rate_repository.dart';
import '../modules/exchange_rate/domain/usecases/get_daily_exchange_rates_usecase.dart';
import '../modules/exchange_rate/domain/usecases/search_exchange_rate_usecase.dart';
import '../modules/exchange_rate/presentation/bloc/exchange_rate_bloc.dart';
import 'api/http_client.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Blocs
  sl.registerFactory(() => ExchangeRateBloc(
        searchExchangeRateUsecase: sl(),
        getDailyExchangeRatesUsecase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => SearchExchangeRateUsecase(sl()));
  sl.registerLazySingleton(() => GetDailyExchangeRatesUsecase(sl()));

  // Repositories
  sl.registerLazySingleton<ExchangeRateRepository>(
    () => ExchangeRateRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ExchangeRateRemoteDataSource>(
    () => ExchangeRateRemoteDataSourceImpl(sl()),
  );

  // Core
  sl.registerLazySingleton(() => HttpClient(sl()));

  // External
  sl.registerLazySingleton(() => Dio());
}
