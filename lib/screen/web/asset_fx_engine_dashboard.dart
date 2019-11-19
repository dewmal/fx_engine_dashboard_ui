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
    var media = MediaQuery.of(context).size;
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
                    AssetPredictionChartWidget(
                      parentHeight: media.height * 6 / 8,
                      parentWidth: media.width * 24 / 36,
                    ),
                    Container(
                      height: media.height * 6 / 8,
                      width: media.width * 10 / 36,
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
