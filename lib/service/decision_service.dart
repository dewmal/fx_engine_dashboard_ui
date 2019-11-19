import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fx_engine_app/models/Decision.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/html.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../constants.dart';

Future<http.Response> fetchDecisionsJson(symbol, interval, limit, status) {
  var url = '$API_BASE_URL/decisions/$symbol/$interval/$limit/$status/';
//  print(url);
  return http.get(url);
}

Future<String> parseJsonFromAssets(String assetsPath) {
  return rootBundle.loadString(assetsPath);
}

Future<List<Decision>> fetchDummyData() async {
  String data = await parseJsonFromAssets("assets/temp_data/decisions.json");
  List responseJson = json.decode(data);
  print(responseJson.length);
  return responseJson.map((m) => new Decision.fromMappedJson(m)).toList();
}

Future<List<Decision>> fetchDecisions(symbol, interval, limit, status) async {
  var response = await fetchDecisionsJson(symbol, interval, limit, status);
  if (response.statusCode == 200) {
    List responseJson = json.decode(response.body);
    print(responseJson.length);
    return responseJson.map((m) => new Decision.fromMappedJson(m)).toList();
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

WebSocketChannel getDecisionChannel(symbol, interval) {
  return HtmlWebSocketChannel.connect(
      '$API_WS_BASE_URL/signal/$symbol/$interval/');
}
