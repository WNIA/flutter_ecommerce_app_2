import 'package:autism_project/data/models/finished_deliveries_response_model.dart';
import 'package:equatable/equatable.dart';

class FinishedDeliveriesResponseEntity extends Equatable{
  FinishedDeliveriesResponseEntity({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  final int status;
  final bool success;
  final List<FinishedDeliveriesResponseData> data;
  final String message;


  @override
  // TODO: implement props
  List<Object> get props => [status, success, data, message];
}

