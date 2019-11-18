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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        AssetTitleWidget(),
                        AssetTrendWidget()
                      ],
                    ),
                    SignUpButton()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AssetPredictionChartWidget(),
                    Container(
                      width: 480,
                      height: 480,
                      child: SingleChildScrollView(
                        child: AssetPredictionCardListViewWidget(),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
