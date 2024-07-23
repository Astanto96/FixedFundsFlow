class AmountFormatter {
  //Private Constructor to prevent instantiation
  AmountFormatter._();

  static String formatToString(int amount) {
    final double convertedAmount = amount / 100.0;
    return '${convertedAmount.toStringAsFixed(2).replaceAll('.', ',')}€';
  }
}
