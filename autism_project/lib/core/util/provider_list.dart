import 'package:autism_project/features/finished_delivery/presentation/provider/finished_delivery_provider.dart';
import 'package:autism_project/features/login/presentation/provider/login_provider.dart';
import 'package:autism_project/features/pending_order/presentation/provider/pending_order_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:autism_project/dependency_injection.dart' as di;

List<SingleChildWidget> providerList() {
  return [
    ChangeNotifierProvider<FinishedDeliveryProvider>(create: (_) => di.sl<FinishedDeliveryProvider>()),
    ChangeNotifierProvider<PendingOrderProvider>(create: (_) => di.sl<PendingOrderProvider>()),
    ChangeNotifierProvider<LoginProvider>(create: (_) => di.sl<LoginProvider>()),
  ];
}