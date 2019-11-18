import 'package:flutter/material.dart';

class AssetTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[Text("Icon"), Text("EUR/USD")],
      ),
    );
  }
}
