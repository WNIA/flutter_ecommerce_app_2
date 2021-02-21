import 'package:autism_project/core/helper/constant.dart';
import 'package:autism_project/features/finished_delivery/presentation/provider/finished_delivery_provider.dart';
import 'package:autism_project/features/finished_delivery/presentation/widget/finished_delivery_pagination.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinishedDeliveryPage extends StatefulWidget {
  @override
  _FinishedDeliveryPageState createState() => _FinishedDeliveryPageState();
}

class _FinishedDeliveryPageState extends State<FinishedDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<FinishedDeliveryProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliveries'),
      ),
      body: _send(),
    );
  }

  Widget _send() {
    final list = context.select((FinishedDeliveryProvider n) => n.deliveryData);
    int page = 1;
    context.watch<FinishedDeliveryProvider>().loadFinishedDeliveryPaginationData(page, Constant.token);
    if(list != null) {
      return FinishedDeliveryPagination(list, page);
    }
    else{
      return Center(child: CircularProgressIndicator());
    }
  }

  Widget finishedDeliveryPagination(
      BuildContext context, List dataProvider, Widget child) {
    return ListView.builder(
      itemCount: dataProvider.length,
      itemBuilder: (context, index) => showData(dataProvider, index),
    );
  }

  Widget showData(List data, int index) {
    return Container(
      child: Column(
        children: [
          Text("${data[index]["Name"]}"),
          // Text("${data[index]["OrderId"]}"),
          Divider(thickness: 3),
        ],
      ),
    );
  }
}
