import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oceannet/pages/HomePage/HomePage.dart';
import 'package:provider/provider.dart';

import 'calls/provider/ProviderUser.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()..createListUser()),
      ],
      child: MaterialApp(
          title: 'OceanNet App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primaryColor: Color(0xFF2666BF)),
          home: HomePage()),
    );
  }
}
