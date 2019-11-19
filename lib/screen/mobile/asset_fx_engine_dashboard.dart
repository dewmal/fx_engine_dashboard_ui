import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_engine_app/service/symbol_list.dart';
import 'package:fx_engine_app/widget/asset_prediction_card_list.dart';
import 'package:fx_engine_app/widget/asset_prediction_chart.dart';
import 'package:fx_engine_app/widget/asset_title_widget.dart';
import 'package:fx_engine_app/widget/asset_trend_detail.dart';

class FxEngineAssetDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var symbol = AssetSymbol.EUR_USD;

    return Scaffold(
      appBar: AppBar(
        title: Text("Fx Engine Dashboard"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: FlatButton(
              child: Icon(Icons.person_add),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, viewPortConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: viewPortConstraints.maxHeight,
                  minWidth: viewPortConstraints.maxWidth),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AssetTitleWidget(),
                        AssetTrendWidget(
                          symbol: symbol,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      height: viewPortConstraints.maxHeight * 4 / 6,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Stack(
                          fit: StackFit.expand,
                          alignment: Alignment.topLeft,
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              left: 0,
                              child: AssetPredictionChartWidget(
                                parentHeight:
                                    viewPortConstraints.maxHeight * 4 / 6,
                                parentWidth: viewPortConstraints.maxWidth,
                              ),
                            ),
//                            Positioned(
//                              right: 0,
//                              top: 0,
//                              child: Padding(
//                                padding: const EdgeInsets.only(right: 4.0),
//                                child: AssetTrendWidget(),
//                              ),
//                            )
                          ],
                        ),
                      ),
                    ),
                    AssetPredictionCardListViewWidget(symbol: symbol)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
