import 'package:flutter/material.dart';
import 'package:work_on/providers/services.dart';

import 'package:provider/provider.dart';
import 'package:work_on/screens/addProfile.dart';
import 'package:work_on/screens/homepage.dart';
import 'package:work_on/screens/requestedServiceScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Services(),
        )
      ],
      child: MaterialApp(
        title: 'WorkON',
        theme: ThemeData(),
        home: HomePage(),
        routes: {
          AddProfile.routname: (ctx) => AddProfile(),
          RequestedServiceScreen.routname: (ctx) => RequestedServiceScreen(),
        },
      ),
    );
  }
}
