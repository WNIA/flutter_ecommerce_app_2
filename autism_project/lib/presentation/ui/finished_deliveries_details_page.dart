import 'package:autism_project/presentation/widgets/box_deco_widget.dart';
import 'package:flutter/material.dart';

class FinishedDeliveriesDetailsPage extends StatefulWidget {
  @override
  _FinishedDeliveriesDetailsPageState createState() =>
      _FinishedDeliveriesDetailsPageState();
}

class _FinishedDeliveriesDetailsPageState
    extends State<FinishedDeliveriesDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                              child: Image.asset('assets/images/cat.jpg',
                                  width: double.infinity),
                            ),
                           Positioned(
                               right: 0,
                               bottom: 20,
                               child: Container(
                                   padding: const EdgeInsets.all(5.0),
                                   color: Colors.pink,
                                   child: Text('28/9/2006',
                                       style:
                                       TextStyle(fontSize: 12, color: Colors.white)))),
                           Positioned(
                               left: 0,
                               top: 20,
                               child: Container(
                                   padding: const EdgeInsets.all(5.0),
                                   color: Colors.pink,
                                   child: Text('Price: 0 ৳',
                                       style:
                                       TextStyle(fontSize: 12, color: Colors.white)))),
                           Positioned(
                               left: 0,
                               bottom: 10,
                               child: Container(
                                   padding: const EdgeInsets.all(5.0),
                                   color: Colors.white,
                                   child: Text('Name',
                                       style:
                                       TextStyle(fontSize: 12)))),


                         ],
                       ),
                       SizedBox(height: 5),
                       FlatButton(onPressed: (){}, child: Text('Done', style: TextStyle(color: Colors.white)), color: Colors.black),
                       Text('1')
                     ],
                   )
                ),
                SizedBox(height: 15.0),
                Container(
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
                          Text('...'),
                        ],
                      ),
                      Divider(thickness: 1),
                      Row(
                        children: [
                          Text('Sub Total'),
                          Spacer(),
                          Text('...'),
                        ],
                      ),
                      Divider(thickness: 1),
                      Row(
                        children: [
                          Text('Discount'),
                          Spacer(),
                          Text('...'),
                        ],
                      ),
                      Divider(thickness: 1),
                      Row(
                        children: [
                          Text('Total'),
                          Spacer(),
                          Text('...'),
                        ],
                      ),
                      Divider(thickness: 1),
                      Row(
                        children: [
                          Text('Delivery Charge'),
                          Spacer(),
                          Text('...'),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28.0),
                Container(
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
                      Text('0 ৳', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
