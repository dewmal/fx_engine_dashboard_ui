import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_engine_app/widget/asset_prediction_card_list.dart';
import 'package:fx_engine_app/widget/asset_prediction_chart.dart';
import 'package:fx_engine_app/widget/asset_title_widget.dart';
import 'package:fx_engine_app/widget/asset_trend_detail.dart';
import 'package:fx_engine_app/widget/signup_button.dart';

class FxEngineAssetDashboardScreen extends StatefulWidget {
  @override
  _FxEngineAssetDashboardScreenState createState() =>
      _FxEngineAssetDashboardScreenState();
}

class _FxEngineAssetDashboardScreenState
    extends State<FxEngineAssetDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fx Engine Dashboard"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[AssetTitleWidget(), SignUpButton()],
              ),
              SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      AssetPredictionChartWidget(),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: AssetTrendWidget(),
                      )
                    ],
                  ),
                ),
              ),
              AssetPredictionCardListViewWidget()
            ],
          ),
        ),
      ),
    );
  }
}
