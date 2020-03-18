import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper({this.url});

  Future<String> getData() async {
    http.Response responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      String data = responseData.body;
      print(data);
    } else {
      print(responseData.statusCode);
    }
  }
}
