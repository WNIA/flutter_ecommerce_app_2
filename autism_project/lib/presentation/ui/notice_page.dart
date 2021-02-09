import 'package:autism_project/presentation/widgets/box_deco_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notice_details_page.dart';

class NoticePage extends StatefulWidget {
  static final routeName = "/notice_page";

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          height: 290,
          width: double.infinity,
          decoration: boxDeco(),
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0)),
                  child: Image.asset('assets/images/cat.jpg',
                      width: double.infinity),
                ),
                Positioned(
                    left: 0,
                    bottom: 25,
                    child: Container(
                        padding: const EdgeInsets.all(5.0),
                        color: Colors.white,
                        child: Text('28/9/2006',
                            style:
                                TextStyle(fontSize: 14))))
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Title: ', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                        Flexible(child: Text('...',  overflow: TextOverflow.ellipsis, maxLines: 1)),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text('Content: ', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                        Flexible(child: Text('...',  overflow: TextOverflow.ellipsis, maxLines: 1)),
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NoticeDetailsPage()));
                          },
                          color: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child:
                              Text('View', style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(width: 8.0)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
