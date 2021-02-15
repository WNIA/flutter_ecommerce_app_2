import 'package:autism_project/core/helper/constant.dart';
import 'package:autism_project/features/finished_delivery/presentation/provider/finished_delivery_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinishedDelivery extends StatefulWidget {
  @override
  _FinishedDeliveryState createState() => _FinishedDeliveryState();
}

class _FinishedDeliveryState extends State<FinishedDelivery> {

  @override
  Widget build(BuildContext context) {
    Provider.of<FinishedDeliveryProvider>(context, listen: false).loadFinishedDeliveryPaginationData(1, Constant.token, context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliveries'),
      ),
      body: Consumer<FinishedDeliveryProvider>(builder: (context, dataProvider, child) => dataProvider.deliveryData != null ? finishedDeliveriesPagination(context, dataProvider, child) : Center(child: CircularProgressIndicator()))

    );
  }
  Widget finishedDeliveriesPagination(BuildContext context, FinishedDeliveryProvider dataProvider, Widget child){
    return ListView.builder(
      itemCount: dataProvider.deliveryData.length,
      itemBuilder: (context, index) => showData(dataProvider.deliveryData, index),
    );
  }
  Widget showData(List data, int index){
    return Container(
      child: Column(
        children: [
          Text(data[index]["Name"]),
          Text("${data[index]["OrderId"]}"),
          Divider(thickness: 3),
        ],
      ),
    );
  }
}
