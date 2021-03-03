import 'package:autism_project/core/helper/constant.dart';
import 'package:autism_project/features/home/presentation/widget/home_screen_items.dart';
import 'package:autism_project/features/login/presentation/provider/login_provider.dart';
import 'package:autism_project/features/order/presentation/ui/order_display_screen.dart';
import 'package:autism_project/features/settings/presentation/ui/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    getUserToken();
  }
  getUserToken(){
    Provider.of<LoginProvider>(context, listen: false).userToken().then((value) => Constant.token = value);
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
    HomeScreenItems(),
    OrderDisplayScreen(),
    SettingsScreen(),
  ];
}

