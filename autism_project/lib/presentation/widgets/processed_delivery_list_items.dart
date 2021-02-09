
import 'package:autism_project/core/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'box_deco_widget.dart';

/*Author: Wasema Nooren Islam (@WNIA)*/

class ProcessedDeliveryListItems extends StatelessWidget {
  final int orderId;

  ProcessedDeliveryListItems(this.orderId);

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ProcessedDeliveriesListAPIService>(context, listen: false);
    return FutureBuilder(
        future:
            provider.fetchProcessedDeliveriesList(Constants.myToken, orderId),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? processedDeliveriesListViewBuilder(snapshot.data)
              : Container(
                  height: 100,
                );
        });
  }

  processedDeliveriesListViewBuilder(List data) {
    return Container(
      height: 200,
      child: ListView.builder(
          // shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return processedDeliveriesListItem(context, index, data);
          }),
    );
  }

  processedDeliveriesListItem(BuildContext context, int index, List data) {
    DateTime date = DateTime.parse(data[index]['Created']);
    String format = DateFormat('dd/MM/yyyy').format(date);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0, right: 15),
        child: Container(
            height: 200,
            width: 220,
            decoration: boxDeco(),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                      child: Image.network(data[index]["Picture"],
                          height: 110,
                          width: double.infinity,
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                        top: 50,
                        right: 0,
                        child: Container(
                            padding: const EdgeInsets.all(5.0),
                            color: Colors.pink,
                            child: Text(format,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white)))),
                    Positioned(
                        left: 0,
                        top: 20,
                        child: Container(
                            padding: const EdgeInsets.all(5.0),
                            color: Colors.pink,
                            child: Text('Price: ${data[index]["Price"]} ৳',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white)))),
                    Positioned(
                        left: 0,
                        bottom: 10,
                        child: Container(
                            padding: const EdgeInsets.all(5.0),
                            color: Colors.grey[200].withOpacity(0.5),
                            child: Text(data[index]["Name"],
                                style: TextStyle(fontSize: 12)))),
                  ],
                ),
                FlatButton(
                    onPressed: () {},
                    child:
                        Text('Cancel', style: TextStyle(color: Colors.white)),
                    color: Colors.black),
                Text('1')
              ],
            )),
      ),
    );
  }
}
