import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final Function toggle;

  SignUpScreen(this.toggle);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () => widget.toggle(),//go back to
                  ),
                  Text('Sign Up',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Select User Image'),
                          ),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                                'assets/images/placeholder_image.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RaisedButton(
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  child: Text('Capture Image'),
                                  color: Colors.blueGrey,
                                ),
                                RaisedButton(
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  child: Text('Select From Gallery'),
                                  color: Colors.blueGrey,
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        prefixIcon: Icon(Icons.phone_android),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'NID Number',
                        prefixIcon: Icon(Icons.credit_card),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: _obscurePassword,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(height: 10),
                  Center(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: RaisedButton(
                              onPressed: () {
                                widget.toggle();
                              },
                              color: Colors.amber,
                              textColor: Colors.white,
                              child: Text('Submit'))))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
