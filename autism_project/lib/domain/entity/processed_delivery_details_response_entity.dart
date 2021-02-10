import 'package:autism_project/data/models/processed_delivery_details_response_model.dart';
import 'package:equatable/equatable.dart';

class ProcessedDeliveriesDetailsResponseEntity extends Equatable{
  ProcessedDeliveriesDetailsResponseEntity({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  final int status;
  final bool success;
  final ProcessedDeliveryDetailsData data;
  final String message;

  @override
  // TODO: implement props
  List<Object> get props => [status, success, data, message];
}
