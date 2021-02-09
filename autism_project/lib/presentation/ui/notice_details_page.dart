import 'package:flutter/material.dart';

class NoticeDetailsPage extends StatefulWidget {
  @override
  _NoticeDetailsPageState createState() => _NoticeDetailsPageState();
}

class _NoticeDetailsPageState extends State<NoticeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: ListView(
        children: [
          Image.asset('assets/images/cat.jpg'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Title: ', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    Text('...'),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Content: ', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    Flexible(child: Text('..........................................................................................................................................................................................................................................................................................................................................................................')),
                  ],
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
