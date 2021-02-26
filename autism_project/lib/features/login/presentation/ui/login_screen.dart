import 'package:autism_project/core/helper/validators.dart';
import 'package:autism_project/features/finished_delivery/presentation/ui/finished_delivery_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
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
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
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
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        email = emailControl.text;
                        pass = passwordControl.text;
                        if (await provider.loadLoginData(email, pass)) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => FinishedDeliveryScreen(),),);
                        } else {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('Please try again :D'),
                              duration: Duration(seconds: 10)));
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          provider.isLoading ? overlayProgressbar() : Container(),
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
