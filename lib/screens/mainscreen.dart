import 'package:bitcoin_calculator/screens/btc_usd.dart';
import 'package:bitcoin_calculator/screens/usd_btc.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget{

  @override 
  _MainScreenState createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => UsdBtc()));
                setState(() { });
              },
              child: Text(
                "USD to BTC",
                key: Key('usd-btc'),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(160, 50),
                primary: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              )
            ),
            
            SizedBox(height: 40),

            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BtcUsd()));
                setState(() { });
              },
              child: Text(
                "BTC to USD",
                key: Key('btc-usd'),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(160, 50),
                primary: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              )
            ),
          ],
        ),
      ),
    );
  }
}