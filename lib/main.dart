import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_engine_app/screen/web/asset_fx_engine_dashboard.dart' as web;
import 'package:fx_engine_app/screen/mobile/asset_fx_engine_dashboard.dart'
    as mobile;
import 'package:fx_engine_app/theme.dart';
import 'package:syncfusion_flutter_core/core.dart';

import 'constants.dart';

void main() {
  SyncfusionLicense.registerLicense(SYNCFU_CHART_LICENCE);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      themeMode: ThemeMode.dark,
      darkTheme: defaultTheme.copyWith(brightness: Brightness.dark),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
//    var media = MediaQuery.of(context).size;
//    if (media.width < 800) {
    return mobile.FxEngineAssetDashboardScreen();
//    } else {
//      return web.FxEngineAssetDashboardScreen();
//    }
  }
}
