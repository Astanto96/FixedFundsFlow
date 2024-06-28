class AmountFormatter {
  static String formatToString(int amount) {
    double convertedAmount = amount / 100.0;
    return '${convertedAmount.toStringAsFixed(2).replaceAll('.', ',')}€';
  }
}
