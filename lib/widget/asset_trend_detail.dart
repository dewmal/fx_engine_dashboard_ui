import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fx_engine_app/model/Tick.dart';
import 'package:fx_engine_app/service/candle_service.dart';
import 'package:fx_engine_app/service/symbol_list.dart';
import 'package:fx_engine_app/theme.dart';

class AssetTrendWidget extends StatefulWidget {
  final AssetSymbol symbol;

  const AssetTrendWidget({Key key, this.symbol}) : super(key: key);

  @override
  _AssetTrendWidgetState createState() => _AssetTrendWidgetState();
}

class _AssetTrendWidgetState extends State<AssetTrendWidget> {
  Stream _tickStream;

  Tick currentTick;

  @override
  Widget build(BuildContext context) {
    return _AssetTrendWidget(
      tick: currentTick,
    );
  }

  @override
  void initState() {
    super.initState();
    _tickStream = connectTickStream(getSymbolValue(widget.symbol)).stream;

    _tickStream.listen((data) {
      setState(() {
        currentTick = Tick.fromMappedJson(json.decode(data));
      });
    }, onError: (error) {
      print(error);
    }, onDone: () {
      print("Done");
    });
  }
}

class _AssetTrendWidget extends StatelessWidget {
  final Tick tick;

  const _AssetTrendWidget({Key key, this.tick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (tick == null) {
      return Text("Loading..");
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            "${tick.ask}",
            style: Theme.of(context).textTheme.display2.copyWith(
                fontFamily: numberTextFontFamily, color: defaultTextColor),
          ),
          Text(
            "05.54 %",
            style: Theme.of(context)
                .textTheme
                .display4
                .copyWith(fontFamily: numberTextFontFamily),
          )
        ],
      ),
    );
  }
}
