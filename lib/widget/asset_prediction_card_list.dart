import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fx_engine_app/constants.dart';
import 'package:fx_engine_app/model/Solution.dart';
import 'package:fx_engine_app/service/solution_service.dart';
import 'package:fx_engine_app/service/symbol_list.dart';
import 'package:fx_engine_app/theme.dart';
import 'package:fx_engine_app/utils.dart';
import 'package:fx_engine_app/widget/asset_prediction_card_widget.dart';

class AssetPredictionCardListViewWidget extends StatefulWidget {
  final AssetSymbol symbol;

  const AssetPredictionCardListViewWidget({Key key, this.symbol})
      : super(key: key);

  @override
  _AssetPredictionCardListViewWidgetState createState() =>
      _AssetPredictionCardListViewWidgetState();
}

class _AssetPredictionCardListViewWidgetState
    extends State<AssetPredictionCardListViewWidget> {
  List<Solution> solutions;

  @override
  void initState() {
    super.initState();

    fetchSolutions(getSymbolValue(widget.symbol), 100, 9).then((data) {
      setState(() {
        solutions = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _AssetPredictionCardListViewWidget(
      symbol: widget.symbol,
      solutions: solutions,
    );
  }
}

class _AssetPredictionCardListViewWidget extends StatelessWidget {
  final AssetSymbol symbol;
  final List<Solution> solutions;

  const _AssetPredictionCardListViewWidget(
      {Key key, this.symbol, this.solutions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.solutions == null) {
      return Text("loading...");
    }

    return StreamBuilder(
        stream: getSolutionChannel(getSymbolValue(symbol)).stream,
        builder: (context, snapshot) {
          var solutions = [];
          if (snapshot.hasData) {
            for (var data in json.decode(snapshot.data)) {
              var solution = Solution.fromMappedJson(data);
              solutions.add(solution);
            }
          }

          List<Solution> data = [...solutions, ...this.solutions];
          data.sort((Solution b, Solution a) => a.prediction_point_timestamp
              .compareTo(b.prediction_point_timestamp));

          double totalCorrect = 0;
          double totalInspected = 0;
          for (var d in data) {
            if (d.inspected) {
              if (d.direction == d.true_direction) {
                totalCorrect += 1;
              }
              totalInspected += 1;
            }
          }
          var errorRate = totalCorrect * 100 / totalInspected;
          return Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Fx Signals (EUR/USD)",
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "${percentageFormatter.format(errorRate)} %",
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .copyWith(fontFamily: numberTextFontFamily),
                        ),
                        Text(
                          "Correction rate",
                          style: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 8.0, fontFamily: numberTextFontFamily),
                        )
                      ],
                    )
                  ],
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var item = data[index];

                      return AssetPredictionCardWidget(solution: item);
                    })
              ],
            ),
          );
        });
  }
}
