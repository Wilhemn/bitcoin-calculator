// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {

  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  
  //Give I am on the conversion selection screen
  //When I tap USD to BTC
  //and I enter 5
  //and I tap convert
  //Then I should see "0.00018"

  //Give I am on the conversion selection screen
  //When I tap BTC to USD
  //and I enter 5
  //and I tap convert
  //Then I should see "137801.5"

  group('Happy Paths', () {
    test('should convert usd to btc', () async {

      final usdBtc = find.byValueKey('usd-btc');
      final input = find.byValueKey('usdInput');
      final convert = find.byValueKey('convert1');
      final btc = find.byValueKey('BTC');
      final back1 = find.byValueKey('back1');

      expect(await driver.getText(usdBtc), "USD to BTC");

      await driver.tap(usdBtc);

      expect(await driver.getText(convert), "Convert");

      await driver.tap(input);
      await driver.enterText('5');
      expect(await driver.getText(input), "5");   

      await driver.tap(convert);

      expect(await driver.getText(btc), "0.00018 BTC");   

      await driver.tap(back1);

      expect(await driver.getText(usdBtc), "USD to BTC");

    });

    test('should convert btc to usd', () async {

      final btcUsd = find.byValueKey('btc-usd');
      final input = find.byValueKey('btcInput');
      final convert = find.byValueKey('convert2');
      final usd = find.byValueKey('USD');
      final back2 = find.byValueKey('back2');

      expect(await driver.getText(btcUsd), "BTC to USD");

      await driver.tap(btcUsd);

      expect(await driver.getText(convert), "Convert");

      await driver.tap(input);
      await driver.enterText('5');
      expect(await driver.getText(input), "5");   

      await driver.tap(convert);

      expect(await driver.getText(usd), "137801.5 USD");   

      await driver.tap(back2);

      expect(await driver.getText(btcUsd), "BTC to USD");

    });    
  });


  group('Sad Paths', () {
    test('input 0 on usd to btc should give error', () async {
      final usdBtc = find.byValueKey('usd-btc');
      final input = find.byValueKey('usdInput');
      final convert = find.byValueKey('convert1');
      final invalid1 = find.byValueKey('invalid1');

      expect(await driver.getText(usdBtc), "USD to BTC");
      await driver.tap(usdBtc);

      expect(await driver.getText(convert), "Convert");     
      await driver.tap(input);
      await driver.enterText('0');
      expect(await driver.getText(invalid1), "Invalid input");  

    });

    test('input h on usd to btc should give error', () async {
      final input = find.byValueKey('usdInput');
      final convert = find.byValueKey('convert1');
      final invalid1 = find.byValueKey('invalid1');

      expect(await driver.getText(convert), "Convert");     
      await driver.tap(input);
      await driver.enterText('h');
      expect(await driver.getText(invalid1), "Invalid input");              
    });

    test('input -1 on usd to btc should give error', () async {
      final usdBtc = find.byValueKey('usd-btc');
      final input = find.byValueKey('usdInput');
      final convert = find.byValueKey('convert1');
      final invalid1 = find.byValueKey('invalid1');
      final back1 = find.byValueKey('back1');

      expect(await driver.getText(convert), "Convert");     
      await driver.tap(input);
      await driver.enterText('-1');
      expect(await driver.getText(invalid1), "Invalid input");      

      await driver.tap(back1);
      expect(await driver.getText(usdBtc), "USD to BTC");  
    });

    test('input 0 on btc to usd should give error', () async {

      final btcUsd = find.byValueKey('btc-usd');
      final input = find.byValueKey('btcInput');
      final convert = find.byValueKey('convert2');
      final invalid2 = find.byValueKey('invalid2');
      
      expect(await driver.getText(btcUsd), "BTC to USD");

      await driver.tap(btcUsd);

      expect(await driver.getText(convert), "Convert");

      await driver.tap(input);
      await driver.enterText('0');
      expect(await driver.getText(input), "0");   

      expect(await driver.getText(invalid2), "Invalid input");

    });

    test('input h on btc to usd should give error', () async {

      final input = find.byValueKey('btcInput');
      final convert = find.byValueKey('convert2');
      final invalid2 = find.byValueKey('invalid2');

      expect(await driver.getText(convert), "Convert");

      await driver.tap(input);
      await driver.enterText('h');
      expect(await driver.getText(input), "h");   

      expect(await driver.getText(invalid2), "Invalid input");

    });

    test('input -1 on btc to usd should give error', () async {

      final btcUsd = find.byValueKey('btc-usd');
      final input = find.byValueKey('btcInput');
      final convert = find.byValueKey('convert2');
      final invalid2 = find.byValueKey('invalid2');
      final back2 = find.byValueKey('back2');

      expect(await driver.getText(convert), "Convert");

      await driver.tap(input);
      await driver.enterText('-1');
      expect(await driver.getText(input), "-1");   

      expect(await driver.getText(invalid2), "Invalid input");      

      await driver.tap(back2);

      expect(await driver.getText(btcUsd), "BTC to USD"); 

    });             
  });

  group('back buttons', (){
    test('back button from usd to btc', () async{
      final usdBtc = find.byValueKey('usd-btc');
      final input = find.byValueKey('usdInput');
      final convert = find.byValueKey('convert1');
      final btc = find.byValueKey('BTC');
      final back1 = find.byValueKey('back1');

      expect(await driver.getText(usdBtc), "USD to BTC");

      await driver.tap(usdBtc);

      expect(await driver.getText(convert), "Convert");

      await driver.tap(input);
      await driver.enterText('5');
      expect(await driver.getText(input), "5");   

      await driver.tap(convert);

      expect(await driver.getText(btc), "0.00018 BTC");   

      await driver.tap(back1);

      expect(await driver.getText(usdBtc), "USD to BTC");
    });

    test('back button from btc to usd', () async{
      final btcUsd = find.byValueKey('btc-usd');
      final input = find.byValueKey('btcInput');
      final convert = find.byValueKey('convert2');
      final usd = find.byValueKey('USD');
      final back2 = find.byValueKey('back2');

      expect(await driver.getText(btcUsd), "BTC to USD");

      await driver.tap(btcUsd);

      expect(await driver.getText(convert), "Convert");

      await driver.tap(input);
      await driver.enterText('5');
      expect(await driver.getText(input), "5");   

      await driver.tap(convert);

      expect(await driver.getText(usd), "137801.5 USD");   

      await driver.tap(back2);

      expect(await driver.getText(btcUsd), "BTC to USD");
    });
  });  
}
