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
    on<FetchCurrentExchangeRateEvent>(_onFetchCurrentExchangeRateEvent);
    on<FetchDailyExchangeRatesEvent>(_onFetchDailyExchangeRatesEvent);
  }

  Future<void> _onFetchCurrentExchangeRateEvent(
    FetchCurrentExchangeRateEvent event,
    Emitter<ExchangeRateState> emit,
  ) async {
    emit(ExchangeRateLoading());
    final result = await searchExchangeRateUsecase(event.currencyCode);

    result.fold(
      (failure) => emit(ExchangeRateError(_mapFailureToMessage(failure))),
      (currentExchangeRate) =>
          emit(CurrentExchangeRateLoaded(currentExchangeRate)),
    );
  }

  Future<void> _onFetchDailyExchangeRatesEvent(
    FetchDailyExchangeRatesEvent event,
    Emitter<ExchangeRateState> emit,
  ) async {
    emit(ExchangeRateLoading());
    final result = await getDailyExchangeRatesUsecase(event.currencyCode);

    result.fold(
      (failure) => emit(ExchangeRateError(_mapFailureToMessage(failure))),
      (dailyExchangeRates) =>
          emit(DailyExchangeRatesLoaded(dailyExchangeRates)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Erro no servidor. Por favor, tente novamente mais tarde.';
    } else if (failure is UnauthorizedFailure) {
      return 'Não autorizado. Verifique suas credenciais.';
    } else if (failure is NotFoundFailure) {
      return 'Dados não encontrados. Verifique o código da moeda.';
    } else {
      return 'Erro desconhecido. Por favor, tente novamente.';
    }
  }
}
