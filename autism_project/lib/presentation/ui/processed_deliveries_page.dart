import 'package:autism_project/core/helper/constants.dart';
import 'package:autism_project/presentation/providers/processed_deliveries_provider.dart';
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
    return FutureBuilder(
        future: context.read<ProcessedDeliveriesProvider>().getProcessedDeliveriesPaginationProvider(1, Constants.myToken),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ProcessedDeliveriesPagination(snapshot.data, 1)
              : Center(child: CircularProgressIndicator());
        });
  }
}
