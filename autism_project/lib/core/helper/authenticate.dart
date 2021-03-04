import 'package:autism_project/features/home/presentation/ui/home_screen.dart';
import 'package:autism_project/features/login/presentation/provider/login_provider.dart';
import 'package:autism_project/features/login/presentation/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool userLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInState();
  }


  getUserLoggedInState() {
    Provider.of<LoginProvider>(context, listen: false)
        .loginState()
        .then((value) {
      setState(() {
        if(value != null){
          userLoggedIn = value;
        }else{
          userLoggedIn = false;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return userLoggedIn != null ? (userLoggedIn ? HomeScreen() : LoginScreen()) : LoginScreen();
  }
}
