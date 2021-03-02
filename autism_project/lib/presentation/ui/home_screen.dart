import 'package:autism_project/core/helper/constant.dart';
import 'package:autism_project/presentation/provider/login_provider.dart';
import 'package:autism_project/presentation/ui/settings_screen.dart';
import 'package:autism_project/presentation/widgets/appbar_widget.dart';
import 'package:autism_project/presentation/widgets/box_deco.dart';
import 'package:autism_project/presentation/widgets/last_five_sales_chart.dart';
import 'package:autism_project/presentation/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'order_display_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }

  getUserInfo() {
    Provider.of<AuthProvider>(context, listen: false)
        .userToken()
        .then((value) => Constant.token = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    HomeScreenItems(),
    OrderDisplayScreen(),
    SettingsScreen(),
  ];
}

class HomeScreenItems extends StatefulWidget {
  @override
  _HomeScreenItemsState createState() => _HomeScreenItemsState();
}

class _HomeScreenItemsState extends State<HomeScreenItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context, "Home"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(clipBehavior: Clip.none, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 90,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('0', style: orderSummaryTextStyle()),
                      Text('Pending', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.red[900],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('0', style: orderSummaryTextStyle()),
                      Text('Processing', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('0', style: orderSummaryTextStyle()),
                      Text('Delivered', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
                height: 300,
                decoration: boxDeco(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Last Five Sales Chart'),
                      Expanded(child: LastFiveSalesChart()),
                    ],
                  ),
                )),
            SizedBox(height: 12),
          ]),
        ));
  }
}
