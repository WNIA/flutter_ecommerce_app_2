import 'package:autism_project/core/helper/constants.dart';
import 'package:autism_project/data/datasources/processed_deliveries_api_service.dart';
import 'package:autism_project/presentation/widgets/processed_deliveries_pagination.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProcessedDeliveriesPage extends StatefulWidget {
  static final routeName = '/processed_deliveries_page';
  @override
  _ProcessedDeliveriesPageState createState() => _ProcessedDeliveriesPageState();
}

class _ProcessedDeliveriesPageState extends State<ProcessedDeliveriesPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProcessedDeliveriesAPIService>(context, listen: false);
    return FutureBuilder(
        future: provider.fetchProcessedDeliveriesPagination(1, Constants.myToken),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ProcessedDeliveriesPagination(snapshot.data, 1)
              : Center(child: CircularProgressIndicator());
        });
  }
}
