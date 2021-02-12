import 'package:autism_project/core/helper/shared_preference.dart';
import 'package:autism_project/core/helper/validators.dart';
import 'package:autism_project/data/models/login_request_model.dart';
import 'package:autism_project/presentation/providers/login_and_profile_provider.dart';

import 'initialize_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  final Function toggle;

  SignInScreen(this.toggle);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();

  Validators _validators = new Validators();
  LoginRequestModel _loginRequestModel;

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool isLoading;

  /*
   * TODO: forgotPasswordMethod will navigate to new page
   *  which will implement procedure to change password
   *  @WNIA
   */
  void forgotPasswordMethod() {}

  /*
   * save data in shared preference
   * send request and fetch response from login api
   * @WNIA
   */
  signInMethod() {
    if (_formKey.currentState.validate()) {
      _loginRequestModel.email = emailControl.text;
      _loginRequestModel.password = passwordControl.text;
      setState(() {
        isLoading = true;
      });
      try {
        context.read<LoginAndProfileProvider>().getLoginProvider(_loginRequestModel);
        context.select((LoginAndProfileProvider loginAndProfileProvider) {
          if (loginAndProfileProvider.loginAndProfileResponseEntity != null) {
            //TODO: Simplify saving data in shared preferences - @WNIA
            SharedPrefs.saveUserLoggedInSharedPref(
                loginAndProfileProvider.isLogin);
            SharedPrefs.saveUserJWTSharedPref(
                loginAndProfileProvider.loginAndProfileResponseEntity.jwt);

            Navigator.pushReplacementNamed(context, Initialize.routeName);
          } else {
            setState(() {
              isLoading = false;
            });
            //Show Snackbar for invalid credendials - @WNIA
            _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text('Please enter valid credentials'),
                duration: Duration(seconds: 10)));
          }
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    _loginRequestModel = new LoginRequestModel();
    setState(() {
      isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            loginItems(context),
            isLoading ? overlayProgressbar() : Container(),
          ],
        ));
  }

  loginItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 30),
            child: Image(
              image: AssetImage('assets/images/butterfly1.jpg'),
              height: 100,
              width: 100,
            ),
          ),
          Text('Welcome!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center),
          Text('Sign In',
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          SizedBox(height: 30),
          loginForm(context),
        ],
      ),
    );
  }

  loginForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailControl,
              keyboardType: TextInputType.emailAddress,
              validator: _validators.emailValidator,
              decoration: InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email_outlined),
                  filled: true,
                  // fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: passwordControl,
              obscureText: _obscurePassword,
              keyboardType: TextInputType.text,
              validator: _validators.passwordValidator,
              decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                  // fillColor: Colors.white,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(_obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            Container(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: forgotPasswordMethod,
                    child: Text('Forgot Password?'))),
            Center(child: submitButton(context)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account yet?'),
                FlatButton(
                    /*
                     * toggle function navigates to Sign Up page
                     * @WNIA
                    */
                    onPressed: () {
                      widget.toggle();
                    },
                    child: Text('Register'))
              ],
            )
          ],
        ));
  }

  SizedBox submitButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 45,
      child: RaisedButton(
          onPressed: () {
            signInMethod();
          },
          color: Colors.pink,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          textColor: Colors.white,
          child: Text('Sign In')),
    );
  }

  overlayProgressbar() {
    return Positioned(
        child: Container(child: Center(child: CircularProgressIndicator())));
  }
}
