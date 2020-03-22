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
const coinApiBaseUrl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future _makeRequest(url) async {
    Map<String, String> headers = {'X-CoinAPI-Key': apiKey};

    http.Response responseData = await http.get(url, headers: headers);
    if (responseData.statusCode == 200) {
      String data = responseData.body;
      return jsonDecode(data);
    } else {
      print(responseData.statusCode);
    }
  }

  Future<dynamic> getCoinData(
      String originalCurrency, String targetCurrency) async {
    var url = '$coinApiBaseUrl/$originalCurrency/$targetCurrency';
    var coinData = await _makeRequest(url);
    return coinData;
  }
}
