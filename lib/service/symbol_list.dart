enum AssetSymbol {
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

const symbolList = <AssetSymbol>[
  AssetSymbol.EUR_USD,
  AssetSymbol.GBP_USD,
  AssetSymbol.USD_JPY,
  AssetSymbol.USD_CHF,
  AssetSymbol.EUR_GBP,
  AssetSymbol.EUR_JPY,
  AssetSymbol.EUR_CHF,
  AssetSymbol.GBP_JPY,
  AssetSymbol.AUD_CHF,
  AssetSymbol.EUR_CAD,
  AssetSymbol.CAD_CHF,
  AssetSymbol.USD_CAD
];

String getSymbolLabel(AssetSymbol symbol) {
  return "$symbol".replaceAll("AssetSymbol.", "").replaceAll("_", "/");
}
String getSymbolValue(AssetSymbol symbol) {
  return "$symbol".replaceAll("AssetSymbol.", "");
}
