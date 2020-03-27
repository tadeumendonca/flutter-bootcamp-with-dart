import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bitcoin_ticker/utilities/exceptions.dart';
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
const coinApiBaseUrl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future _makeRequest(String url) async {
    Map<String, String> headers = {'X-CoinAPI-Key': apiKey};

    http.Response responseData = await http.get(url, headers: headers);
    return responseData;
  }

  Future<dynamic> getCoinData(
      String originalCurrency, String targetCurrency) async {
    var url = '$coinApiBaseUrl/$originalCurrency/$targetCurrency';
    var responseData = await _makeRequest(url);
    var data = jsonDecode(responseData.body);
    if (responseData.statusCode != 200) {
      throw ApiException(msg: 'API Error', data: data.toString());
    }
    return data;
  }
}
