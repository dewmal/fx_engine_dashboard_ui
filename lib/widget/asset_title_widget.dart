import 'package:flutter/material.dart';

class AssetTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          // Todo - Add Symbol Icon
//          Text("Icon"),
          Text(
            "EUR/USD",
            style: Theme.of(context).textTheme.subtitle,
          )
        ],
      ),
    );
  }
}
