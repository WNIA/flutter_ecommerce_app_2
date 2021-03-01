import 'package:autism_project/presentation/ui/home_screen.dart';
import 'package:autism_project/util/provider_list.dart';
import 'package:autism_project/util/route_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dependency_injection.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providerList(),
      child: MaterialApp(
        title: 'Autism Project Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: Colors.black,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: routeList(),
      ),
    );
  }
}
