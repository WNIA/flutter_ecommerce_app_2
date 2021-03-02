import 'package:autism_project/data/model/finished_delivery_response_model.dart';
import 'package:equatable/equatable.dart';

class FinishedDeliveryEntity extends Equatable {
  FinishedDeliveryEntity({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  final int status;
  final bool success;
  final List<FinishedDeliveryPaginationData> data;
  final String message;

  @override
  // TODO: implement props
  List<Object> get props => [status, success, data, message];
}
