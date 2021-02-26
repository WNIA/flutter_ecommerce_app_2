import 'package:autism_project/core/helper/constant.dart';
import 'package:autism_project/core/helper/shared_prefs.dart';
import 'package:autism_project/features/home/presentation/ui/home_screen.dart';
import 'package:autism_project/features/login/presentation/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/util/provider_list.dart';
import 'core/util/route_list.dart';
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
  final sharedPrefs = SharedPrefs();

  @override
  Future<void> initState() async {
    // TODO: implement initState
    super.initState();
    await sharedPrefs.getUserLoggedInSharedPref().then((value) {
      setState(() {
        Constant.login = value;
      });
    });
    await sharedPrefs.getUserJWTSharedPref().then((value) {
      setState(() {
        Constant.token = value;
      });
    });
  }

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
        home: Constant.login != null
            ? (Constant.login ? HomeScreen() : LoginScreen())
            : LoginScreen(),
        routes: routeList(),
      ),
    );
  }
}
