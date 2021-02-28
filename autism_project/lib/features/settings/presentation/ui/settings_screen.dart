import 'package:autism_project/features/home/presentation/widget/appbar_widget.dart';
import 'package:autism_project/features/profile/presentation/ui/profile_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context, "Settings "),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",
                          style: TextStyle(color: Colors.black54)),
                      Text("017XX-XXX-XXX",
                          style: TextStyle(color: Colors.black54)),
                      Text("userData.data.email@email.com",
                          style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                )
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
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
