import 'package:autism_project/data/models/processed_delivery_list_response_model.dart';
import 'package:equatable/equatable.dart';

class ProcessedDeliveriesListResponseEntity extends Equatable{
  ProcessedDeliveriesListResponseEntity({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  final int status;
  final bool success;
  final List<ProcessedDeliveryListData> data;
  final String message;

  @override
  // TODO: implement props
  List<Object> get props => [status, success, data, message];
}

