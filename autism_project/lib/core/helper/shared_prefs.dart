import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefs {
  String sharedPrefUserLoggedInKey = "ISLOGGEDIN";
  String sharedPrefUserJWTKey = "USERJWTKEY";

  //TODO: catch all data from login api - @WNIA

  /*
   * Saving data retrieved from login api to shared preferences
   */
  Future<bool> saveUserLoggedInSharedPref(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPrefUserLoggedInKey, isUserLoggedIn);
  }

  Future<bool> saveUserJWTSharedPref(String userJWT) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPrefUserJWTKey, userJWT);
  }

  /*
   * Getting data from shared preferences
   */
  Future<bool> getUserLoggedInSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sharedPrefUserLoggedInKey);
  }

  Future<String> getUserJWTSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPrefUserJWTKey);
  }
}
