import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: <Widget>[
            Text(
              "OceanNet  ",
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                  letterSpacing: 1),
            ),
            Text(
              'Workers',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 1),
            ),
          ],
        ),
      ),
    );
  }
}
