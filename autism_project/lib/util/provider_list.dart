import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/presentation/provider/finished_delivery_provider.dart';
import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/presentation/provider/pending_order_provider.dart';
import 'package:autism_project/presentation/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:autism_project/dependency_injection.dart' as di;

List<SingleChildWidget> providerList() {
  return [
    ChangeNotifierProvider<FinishedDeliveryProvider>(create: (_) => di.sl<FinishedDeliveryProvider>()),
    ChangeNotifierProvider<PendingOrderProvider>(create: (_) => di.sl<PendingOrderProvider>()),
    ChangeNotifierProvider<AuthProvider>(create: (_) => di.sl<AuthProvider>()),
  ];
}