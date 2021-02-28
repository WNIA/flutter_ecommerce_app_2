import 'package:autism_project/core/widgets/box_deco.dart';
import 'package:autism_project/features/home/presentation/widget/text_style.dart';
import 'package:flutter/material.dart';

import 'appbar_widget.dart';
import 'last_five_sales_chart.dart';

class HomeScreenItems extends StatefulWidget {
  @override
  _HomeScreenItemsState createState() => _HomeScreenItemsState();
}

class _HomeScreenItemsState extends State<HomeScreenItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context, "Home"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
              clipBehavior: Clip.none,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 90,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('0',
                              style: orderSummaryTextStyle()),
                          Text('Pending', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.red[900],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('0',
                              style: orderSummaryTextStyle()),
                          Text('Processing', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('0',
                              style: orderSummaryTextStyle()),
                          Text('Delivered', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Container(
                    height: 300,
                    decoration: boxDeco(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Last Five Sales Chart'),
                          Expanded(child: LastFiveSalesChart()),
                        ],
                      ),
                    )),
                SizedBox(height: 12),
              ]),
        ));
  }
}
