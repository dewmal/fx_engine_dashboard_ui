import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fx_engine_app/constants.dart';
import 'package:fx_engine_app/model/Candle.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

Future<http.Response> fetchCandleJsonList(symbol, limit) {
  var url = '$API_BASE_URL/candle/$symbol/$limit';
  print(url);
  return http.get(url);
}

Future<String> parseJsonFromAssets(String assetsPath) {
  return rootBundle.loadString(assetsPath);
}

//Future<List<Decision>> fetchDummyData() async {
//  String data =
//      await parseJsonFromAssets("assets/temp_data/decisions.json");
//  List responseJson = json.decode(data);
//  print(responseJson.length);
//  return responseJson.map((m) => new Decision.fromMappedJson(m)).toList();
//}

Future<List<Candle>> fetchCandles(symbol, limit) async {
  var response = await fetchCandleJsonList(symbol, limit);
  if (response.statusCode == 200) {
    List responseJson = json.decode(response.body);
    print(responseJson.length);
    return responseJson.map((m) => new Candle.fromMappedJson(m)).toList();
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

WebSocketChannel connectTickStream(symbol) {
  return IOWebSocketChannel.connect(
      '$API_WS_BASE_URL/tick/$symbol/TickSpotData');
}

WebSocketChannel connectCandleStream(symbol) {
  return IOWebSocketChannel.connect('$API_WS_BASE_URL/tick/$symbol/CandleData');
}
