import 'package:autism_project/core/helper/sign_out.dart';
import 'package:autism_project/data/datasources/profile_api_service.dart';
import 'package:autism_project/data/models/login_and_profile_response_model.dart';
import 'package:autism_project/presentation/ui/update_profile_page.dart';
import 'package:autism_project/presentation/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'change_password_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<ProfileAPIService>(context, listen: false)
            .fetchProfileData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? settingsPageItems(context, snapshot.data)
              : settingsPageItems(context, null);
        });
  }

  Scaffold settingsPageItems(
      BuildContext context, LoginAndProfileResponseModel userData) {
    return Scaffold(
      appBar: appBarMain(context, "Settings "),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: userData != null
                    ? Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userData.data.name,
                                style: TextStyle(color: Colors.black54)),
                            Text(userData.data.mobileNumber,
                                style: TextStyle(color: Colors.black54)),
                            Text(userData.data.email,
                                style: TextStyle(color: Colors.black54)),
                          ],
                        ),
                      )
                    : Container(),
              ),
              SizedBox(height: 10),
              Divider(thickness: 1),
              SizedBox(height: 10),
              Text('Account',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(userData)));
                },
                child: Row(
                  children: [
                    Icon(Icons.account_circle_outlined,
                        size: 50, color: Colors.black54),
                    SizedBox(width: 8),
                    Text('Profile', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ChangePasswordPage.routeName);
                },
                child: Row(
                  children: [
                    Icon(Icons.lock_outlined, size: 50, color: Colors.black54),
                    SizedBox(width: 8),
                    Text('Change Password', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  signOut(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 50, color: Colors.black54),
                    SizedBox(width: 8),
                    Text('Logout', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(thickness: 1),
              SizedBox(height: 10),
              Text('Settings',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.help_outline_outlined,
                      size: 50, color: Colors.black54),
                  SizedBox(width: 8),
                  Text('Help', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.policy_outlined, size: 50, color: Colors.black54),
                  SizedBox(width: 8),
                  Text('Policy', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
