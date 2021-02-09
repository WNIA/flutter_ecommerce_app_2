import 'package:autism_project/core/helper/shared_preference.dart';
import 'package:flutter/material.dart';

import 'authenticate.dart';
import 'constants.dart';

signOut(BuildContext context){
  SharedPrefs.saveUserJWTSharedPref("");
  SharedPrefs.saveUserLoggedInSharedPref(false);
  Constants.myToken = "";
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Authenticate()));
}