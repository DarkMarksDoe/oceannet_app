import 'package:flutter/material.dart';
import 'package:oceannet/calls/provider/ProviderUser.dart';
import 'package:oceannet/calls/provider/UserAPI.dart';
import 'package:oceannet/models/UserModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogMenu extends StatelessWidget {
  final BuildContext contextoAnterior;
  final UserModel userModel;
  final UserProvider userProvider;

  const DialogMenu(
      {@required this.contextoAnterior,
      @required this.userModel,
      @required this.userProvider,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 50,
      insetAnimationCurve: Curves.easeOutCirc,
      insetAnimationDuration: Duration(seconds: 2),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        height: 120,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              child: Center(
                child: Text('Delete ${userModel.name}'),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _raisedButton('Cancel', context),
                _raisedButton('Delete', context),
              ],
            )
          ],
        ),
      ),
    );
  }

  _raisedButton(String value, BuildContext context) {
    return ButtonTheme(
      minWidth: 70,
      child: RaisedButton(
          elevation: 10,
          color: Colors.white,
          splashColor: Theme.of(contextoAnterior).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () async {
            if (value == 'Delete') {
              Navigator.of(contextoAnterior).pop();
              userProvider.createListUser();
              Map response = await UserApiCall()
                  .makeDeleteRequest(userModel.id.toString());
              if (response['statusCode'] == 202)
                Fluttertoast.showToast(
                  msg: "${userModel.name} was deleted.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
            } else {
              Navigator.pop(context);
            }
          },
          child: Text('$value')),
    );
  }
}
