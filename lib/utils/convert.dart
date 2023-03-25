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

  static bool validInput(String userInput){
    if(userInput.contains(RegExp(r'[a-zA-z]')) || !userInput.contains(RegExp(r'^[1-9][0-9]*$'))){
      return false;
    }else{
      return true;
    }
  }

}