import 'package:currency_formatter/currency_formatter.dart';

class CurrencyHelper {
  const CurrencyHelper._();

  static String formattedDollarMoney({
    required int amount,
    String prefix = '',
  }) {
    final dollarSetting = CurrencyFormat(
      code: 'usd',
      symbol: '$prefix\$',
      symbolSide: SymbolSide.left,
      thousandSeparator: '.',
      decimalSeparator: ',',
      symbolSeparator: '',
    );

    return CurrencyFormatter.format(amount, dollarSetting);
  }
}
