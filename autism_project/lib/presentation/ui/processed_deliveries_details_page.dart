import 'package:autism_project/core/helper/constants.dart';
import 'package:autism_project/data/models/processed_delivery_details_response_model.dart';
import 'package:autism_project/presentation/widgets/box_deco_widget.dart';
import 'package:autism_project/presentation/widgets/processed_delivery_list_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProcessedDeliveriesDetailsPage extends StatefulWidget {
  final int orderId;
  ProcessedDeliveriesDetailsPage(this.orderId);

  @override
  _ProcessedDeliveriesDetailsPageState createState() => _ProcessedDeliveriesDetailsPageState();
}

class _ProcessedDeliveriesDetailsPageState extends State<ProcessedDeliveriesDetailsPage> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProcessedDeliveriesDetailsAPIService>(context, listen: false);
    return FutureBuilder(
        future: provider.fetchProcessedDeliveriesDetails(Constants.myToken, widget.orderId),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? processedDeliveryDetailsItem(context, snapshot.data)
              : processedDeliveryDetailsItem(context, null);
        });

  }

  Scaffold processedDeliveryDetailsItem(BuildContext context, ProcessedDeliveriesDetailsResponseModel response) {
    return Scaffold(
    appBar: AppBar(title: Text('Update Orders')),
    body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        clipBehavior: Clip.none,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProcessedDeliveryListItems(widget.orderId),
          Center(
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width*0.8,
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              decoration: boxDeco(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Invoice Number'),
                      Spacer(),
                      response != null ? Text(response.data.invoiceNumber) : Text('...'),
                    ],
                  ),
                  Divider(thickness: 1),
                  Row(
                    children: [
                      Text('Sub Total'),
                      Spacer(),
                      response != null ? Text('${response.data.total-response.data.discount}') : Text('...'),
                    ],
                  ),
                  Divider(thickness: 1),
                  Row(
                    children: [
                      Text('Discount'),
                      Spacer(),
                      response != null ? Text('${response.data.discount}') : Text('...'),
                    ],
                  ),
                  Divider(thickness: 1),
                  Row(
                    children: [
                      Text('Total'),
                      Spacer(),
                      response != null ? Text('${response.data.total}') : Text('...'),
                    ],
                  ),
                  Divider(thickness: 1),
                  Row(
                    children: [
                      Text('Delivery Charge'),
                      Spacer(),
                      response != null ? Text('${response.data.deliveryCharge}') : Text('...'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 28.0),
          Center(
            child: Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Grand Total', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                  response != null ? Text('${response.data.total+response.data.deliveryCharge} ৳', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)) : Text('...'),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          FlatButton(
              onPressed: () {},
              height: 70,
              child: Text('Cancel Order', style: TextStyle(color: Colors.white)),
              color: Colors.black)
        ],
      ),
    ),
  );
  }

}
