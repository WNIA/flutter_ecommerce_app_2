import 'package:autism_project/data/model/pending_order_response_model.dart';
import 'package:equatable/equatable.dart';

class PendingOrderEntity extends Equatable{
  PendingOrderEntity({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  final int status;
  final bool success;
  final List<PendingOrderData> data;
  final String message;

  @override
  // TODO: implement props
  List<Object> get props => [status, success, data, message];
}