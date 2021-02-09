import 'package:autism_project/core/helper/constants.dart';
import 'package:autism_project/core/helper/shared_preference.dart';
import 'package:autism_project/presentation/ui/settings_page.dart';
import 'package:autism_project/presentation/widgets/home_page_items.dart';
import 'package:flutter/material.dart';

import 'order_page.dart';

class HomePage extends StatefulWidget {
  static final routeName = '/home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  /*Saving token in constant variable*/
  getUserInfo() async {
    await SharedPrefs.getUserJWTSharedPref().then((value){
      Constants.myToken = value;
    });
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
   List<Widget> _widgetOptions = <Widget>[
    HomePageItems(),
    OrderDisplayPage(),
    SettingsPage(),
  ];
}
