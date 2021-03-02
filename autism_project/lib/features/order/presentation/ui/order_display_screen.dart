import 'package:autism_project/features/order/presentation/widget/appbar_widget.dart';
import 'package:autism_project/features/pending_order/presentation/ui/pending_order_screen.dart';
import 'package:autism_project/features/processed_delivery/presentation/ui/processed_deliveries_screen.dart';
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
