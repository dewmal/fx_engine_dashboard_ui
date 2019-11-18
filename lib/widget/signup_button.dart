import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.person),
            Text(
              "Sign up",
              style: Theme.of(context).textTheme.button.copyWith(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
