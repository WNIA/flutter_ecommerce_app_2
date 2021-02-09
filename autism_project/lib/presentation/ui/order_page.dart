import 'package:autism_project/presentation/ui/pending_order_page.dart';
import 'package:autism_project/presentation/ui/processed_deliveries_page.dart';
import 'package:flutter/material.dart';

import 'finished_deliveries_page.dart';
import 'notice_page.dart';

class OrderDisplayPage extends StatefulWidget {
  static final routeName = '/order_page';

  @override
  _OrderDisplayPageState createState() => _OrderDisplayPageState();
}

class _OrderDisplayPageState extends State<OrderDisplayPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBarOrderPage(context),
        body: TabBarView(
          children: [
            PendingOrderPage(),
            ProcessedDeliveriesPage()
          ],
        ),
      ),
    );
  }
  AppBar appBarOrderPage(BuildContext context) {
    return AppBar(
      title: Text("Order"),
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

}
