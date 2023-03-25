class PriceConverter{

  static double usdBtcConverter(double usd){
    if(usd <= 0){
      throw ArgumentError();
    }
    return (usd * 0.000036);
  }

  static double btcUsdConverter(double btc){
    if(btc <= 0){
      throw ArgumentError();
    }
    return (btc * 27560.30);
  }

}