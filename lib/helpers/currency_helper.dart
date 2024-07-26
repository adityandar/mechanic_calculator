import 'package:currency_formatter/currency_formatter.dart';

class CurrencyHelper {
  const CurrencyHelper._();

  static String formattedDollarMoney({
    required int amount,
    String suffix = '',
  }) {
    final dollarSetting = CurrencyFormat(
      code: 'usd',
      symbol: '$suffix\$',
      symbolSide: SymbolSide.left,
      thousandSeparator: '.',
      decimalSeparator: ',',
      symbolSeparator: '',
    );

    return CurrencyFormatter.format(amount, dollarSetting);
  }
}
