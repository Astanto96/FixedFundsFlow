class AmountFormatter {
  //Private Constructor to prevent instantiation
  AmountFormatter._();

  static String formatToString(int amount) {
    final double convertedAmount = amount / 100.0;
    return '${convertedAmount.toStringAsFixed(2).replaceAll('.', ',')}€';
  }

  static int formatToInt(String amountString) {
    try {
      // Entferne das Währungszeichen und ersetze das Komma durch einen Punkt
      final String sanitizedString =
          amountString.replaceAll('€', '').replaceAll(',', '.');

      // Konvertiere die bereinigte Zeichenkette in einen double
      final double amountDouble = double.parse(sanitizedString);

      // Multipliziere den Betrag mit 100 und konvertiere ihn in einen int
      final int amountInt = (amountDouble * 100).round();

      return amountInt;
    } catch (e) {
      return 0; // Oder eine andere geeignete Fehlerbehandlung
    }
  }
}
