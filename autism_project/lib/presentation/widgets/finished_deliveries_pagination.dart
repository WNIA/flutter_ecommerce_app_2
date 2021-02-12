import 'package:autism_project/core/helper/constants.dart';
import 'package:autism_project/presentation/providers/finished_deliveries_provider.dart';
import 'package:autism_project/presentation/ui/finished_deliveries_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'box_deco_widget.dart';

class FinishedDeliveriesPagination extends StatefulWidget {
  List data;
  int currentPage;

  FinishedDeliveriesPagination(this.data, this.currentPage);

  @override
  _FinishedDeliveriesPaginationState createState() =>
      _FinishedDeliveriesPaginationState();
}

class _FinishedDeliveriesPaginationState
    extends State<FinishedDeliveriesPagination> {
  ScrollController _controller;
  bool isLoading = false;
  String token = "";

  @override
  void initState() {
    super.initState();
    _controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

/*
* _scrollListener fetches more data when it reaches the end of the screen
* method for pagination
* @WNIA*/
  _scrollListener() async {
    try {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        print("end scroll.............page.....${widget.currentPage}");
        List temp = context.read<FinishedDeliveriesProvider>().getFinishedDeliveriesProvider(
                widget.currentPage + 1, Constants.myToken);
        // print("....... ${widget.currentPage}");
        widget.data.addAll(temp);
        widget.currentPage++;
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  /*
  * Listview of paginated items - @WNIA
  */
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _controller,
        itemCount: widget.data.length,
        itemBuilder: (BuildContext context, int index) {
          // if (index == widget.data.length-1)
          //   return isLoading ? _overlayProgressbar() : Container();
          // else
          return finishedDeliveriesListItem(index, widget.data);
        });
  }

  Padding finishedDeliveriesListItem(int index, List data) {
    DateTime date = DateTime.parse(data[index]['Created']);
    String format = DateFormat('dd/MM/yyyy').format(date);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        height: 192,
        width: double.infinity,
        decoration: boxDeco(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundImage: data[index]["Picture"] == null
                          ? AssetImage('assets/images/placeholder_image.png')
                          : NetworkImage(data[index]["Picture"]),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data[index]["Name"],
                            style: TextStyle(color: Colors.grey[600])),
                        Text(data[index]["MobileNumber"],
                            style: TextStyle(color: Colors.grey[600])),
                        Text(data[index]["Email"],
                            style: TextStyle(color: Colors.grey[600]))
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.check_circle_outline,
                        size: 40, color: Colors.green[700]),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              Divider(),
              Row(
                children: [
                  Text("Invoice Number: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Flexible(
                    child: Text(data[index]["InvoiceNumber"],
                        overflow: TextOverflow.ellipsis, maxLines: 1),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text("Delivery Charge: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Flexible(
                      child: Text("${data[index]["DeliveryCharge"]}",
                          overflow: TextOverflow.ellipsis, maxLines: 1)),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text("Order Date: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(format),
                ],
              ),
              Row(
                children: [
                  Spacer(),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinishedDeliveriesDetailsPage()));
                    },
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('View', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: 10)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
