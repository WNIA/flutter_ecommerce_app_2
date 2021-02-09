import 'package:autism_project/presentation/ui/finished_deliveries_page.dart';
import 'package:autism_project/presentation/ui/notice_page.dart';
import 'package:flutter/material.dart';

AppBar appBarMain(BuildContext context, String titleText) {
  return AppBar(
    title: Text(titleText),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, FinishedDeliveriesPage.routeName);
        },
        child: Icon(Icons.credit_card),
      ),
      SizedBox(width: 8),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, NoticePage.routeName);
        },
        child: Icon(Icons.notifications),
      ),
      SizedBox(width: 10),
    ],
  );
}

