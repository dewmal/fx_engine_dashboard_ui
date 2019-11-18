enum Symbol {
  EUR_USD,
  EUR_GBP,
  EUR_JPY,
  EUR_CHF,
  GBP_USD,
  USD_JPY,
  USD_CHF,
  GBP_JPY,
  AUD_CHF,
  EUR_CAD,
  CAD_CHF,
  USD_CAD
}

const symbolList = <Symbol>[
  Symbol.EUR_USD,
  Symbol.GBP_USD,
  Symbol.USD_JPY,
  Symbol.USD_CHF,
  Symbol.EUR_GBP,
  Symbol.EUR_JPY,
  Symbol.EUR_CHF,
  Symbol.GBP_JPY,
  Symbol.AUD_CHF,
  Symbol.EUR_CAD,
  Symbol.CAD_CHF,
  Symbol.USD_CAD
];

String getSymbolLabel(Symbol symbol) {
  return "$symbol".replaceAll("Symbol.", "").replaceAll("_", "/");
}
String getSymbolValue(Symbol symbol) {
  return "$symbol".replaceAll("Symbol.", "");
}
