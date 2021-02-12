import 'package:autism_project/core/helper/constants.dart';
import 'package:autism_project/presentation/providers/pending_order_provider.dart';
import 'package:autism_project/presentation/widgets/pending_order_pagination.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PendingOrderPage extends StatefulWidget {
  static final routeName = '/pending_order_page';

  @override
  _PendingOrderPageState createState() => _PendingOrderPageState();
}

class _PendingOrderPageState extends State<PendingOrderPage> {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: context.read<PendingOrderProvider>().getPendingOrderProvider(1, Constants.myToken),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? PendingOrderPagination(snapshot.data, 1)
            : Center(child: CircularProgressIndicator());
      });
  }
}
