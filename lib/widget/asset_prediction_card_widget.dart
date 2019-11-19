import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fx_engine_app/model/Solution.dart';
import 'package:fx_engine_app/theme.dart';
import 'package:fx_engine_app/utils.dart';

class AssetPredictionCardWidget extends StatelessWidget {
  final Solution solution;

  const AssetPredictionCardWidget({Key key, this.solution}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardColor = cardBackgroundColor;
    var cardIcon = Icons.trending_up;
    var cardIconColor = bullSignalColor;

    var random = Random().nextInt(100) / 100;

    if (solution.direction == 1 && !solution.inspected) {
      // Todo - replace with buy signal
      cardColor = cardBackgroundColor;
      cardIcon = Icons.trending_up;
      cardIconColor = bullSignalColor;
    } else if (solution.direction == -1 && !solution.inspected) {
      // Todo - replace with sell signal
      cardColor = cardBackgroundColor;
      cardIcon = Icons.trending_down;
      cardIconColor = bearishSignalColor;
    } else if (solution.inspected &&
        solution.direction != solution.true_direction) {
      // Todo - replace with signal failed
      cardColor = cardBackgroundColorFade;
      cardIcon = Icons.cancel;
      cardIconColor = bearishSignalColor.withOpacity(0.6);
    } else if (solution.inspected &&
        solution.direction == solution.true_direction) {
      // Todo - replace with signal correct
      cardColor = cardBackgroundColorFade;
      cardIcon = Icons.check;
      cardIconColor = bullSignalColor.withOpacity(0.6);
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Card(
          elevation: 8.0,
          color: cardColor,
          margin: EdgeInsets.only(
            top: 16.0,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(12),
            leading: Container(
              width: 48,
              height: 48,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(500)),
                  color: cardIconColor),
              child: Center(
                child: Icon(
                  cardIcon,
                  size: 34.0,
                ),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      dateTimeFormatter.format(
                          DateTime.fromMillisecondsSinceEpoch(
                              solution.prediction_point_timestamp * 1000)),
                      style: Theme.of(context).textTheme.body1.copyWith(
                          fontFamily: numberTextFontFamily,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 4.0),
                      child: Text(
                        "5 min to go",
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ),
                  ],
                ),
                Text(
                  "${percentageFormatter.format(solution.confidence)}%",
                  style: Theme.of(context).textTheme.body1.copyWith(
                      fontFamily: numberTextFontFamily,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    getSignalType(solution.direction),
                    style: Theme.of(context).textTheme.display3.copyWith(
                        fontFamily: numberTextFontFamily,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    dateTimeFormatter.format(
                        DateTime.fromMillisecondsSinceEpoch(
                            solution.current_point_timestamp * 1000)),
                    style: Theme.of(context).textTheme.display3.copyWith(
                        fontFamily: numberTextFontFamily,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getSignalType(direction) {
    if (direction == 1) {
      return "BUY";
    } else if (direction == -1) {
      return "SELL";
    }
    return "STAY";
  }
}
