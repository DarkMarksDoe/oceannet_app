import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oceannet/calls/provider/ProviderUser.dart';
import 'package:oceannet/models/UserModel.dart';
import 'package:oceannet/pages/UserPage/widgets/ExpandedContainer.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  final UserModel userModel;
  const UserPage({
    @required this.userModel,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel newUser = userModel;

    Widget _buildName(String _name, String labelName, initialValue) {
      return TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: labelName,
        ),
        onChanged: (String value) {
          _name = value;
          switch (labelName) {
            case 'Name':
              newUser.name = value;
              break;
            case 'Lastname':
              newUser.lastname = value;
              break;
            case 'Genre':
              newUser.genre = value;
              break;
            case 'Profile picture':
              newUser.urlProfilePicture = value;
              break;
          }
        },
        initialValue: initialValue,
      );
    }

    _showMaterialDialog(BuildContext context, UserProvider userProvider) {
      showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("Editing ${userModel.name}"),
          content: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                _buildName('', 'Name', userModel.name),
                _buildName('', 'Lastname', userModel.lastname),
                _buildName('', 'Genre', userModel.genre),
                _buildName('', 'Profile picture', userModel.urlProfilePicture),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Save user'),
              onPressed: () async {
                userProvider.newUser = newUser;
                userProvider.updateUser();
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    }

    return Consumer<UserProvider>(builder: (_, userProvider, __) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '${userProvider.userModel.name} ${userProvider.userModel.lastname}',
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 1),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _showMaterialDialog(context, userProvider);
              },
              icon: Icon(Icons.edit_sharp),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              height: 120,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        ExpandedContainer(
                          points: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: 'assets/loader.gif',
                              image: userProvider.userModel.urlProfilePicture,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              ExpandedContainer(
                                points: 1,
                                child: Container(
                                  constraints: BoxConstraints.expand(),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.data_usage_rounded,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '${userProvider.userModel.name}',
                                        style: TextStyle(
                                          fontFamily: 'Chivo',
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ExpandedContainer(
                                points: 1,
                                child: Container(
                                  constraints: BoxConstraints.expand(),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.graphic_eq_outlined,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '${userProvider.userModel.genre[0].toUpperCase()}${userProvider.userModel.genre.substring(1)}',
                                        style: TextStyle(
                                          fontFamily: 'Chivo',
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ExpandedContainer(
                                points: 1,
                                child: Container(
                                  constraints: BoxConstraints.expand(),
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '${userProvider.userModel.latitude}, ${userProvider.userModel.longitude}',
                                        style: TextStyle(
                                          fontFamily: 'Chivo',
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.centerLeft,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '${userProvider.userModel.bornDate}',
                      style: TextStyle(
                        fontFamily: 'Chivo',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.centerLeft,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.schedule,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '${_getFormatDate(userProvider.userModel.createdAt)}',
                      style: TextStyle(
                        fontFamily: 'Chivo',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.centerLeft,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.update,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '${_getFormatDate(userProvider.userModel.updatedAt)}',
                      style: TextStyle(
                        fontFamily: 'Chivo',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  String _getFormatDate(String timestap) {
    DateTime date = DateTime.parse(timestap);
    DateFormat dateFormat = DateFormat('MM/dd/yyyy, hh:mm a');
    return dateFormat.format(date);
  }
}
