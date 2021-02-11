/*Author: Wasema Nooren Islam (@WNIA)*/

import 'package:autism_project/presentation/ui/home_page.dart';
import 'package:flutter/material.dart';

import 'core/helper/authenticate.dart';
import 'core/helper/shared_preference.dart';
import 'core/utils/route_list.dart';
import 'dependency_injection.dart' as di;

main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  /*
   * check if user is logged in - @WNIA
   */
  getLoggedInState() async {
    await SharedPrefs.getUserLoggedInSharedPref().then((value) {
      setState(() {
        userLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Autism Project Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: Colors.black,
        ),
        debugShowCheckedModeBanner: false,
        home: userLoggedIn != null
            ? (userLoggedIn ? HomePage() : Authenticate())
            : Authenticate(),
        routes: routeList());
  }
}
