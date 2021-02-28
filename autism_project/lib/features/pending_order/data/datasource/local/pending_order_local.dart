import 'package:autism_project/features/pending_order/data/model/pending_order_response_model.dart';

import 'local_data_po.dart';

abstract class PendingOrderLocal {
  List callFinishedDeliveryLocalData();
}
class PendingOrderLocalImpl implements PendingOrderLocal{

  List callFinishedDeliveryLocalData() {
    List data = [];
    final fdrm = PendingOrderResponseModel.fromJson(localDataPO);
    for (int i = 0; i < fdrm.data.length; i++) {
      data.add(fdrm.data[i].toJson());
    }

    return data;
  }
}
