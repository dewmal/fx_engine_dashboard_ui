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
  @override
  Widget build(BuildContext context) {
    return _AssetTrendWidget(
      symbol: widget.symbol,
    );
  }
}

class _AssetTrendWidget extends StatelessWidget {
  final AssetSymbol symbol;

  const _AssetTrendWidget({Key key, this.symbol}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: connectTickStream(getSymbolValue(symbol)).stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
//            print(snapshot.data);
            if (!snapshot.hasData) {
              return Text("Loading...");
            }

            var tick = Tick.fromMappedJson(json.decode(snapshot.data));
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "${tick.ask}",
                  style: Theme.of(context).textTheme.display2.copyWith(
                      fontFamily: numberTextFontFamily,
                      color: defaultTextColor),
                ),
                Text(
                  "05.54 %",
                  style: Theme.of(context)
                      .textTheme
                      .display4
                      .copyWith(fontFamily: numberTextFontFamily),
                )
              ],
            );
          }),
    );
  }
}
