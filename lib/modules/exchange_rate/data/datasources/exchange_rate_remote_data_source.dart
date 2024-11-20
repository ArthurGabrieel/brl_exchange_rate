import 'package:flutter/material.dart';

import '../../../../core/api/endpoints.dart';
import '../../../../core/api/http_client.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/current_exchange_rate.dart';
import '../../domain/entities/exchange_rates.dart';
import '../models/current_exchange_rate_model.dart';
import '../models/exchange_rates_model.dart';

abstract class ExchangeRateRemoteDataSource {
  Future<CurrentExchangeRate> searchCurrentExchangeRate(String currencyCode);

  Future<ExchangeRates> getDailyExchangeRates(String currencyCode);
}

class ExchangeRateRemoteDataSourceImpl implements ExchangeRateRemoteDataSource {
  const ExchangeRateRemoteDataSourceImpl(this.client);

  final HttpClient client;

  @override
  Future<CurrentExchangeRate> searchCurrentExchangeRate(
      String currencyCode) async {
    final queryParams = {'from_symbol': currencyCode, 'to_symbol': 'BRL'};
    final response =
        await client.get(Endpoints.currentExchangeRate, queryParams);

    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      final model = CurrentExchangeRateModel.fromJson(data);
      if (model.success == false) {
        debugPrint('success: ${model.success}');
        throw ServerException();
      }
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ExchangeRates> getDailyExchangeRates(String currencyCode) async {
    final queryParams = {'from_symbol': currencyCode, 'to_symbol': 'BRL'};
    final response = await client.get(Endpoints.dailyExchangeRate, queryParams);

    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      final model = ExchangeRatesModel.fromJson(data);
      if (model.success == false) {
        debugPrint('success: ${model.success}');
        throw ServerException();
      }
      return model;
    } else {
      throw ServerException();
    }
  }
}
