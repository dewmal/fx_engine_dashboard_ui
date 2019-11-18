import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fx_engine_app/theme.dart';

class AssetPredictionCardListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    "58.00 %",
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
              itemCount: 50,
              itemBuilder: (context, index) {
                var cardColor = cardBackgroundColor;
                var cardIcon = Icons.trending_up;
                var cardIconColor = bullSignalColor;

                var random = Random().nextInt(100) / 100;

                if (random > .8) {
                  // Todo - replace with buy signal
                  cardColor = cardBackgroundColor;
                  cardIcon = Icons.trending_up;
                  cardIconColor = bullSignalColor;
                } else if (random > 0.6) {
                  // Todo - replace with sell signal
                  cardColor = cardBackgroundColor;
                  cardIcon = Icons.trending_down;
                  cardIconColor = bearishSignalColor;
                } else if (random > 0.4) {
                  // Todo - replace with signal failed
                  cardColor = cardBackgroundColorFade;
                  cardIcon = Icons.cancel;
                  cardIconColor = bearishSignalColor.withOpacity(0.6);
                } else if (random > 0.0) {
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
                                  "12.14 15:45",
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontFamily: numberTextFontFamily,
                                          fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.0, bottom: 4.0),
                                  child: Text(
                                    "5 min to go",
                                    style: Theme.of(context).textTheme.body2,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "47.85 %",
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
                                "SELL",
                                style: Theme.of(context)
                                    .textTheme
                                    .display3
                                    .copyWith(
                                        fontFamily: numberTextFontFamily,
                                        fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "11.20 18:30",
                                style: Theme.of(context)
                                    .textTheme
                                    .display3
                                    .copyWith(
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
              })
        ],
      ),
    );
  }
}
