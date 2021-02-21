import 'package:autism_project/core/helper/constant.dart';
import 'package:autism_project/features/finished_delivery/presentation/provider/finished_delivery_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinishedDeliveryPagination extends StatefulWidget {
  List dataList;
  int page;

  FinishedDeliveryPagination(this.dataList, this.page);

  @override
  _FinishedDeliveryPaginationState createState() =>
      _FinishedDeliveryPaginationState();
}

class _FinishedDeliveryPaginationState
    extends State<FinishedDeliveryPagination> {
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
      print("end scroll.............page.....${widget.page}");
      widget.page++;
      Provider.of<FinishedDeliveryProvider>(context, listen: false)
          .loadFinishedDeliveryPaginationData(widget.page, Constant.token);
      List temp = Provider.of<FinishedDeliveryProvider>(context, listen: false)
          .deliveryData;
      widget.dataList.addAll(temp);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemCount: widget.dataList.length,
      itemBuilder: (BuildContext context, int index) =>
          showData(widget.dataList, index),
    );
  }

  Widget showData(List data, int index) {
    return Container(
      padding: const EdgeInsets.all(16),
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
