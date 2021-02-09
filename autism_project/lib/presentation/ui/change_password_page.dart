import 'package:autism_project/core/helper/validators.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  static final routeName = '/change_password_page';

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController oldPasswordControl = new TextEditingController();
  TextEditingController newPasswordControl = new TextEditingController();
  TextEditingController confPasswordControl = new TextEditingController();

  Validators _validators = new Validators();

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text('Update Password')),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: oldPasswordControl,
                    obscureText: _obscurePassword,
                    keyboardType: TextInputType.text,
                    validator: _validators.passwordValidator,
                    decoration: InputDecoration(
                        labelText: 'Existing Password',
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
                  SizedBox(height: 10),
                  TextFormField(
                    controller: newPasswordControl,
                    obscureText: _obscurePassword,
                    keyboardType: TextInputType.text,
                    validator: _validators.passwordValidator,
                    decoration: InputDecoration(
                        labelText: 'New Password',
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
                  SizedBox(height: 10),
                  TextFormField(
                    controller: confPasswordControl,
                    obscureText: _obscurePassword,
                    keyboardType: TextInputType.text,
                    validator: _validators.passwordValidator,
                    decoration: InputDecoration(
                        labelText: 'Confirm Password',
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
                  SizedBox(height: 10),
                  Center(child: submitButton(context)),
                  SizedBox(height: 10),
                ],
              )),
        ));
  }

  SizedBox submitButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 45,
      child: RaisedButton(
          onPressed: () {},
          color: Colors.pink,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          textColor: Colors.white,
          child: Text('Sign In')),
    );
  }
}
