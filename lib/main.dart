import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'menu_dashboard_widget.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarColor: Colors.red, systemNavigationBarColor: Colors.white
      ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: MenuDashboard(),
    );
  }
}
