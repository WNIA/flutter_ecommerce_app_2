import 'package:autism_project/core/helper/constants.dart';
import 'package:autism_project/data/datasources/pending_order_remote.dart';
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
    final provider = Provider.of<PendingOrderAPIService>(context, listen: false);
    return FutureBuilder(
      future: provider.fetchPendingOrderPagination(1, Constants.myToken),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? PendingOrderPagination(snapshot.data, 1)
            : Center(child: CircularProgressIndicator());
      });
  }
}
