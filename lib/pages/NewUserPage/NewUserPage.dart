import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:oceannet/calls/provider/ProviderUser.dart';
import 'package:oceannet/calls/provider/UserAPI.dart';
import 'package:oceannet/models/UserModel.dart';

class NewUserPage extends StatefulWidget {
  final UserProvider userProvider;

  const NewUserPage({@required this.userProvider, Key key}) : super(key: key);

  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  String dropdownValue;
  DateTime selectedDate;
  Position myPosition;
  String position;

  String name;
  String lastName;
  String urlProfilePicture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('New user form'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: TextField(
              onChanged: (newName) {
                name = newName;
              },
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_sharp),
            title: TextField(
              onChanged: (newLastName) {
                lastName = newLastName;
              },
              decoration: InputDecoration(
                hintText: "Last name",
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.label),
            title: _dropDownButton(),
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.today),
              title: Text('Birthday'),
              subtitle: Text("${selectedDate.toLocal()}".split(' ')[0]),
            ),
            onTap: () async {
              _selectDate(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.image_outlined),
            title: TextField(
              onChanged: (newUrlProfilePic) {
                urlProfilePicture = newUrlProfilePic;
              },
              decoration: InputDecoration(
                hintText: "Pic Url",
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_pin),
            title: Text(position),
            subtitle: Text('This is your device location'),
          ),
          RaisedButton(
            onPressed: () async {
              UserModel newUser = new UserModel(
                name: name,
                lastname: lastName,
                genre: dropdownValue,
                bornDate: "${selectedDate.toLocal()}".split(' ')[0],
                urlProfilePicture: urlProfilePicture,
                latitude: myPosition.latitude.toString(),
                longitude: myPosition.longitude.toString(),
              );
              Map response = await UserApiCall().postUser(newUser);
              if (response['statusCode'] == 201) {
                widget.userProvider.createListUser();
                Navigator.pop(context);
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: Text('Something went wrong :c'),
                      );
                    });
              }
            },
            child: Text('Save User'),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    dropdownValue = 'male';
    selectedDate = DateTime.now();
    position = 'Searching...';
    _getPosition();
    super.initState();
  }

  Widget _dropDownButton() {
    return DropdownButton<String>(
      value: dropdownValue,
      isExpanded: true,
      iconSize: 24,
      elevation: 16,
      underline: Container(
        height: 1,
        color: Colors.black38,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['male', 'female']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void _getPosition() async {
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      myPosition = currentPosition;
      position =
          'Lat: ${myPosition.latitude.toString()}, Long: ${myPosition.longitude.toString()}';
    });
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
