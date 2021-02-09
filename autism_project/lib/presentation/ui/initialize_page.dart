import 'package:autism_project/core/helper/shared_preference.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Initialize extends StatefulWidget {
  static final routeName = '/initialize_pages';

  @override
  _InitializeState createState() => _InitializeState();
}

class _InitializeState extends State<Initialize> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // future: Future.delayed(const Duration(seconds: 7), () => Provider.of<PendingOrderAPIService>(context, listen: false).fetchPendingOrderPagination(1)),//5 sec delay to counter server error - @WNIA
        future: Future.delayed(
            Duration(seconds: 7), () => SharedPrefs.getUserJWTSharedPref()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? HomePage()
              : Scaffold(
                  body: Center(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.lightBlue[50],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 1)
                              ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Initializing..."),
                              CircularProgressIndicator(),
                            ],
                          ))));
        });
  }
}
