import 'package:flutter/material.dart';

class AssetTrendWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            "1.4895",
            style: Theme.of(context).textTheme.body2,
          ),
          Text(
            "05.54 %",
            style: Theme.of(context).textTheme.display2,
          )
        ],
      ),
    );
  }
}
