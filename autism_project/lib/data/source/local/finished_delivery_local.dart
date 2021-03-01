import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/data/model/finished_delivery_response_model.dart';

import 'local_data_fd.dart';

abstract class FinishedDeliveryLocal {
  List callFinishedDeliveryLocalData();
}
class FinishedDeliveryLocalImpl implements FinishedDeliveryLocal{

  List callFinishedDeliveryLocalData() {
    List data = [];
    final fdrm = FinishedDeliveryResponseModel.fromJson(localDataFD);
    for (int i = 0; i < fdrm.data.length; i++) {
      data.add(fdrm.data[i].toJson());
    }

    return data;
  }
}
