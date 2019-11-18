import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_engine_app/screen/web/asset_fx_engine_dashboard.dart' as web;
import 'package:fx_engine_app/screen/mobile/asset_fx_engine_dashboard.dart'
    as mobile;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.redAccent),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String get operatingSystem =>
      String.fromEnvironment("dart.platform.os");

//  static final bool isLinux = (_operatingSystem == "linux");

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    if (media.width < 800) {
      return mobile.FxEngineAssetDashboardScreen();
    } else {
      return web.FxEngineAssetDashboardScreen();
    }
  }
}
