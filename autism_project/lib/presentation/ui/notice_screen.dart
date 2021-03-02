import 'package:autism_project/presentation/widgets/box_deco.dart';
import 'package:flutter/material.dart';


class NoticeScreen extends StatefulWidget {
  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notice Screen"),
      ),
      body: noticeListItem(context),
    );
  }

  Padding noticeListItem(BuildContext context) {
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
                      backgroundImage: AssetImage('assets/images/placeholder_image.png'),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name",
                            style: TextStyle(color: Colors.grey[600])),
                        Text("MobileNumber",
                            style: TextStyle(color: Colors.grey[600])),
                        Text("Email",
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
                    child: Text("InvoiceNumber",
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
                      child: Text("${"DeliveryCharge"}",
                          overflow: TextOverflow.ellipsis, maxLines: 1)),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text("Order Date: ",
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text("format"),
                ],
              ),
              Row(
                children: [
                  Spacer(),
                  RaisedButton(
                    onPressed: () {

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
