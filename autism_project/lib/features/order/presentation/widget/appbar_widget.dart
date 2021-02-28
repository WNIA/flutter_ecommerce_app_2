import 'package:flutter/material.dart';

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
