import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'E695634A-980A-4ABB-B8AB-1938593C67CC';
//const apiKey = 'TESTE';
const coinApiBaseUrl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future _makeRequest(String url, BuildContext context) async {
    Map<String, String> headers = {'X-CoinAPI-Key': apiKey};

    http.Response responseData = await http.get(url, headers: headers);
    if (responseData.statusCode == 200) {
      String data = responseData.body;
      return jsonDecode(data);
    } else {
      _showDialog(
          context, 'Get Coin Data', 'Erro API - ${responseData.statusCode}.');
    }
  }

  Future<dynamic> getCoinData(String originalCurrency, String targetCurrency,
      BuildContext context) async {
    var url = '$coinApiBaseUrl/$originalCurrency/$targetCurrency';
    var coinData = await _makeRequest(url, context);
    return coinData;
  }

  void _showDialog(BuildContext context, String title, String message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
