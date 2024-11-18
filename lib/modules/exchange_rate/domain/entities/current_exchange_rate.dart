class CurrentExchangeRate {
  double? exchangeRate;
  String? fromSymbol;
  String? lastUpdatedAt;
  bool? rateLimitExceeded;
  bool? success;
  String? toSymbol;

  CurrentExchangeRate({
    this.exchangeRate,
    this.fromSymbol,
    this.lastUpdatedAt,
    this.rateLimitExceeded,
    this.success,
    this.toSymbol,
  });
}
