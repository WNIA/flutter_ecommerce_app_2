import 'package:autism_project/data/models/processed_deliveries_response_model.dart';
import 'package:equatable/equatable.dart';

class ProcessedDeliveriesResponseEntity extends Equatable{
  ProcessedDeliveriesResponseEntity({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  final int status;
  final bool success;
  final List<ProcessedDeliveryData> data;
  final String message;


  @override
  // TODO: implement props
  List<Object> get props => [status, success, data, message];
}

