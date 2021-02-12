import 'package:autism_project/domain/entity/processed_delivery_details_response_entity.dart';
import 'package:autism_project/domain/usecase/processed_deliveries_usecase.dart';
import 'package:flutter/material.dart';

class ProcessedDeliveriesProvider with ChangeNotifier {
  final ProcessedDeliveriesUseCase _processedDeliveriesUseCase;

  ProcessedDeliveriesProvider({ProcessedDeliveriesUseCase processedDeliveriesUseCase}) : _processedDeliveriesUseCase = processedDeliveriesUseCase;

  ProcessedDeliveriesDetailsResponseEntity responseEntity;
  String error;
  List data;

  getProcessedDeliveriesPaginationProvider(int page, String token) async{
    final result = await _processedDeliveriesUseCase.callProcessedDeliveriesPaginationUseCase(page, token);
    result.fold((l){
      error = 'failed attempt';
    }, (r){
      data = r;
    });
    notifyListeners();
    return data;
  }
  getProcessedDeliveriesDetailsProvider(String token, int orderId) async {
    final result = await _processedDeliveriesUseCase.callProcessedDeliveriesDetailsUseCase(token, orderId);
    result.fold((l){
      error = 'failed attempt';
    }, (r){
      responseEntity = r;
    });
    notifyListeners();
    return responseEntity;
  }
  getProcessedDeliveriesListProvider(String token , int orderId) async {
    final result = await _processedDeliveriesUseCase.callProcessedDeliveriesListUseCase(token, orderId);
    result.fold((l){
      error = 'failed attempt';
    }, (r){
      data = r;
    });
    notifyListeners();
    return data;
  }
}
