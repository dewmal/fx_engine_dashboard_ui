import 'package:flutter/material.dart';
import 'package:fx_engine_app/theme.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AssetPredictionChartWidget extends StatelessWidget {
  final double parentWidth;
  final double parentHeight;

  const AssetPredictionChartWidget(
      {Key key, this.parentWidth, this.parentHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: parentWidth,
        height: parentHeight,
        child: getMultiColorLineChart(false, context));
  }

  SfCartesianChart getMultiColorLineChart(bool isTileView, context) {
    return SfCartesianChart(
      title: ChartTitle(
          text: isTileView ? '' : '18.11 14:45:12',
          textStyle: ChartTextStyle(
              fontFamily: numberTextFontFamily,
              fontSize: Theme.of(context).textTheme.body2.fontSize,
              fontStyle: Theme.of(context).textTheme.body2.fontStyle,
              fontWeight: Theme.of(context).textTheme.body2.fontWeight),
          alignment: ChartAlignment.near),
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          intervalType: DateTimeIntervalType.minutes,
          dateFormat: DateFormat.Hms(),
          majorGridLines: MajorGridLines(width: 0),
          title: AxisTitle(text: 'Time')),
      primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 100,
          interval: 10,
          axisLine: AxisLine(width: 0),
          title: AxisTitle(text: "Confidence"),
          labelFormat: '{value}%',
          majorTickLines: MajorTickLines(size: 0)),
      series: getLineSeries(isTileView),
      trackballBehavior: TrackballBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
          lineType: TrackballLineType.vertical,
          tooltipSettings: InteractiveTooltip(format: '{point.x} : {point.y}')),
    );
  }

  List<SplineSeries<_ChartData, DateTime>> getLineSeries(bool isTileView) {
    final List<_ChartData> chartDataSellSignal = <_ChartData>[
      _ChartData(DateTime(2019, 11, 19, 9, 20, 12), 12,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 22, 12), 54,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 24, 12), 36,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 30, 12), 84,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 34, 12), 52,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 36, 12), 64,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 42, 12), 36,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 44, 12), 12,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 48, 12), 85,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 50, 12), 48,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 52, 12), 36,
          Color.fromRGBO(248, 184, 131, 1)),
    ];

    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(DateTime(2019, 11, 19, 9, 20, 12), 80,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 25, 12), 60,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 28, 12), 45,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 32, 12), 55,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 34, 12), 28,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 36, 12), 64,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 45, 12), 72,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 48, 12), 80,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 50, 12), 80,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 52, 12), 80,
          Color.fromRGBO(248, 184, 131, 1)),
      _ChartData(DateTime(2019, 11, 19, 9, 54, 12), 80,
          Color.fromRGBO(248, 184, 131, 1)),
    ];
    return <SplineSeries<_ChartData, DateTime>>[
      SplineSeries<_ChartData, DateTime>(
          enableTooltip: true,
          animationDuration: 2500,
          dataSource: chartData,
          markerSettings: MarkerSettings(isVisible: true),
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          pointColorMapper: (_ChartData sales, _) => bearishSignalColor,
          width: 1),
      SplineSeries<_ChartData, DateTime>(
          enableTooltip: true,
          animationDuration: 2500,
          markerSettings: MarkerSettings(isVisible: true),
          dataSource: chartDataSellSignal,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          pointColorMapper: (_ChartData sales, _) => bullSignalColor,
          width: 1)
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y, [this.lineColor]);

  final DateTime x;
  final double y;
  final Color lineColor;
}
