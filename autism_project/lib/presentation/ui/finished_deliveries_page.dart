import 'package:autism_project/core/helper/constants.dart';
import 'package:autism_project/data/datasources/finished_deliveries_remote.dart';
import 'package:autism_project/presentation/widgets/finished_deliveries_pagination.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinishedDeliveriesPage extends StatefulWidget {
  static final routeName = "/deliveries_page";
  @override
  _FinishedDeliveriesPageState createState() => _FinishedDeliveriesPageState();
}

class _FinishedDeliveriesPageState extends State<FinishedDeliveriesPage> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FinishedDeliveriesAPIService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliveries'),
      ),
      body: FutureBuilder(
          future: provider.fetchFinishedDeliveriesPagination(1, Constants.myToken),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? FinishedDeliveriesPagination(snapshot.data, 1)
                : Center(child: CircularProgressIndicator());
          })
    );
  }
}
