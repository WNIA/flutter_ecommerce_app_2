import 'package:autism_project/data/models/profile_response_model.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final ProfileResponseModel userData;
  ProfilePage(this.userData);


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: (){
Navigator.pop(context);
                    },//go back to
                  ),
                  Text('Update Profile',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                ],
              ),
            ),
            Form(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Container(
                            height: 70,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: (){

                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.add_a_photo_outlined),
                                      Text('Camera')
                                    ],
                                  ),
                                ),
                                Divider(thickness: 3),
                                GestureDetector(
                                  onTap: (){

                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.add_photo_alternate_outlined),
                                      Text('Gallery')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          duration: Duration(seconds: 5)));
                    },
                    child: Card(
                        elevation: 2,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                              child: Text('Tap to add image'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                    'assets/images/placeholder_image.png'),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: widget.userData.data.name,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    enabled: false,
                    initialValue: widget.userData.data.email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email Address (Cannot Change)',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    enabled: false,
                    initialValue: widget.userData.data.mobileNumber,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Mobile Number (Cannot Change)',
                        prefixIcon: Icon(Icons.phone_android),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: widget.userData.data.nid,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'NID Number',
                        prefixIcon: Icon(Icons.credit_card),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(height: 10),
                  Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 45,
                        child: RaisedButton(
                            onPressed: () {},
                            color: Colors.pink,
                            shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                            textColor: Colors.white,
                            child: Text('Update')),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
