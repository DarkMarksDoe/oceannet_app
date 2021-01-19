import 'package:flutter/material.dart';

class ExpandedContainer extends StatelessWidget {
  final Widget child;
  const ExpandedContainer({
    Key key,
    @required this.points,
    this.child,
  });

  final int points;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: points,
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: child,
      ),
    );
  }
}
