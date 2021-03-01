import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/presentation/ui/finished_delivery_screen.dart';
import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/presentation/ui/notice_screen.dart';
import 'package:flutter/material.dart';

AppBar appBarMain(BuildContext context, String titleText) {
  return AppBar(
    title: Text(titleText),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FinishedDeliveryScreen()));
        },
        child: Icon(Icons.credit_card),
      ),
      SizedBox(width: 8),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NoticeScreen()));
        },
        child: Icon(Icons.notifications),
      ),
      SizedBox(width: 10),
    ],
  );
}

AppBar appBarOrderPage(BuildContext context) {
  return AppBar(
    title: Text("Order"),
    actions: [
      GestureDetector(
        onTap: () {

        },
        child: Icon(Icons.credit_card),
      ),
      SizedBox(width: 8),
      GestureDetector(
        onTap: () {

        },
        child: Icon(Icons.notifications),
      ),
      SizedBox(width: 10),
    ],
    bottom: TabBar(
      indicatorColor: Colors.white,
      tabs: [
        Tab(
            child:
            Text("PENDING", style: TextStyle(fontWeight: FontWeight.bold))),
        Tab(
            child: Text("DELIVERY",
                style: TextStyle(fontWeight: FontWeight.bold))),
      ],
    ),
  );
}
