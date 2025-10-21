import 'package:intl/intl.dart';

class StringUtils {
  static String getInitials(String? name) {
    if (name == null) return "?";

    String cleaned = name.trim();
    if (cleaned.isEmpty) return "?";

    List<String> parts =
        cleaned.split(RegExp(r"\s+")).where((p) => p.isNotEmpty).toList();

    if (parts.isEmpty) return "?";

    if (parts.length >= 2) {
      return (parts.first[0] + parts.last[0]).toUpperCase();
    }

    String word = parts.first;

    if (word.length >= 2) {
      return (word[0] + word[1]).toUpperCase();
    }

    if (word.isNotEmpty) {
      return word[0].toUpperCase();
    }

    return "";
  }

  static String formatToCommas(String value) {
    final cleaned = value.replaceAll(',', '');

    final intNumber = int.tryParse(cleaned);
    if (intNumber != null) {
      return NumberFormat.decimalPattern().format(intNumber);
    }

    final doubleNumber = double.tryParse(cleaned);
    if (doubleNumber != null) {
      return NumberFormat.decimalPattern().format(doubleNumber);
    }

    return value;
  }

  static String coinName(String symbol) {
    final s = symbol.toUpperCase().replaceAll('USDT', '');
    const names = {
      'BTC': 'Bitcoin',
      'ETH': 'Ethereum',
      'BNB': 'BNB',
      'SOL': 'Solana',
      'SUSHI': 'Sushi',
      'ADA': 'Cardano',
      'XRP': 'XRP',
      'DOGE': 'Dogecoin',
      'MATIC': 'Polygon',
      'DOT': 'Polkadot',
      'AVAX': 'Avalanche',
      'LTC': 'Litecoin',
      'TRX': 'TRON',
      'UNI': 'Uniswap',
      'LINK': 'Chainlink',
      'ATOM': 'Cosmos',
      'AAVE': 'Aave',
      'FTM': 'Fantom',
      'NEAR': 'Near Protocol',
      'SHIB': 'Shiba Inu',
      'APE': 'ApeCoin',
      'FIL': 'Filecoin',
      'INJ': 'Injective',
      'OP': 'Optimism',
      'ARB': 'Arbitrum',
      'RUNE': 'THORChain',
      'SAND': 'The Sandbox',
      'AXS': 'Axie Infinity',
      'EGLD': 'MultiversX',
      'RNDR': 'Render Token',
    };
    return names[s] ?? s;
  }

  static String coinIconUrl(String symbol) {
    const Map<String, String> iconNameExceptions = {
      'BCH': 'bch-sv',
      'ETC': 'eth-classic',
      'XLM': 'stellar',
      'MIOTA': 'iota',
      'IOTX': 'iotx',
      'DOGE': 'dogecoin',
      'FIL': 'filecoin',
      'XMR': 'monero',
      'DOT': 'polkadot',
      'UNI': 'uniswap',
      'BNB': 'binance-coin',
      'SYRUP': 'syrup',
      'SOPH': 'soph',
      'BRL': 'brl',
    };

    final baseSymbol = symbol.toUpperCase().replaceAll('USDT', '');

    String iconName;

    if (iconNameExceptions.containsKey(baseSymbol)) {
      iconName = iconNameExceptions[baseSymbol]!;
    } else {
      iconName = baseSymbol.toLowerCase();
    }

    return 'https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/$iconName.png';
  }
}
