import 'package:bloc/bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/usecases/get_daily_exchange_rates_usecase.dart';
import '../../domain/usecases/search_exchange_rate_usecase.dart';
import 'exchange_rate_event.dart';
import 'exchange_rate_state.dart';

class ExchangeRateBloc extends Bloc<ExchangeRateEvent, ExchangeRateState> {
  final SearchExchangeRateUsecase searchExchangeRateUsecase;
  final GetDailyExchangeRatesUsecase getDailyExchangeRatesUsecase;

  ExchangeRateBloc({
    required this.searchExchangeRateUsecase,
    required this.getDailyExchangeRatesUsecase,
  }) : super(ExchangeRateInitial()) {
    on<FetchExchangeRatesEvent>(_onFetchExchangeRatesEvent);
  }

  Future<void> _onFetchExchangeRatesEvent(
    FetchExchangeRatesEvent event,
    Emitter<ExchangeRateState> emit,
  ) async {
    emit(ExchangeRateLoading());

    try {
      final currentExchangeRateResult =
          await searchExchangeRateUsecase(event.currencyCode);

      final currentExchangeRate = currentExchangeRateResult.getOrElse(() {
        throw currentExchangeRateResult.fold(
            (failure) => failure, (_) => null)!;
      });

      final dailyExchangeRatesResult =
          await getDailyExchangeRatesUsecase(event.currencyCode);

      final dailyExchangeRates = dailyExchangeRatesResult.getOrElse(() {
        throw dailyExchangeRatesResult.fold((failure) => failure, (_) => null)!;
      });

      emit(ExchangeRatesLoaded(dailyExchangeRates, currentExchangeRate));
    } catch (failure) {
      emit(ExchangeRateError((failure as Failure).message));
    }
  }
}
