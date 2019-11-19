import 'package:flutter/material.dart';
import 'package:fx_engine_app/theme.dart';

class AssetTrendWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            "1.4895",
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
