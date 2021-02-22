import 'package:autism_project/core/helper/constant.dart';
import 'package:autism_project/features/finished_delivery/presentation/provider/finished_delivery_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinishedDeliveryPage extends StatefulWidget {
  @override
  _FinishedDeliveryPageState createState() => _FinishedDeliveryPageState();
}

class _FinishedDeliveryPageState extends State<FinishedDeliveryPage> {
  ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_scrollListener);
  }

  _scrollListener() async {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print("end scroll.............page.....");
      Provider.of<FinishedDeliveryProvider>(context, listen: false)
          .loadFinishedDeliveryPaginationData(Constant.token);
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliveries'),
      ),
      body: _send(),
    );
  }

  Widget _send() {
    final isLoading = context.select((FinishedDeliveryProvider n) => n.isLoading);
    final list = context.select((FinishedDeliveryProvider n) => n.deliveryData);
    if(list == null && !isLoading) {
      context
          .read<FinishedDeliveryProvider>()
          .loadFinishedDeliveryPaginationData(Constant.token);
    }
    else if(list != null) {
      return finishedDeliveryPagination(list);
    }
    else{
      return Center(child: CircularProgressIndicator());
    }
  }

  Widget finishedDeliveryPagination(List dataProvider) {
    return ListView.builder(
      controller: _controller,
      itemCount: dataProvider.length,
      itemBuilder: (context, index) => showData(dataProvider, index),
    );
  }

  Widget showData(List data, int index) {
    return Container(
      child: Column(
        children: [
          Text("${data[index]["Name"]}"),
          SizedBox(height: 8),
          Text("${data[index]["Id"]}"),
          SizedBox(height: 8),
          Divider(thickness: 3),
        ],
      ),
    );
  }
}
