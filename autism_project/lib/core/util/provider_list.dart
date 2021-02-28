import 'package:autism_project/features/finished_delivery/presentation/provider/finished_delivery_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:autism_project/dependency_injection.dart' as di;

List<SingleChildWidget> providerList() {
  return [
    ChangeNotifierProvider<FinishedDeliveryProvider>(create: (_) => di.sl<FinishedDeliveryProvider>()),
    // ChangeNotifierProvider<LoginProvider>(create: (_) => di.sl<LoginProvider>()),
  ];
}