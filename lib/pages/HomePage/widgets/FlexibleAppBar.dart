import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oceannet/calls/provider/ProviderUser.dart';
import 'package:provider/provider.dart';

class FlexibleAppBar extends StatelessWidget {
  final appBarHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context, listen: false);

    return Stack(
      children: [
        Container(
          padding: new EdgeInsets.only(top: appBarHeight / 2),
          child: new Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: new Text(
                          "Total Employees",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Chivo-Light'),
                        ),
                      ),
                      Consumer<UserProvider>(
                        builder: (_, value, __) => Text(
                          "${userProvider.getUsersCount()}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Chivo',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w100,
                            fontSize: 28.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            child: Text(
              '${getDate()}',
              style: TextStyle(
                fontFamily: 'Chivo',
                color: Colors.white,
              ),
            ),
            padding: EdgeInsets.all(10),
          ),
        )
      ],
    );
  }

  String getDate() {
    DateTime now = new DateTime.now();
    var formatter = new DateFormat('DD-MM-yyyy');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
}
