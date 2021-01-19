import 'package:flutter/material.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: <Widget>[
            Text(
              "Oceannet  ",
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
                letterSpacing: 1,
              ),
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
