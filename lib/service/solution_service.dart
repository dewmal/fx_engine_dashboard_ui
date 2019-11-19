import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fx_engine_app/model/Solution.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../constants.dart';

Future<http.Response> fetchSolutionsJson(symbol, limit, status) {
  var url = '$API_BASE_URL/solutions/$symbol/$limit/$status';
//  print(url);
  return http.get(url);
}

Future<String> parseJsonFromAssets(String assetsPath) {
  return rootBundle.loadString(assetsPath);
}

Future<List<Solution>> fetchSolutionsDummyData() async {
  String data = await parseJsonFromAssets("assets/temp_data/solutions.json");
  List responseJson = json.decode(data);
//  print(responseJson.length);
  return responseJson.map((m) => new Solution.fromMappedJson(m)).toList();
}

Future<List<Solution>> fetchSolutions(symbol, limit, status) async {
  var response = await fetchSolutionsJson(symbol, limit, status);
  if (response.statusCode == 200) {
    List responseJson = json.decode(response.body);
//    print(responseJson.length);
    return responseJson.map((m) => new Solution.fromMappedJson(m)).toList();
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

WebSocketChannel getSolutionChannel(symbol) {
  return IOWebSocketChannel.connect('$API_WS_BASE_URL/solutions/$symbol');
}
