import 'package:bitcoin_calculator/utils/convert.dart';
import 'package:test/test.dart';

void main() {
//1usd = 0.000036
//1btc = 27,560.30usd
  group("usdToBtc", () {

    test('1 usd to btc', () {
      var btc = PriceConverter.usdBtcConverter(1);
      expect(btc, 0.000036);
    });
    test('4 usd to btc', () {
      var btc = PriceConverter.usdBtcConverter(4);
      expect(btc, 0.000144);
    });
    test('0 usd to btc', () {
      expect(() => PriceConverter.usdBtcConverter(0), throwsArgumentError);
    });
    test('-tive usd to btc', () {
      expect(() => PriceConverter.usdBtcConverter(-1), throwsArgumentError);
    });

  });


  group('btcToUsd', () {
    test('1 btc to usd', () {
      var usd = PriceConverter.btcUsdConverter(1);
      expect(usd, 27560.30);
    });
    test('4 btc to usd', (){
      var usd = PriceConverter.btcUsdConverter(4);
      expect(usd, 110241.2);
    });
    test('0 btc to usd', (){
      expect(() => PriceConverter.btcUsdConverter(0), throwsArgumentError);
    });
    test('-tive btc to usd', (){
      expect(() => PriceConverter.btcUsdConverter(-1), throwsArgumentError);
    });

  });


  group('validInput', () {

    test('1 input should be false', () {
      bool input = PriceConverter.validInput("1");
      expect(input, isTrue);
    });    
    test('0 input should be false', () {
      bool input = PriceConverter.validInput("0");
      expect(input, isFalse);
    });

    test('-1 input should be false', () {
      bool input = PriceConverter.validInput("-1");
      expect(input, isFalse);
    });

    test('h input should be false', () {
      bool input = PriceConverter.validInput("h");
      expect(input, isFalse);
    });

  });

}


