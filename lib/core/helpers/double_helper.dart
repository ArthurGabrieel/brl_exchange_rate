extension DoubleHelper on double {
  String toCurrency() {
    return 'R\$ ${toStringAsFixed(2).replaceAll('.', ',')}';
  }
}
