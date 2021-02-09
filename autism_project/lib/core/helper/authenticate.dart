import 'package:autism_project/presentation/ui/sign_in_page.dart';
import 'package:autism_project/presentation/ui/sign_up_page.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  static final routeName = '/';
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInScreen(toggleView);
    } else {
      return SignUpScreen(toggleView);
    }
  }
}
