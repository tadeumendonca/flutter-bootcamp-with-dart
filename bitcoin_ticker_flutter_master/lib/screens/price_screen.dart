import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/services/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coin = CoinData();
  String selectedCurrency = 'USD';
  String buttonLabelBTC = '1 BTC = ? USD';
  String buttonLabelETH = '1 ETH = ? USD';
  String buttonLabelLTC = '1 LTC = ? USD';

  @override
  void initState() {
    super.initState();
    updateButtonRate();
  }

  void updateButtonRate() async {
    var buttonValueBTC = await updateCurrencyRate('BTC', selectedCurrency);
    var buttonValueETH = await updateCurrencyRate('ETH', selectedCurrency);
    var buttonValueLTC = await updateCurrencyRate('LTC', selectedCurrency);

    setState(() {
      buttonLabelBTC = buttonValueBTC;
      buttonLabelETH = buttonValueETH;
      buttonLabelLTC = buttonValueLTC;
    });
  }

  Future<String> updateCurrencyRate(
      String originalCurrency, String targetCurrency) async {
    var responseData =
        await coin.getCoinData(originalCurrency, '$selectedCurrency');
    double originalRate = responseData['rate'];
    String returnValue =
        '1 $originalCurrency = ${originalRate.toInt()} $selectedCurrency';
    return returnValue;
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String cur in currenciesList) {
      var newItem = Text(cur);

      pickerItems.add(newItem);
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          updateButtonRate();
        });
      },
      children: pickerItems,
    );
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String cur in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(cur),
        value: cur,
      );

      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          updateButtonRate();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CurrencyCard(buttonLabel: buttonLabelBTC),
              CurrencyCard(buttonLabel: buttonLabelETH),
              CurrencyCard(buttonLabel: buttonLabelLTC),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    Key key,
    @required this.buttonLabel,
  }) : super(key: key);

  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            buttonLabel,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
