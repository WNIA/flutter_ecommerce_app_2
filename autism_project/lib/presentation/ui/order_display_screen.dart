import 'package:autism_project/presentation/ui/pending_order_screen.dart';
import 'package:autism_project/presentation/ui/processed_deliveries_screen.dart';
import 'package:autism_project/presentation/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class OrderDisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBarOrderPage(context),
        body: TabBarView(
          children: [
            PendingOrderScreen(),
            ProcessedDeliveryScreen(),
          ],
        ),
      ),
    );
  }
}
