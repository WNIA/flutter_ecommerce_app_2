import 'package:autism_project/core/helper/validators.dart';
import 'package:autism_project/features/home/presentation/ui/home_screen.dart';
import 'package:autism_project/features/login/presentation/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();

  String email;
  String pass;
  Validators _validators = new Validators();

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool isLoading = false;

  signInMethod() {
    if (_formKey.currentState.validate()) {
      email = emailControl.text;
      pass = passwordControl.text;
      setState(() {
        isLoading = true;
      });
      try {
        Provider.of<LoginProvider>(context, listen: false)
            .callLoginRepository(email, pass)
            .then((_response) {
          if (_response) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
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
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center),
                SizedBox(height: 30),
                Form(
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
                              onPressed: () {},
                              child: Text('Forgot Password?'))),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 45,
                          child: RaisedButton(
                              onPressed: () {
                                signInMethod();
                              },
                              color: Colors.pink,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              textColor: Colors.white,
                              child: Text('Sign In')),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account yet?'),
                          FlatButton(onPressed: () {}, child: Text('Register'))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          isLoading ? overlayProgressbar() : Container(),
        ],
      ),
    );
  }

  overlayProgressbar() {
    return Positioned(
      child: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
