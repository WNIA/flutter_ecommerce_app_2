import 'package:autism_project/presentation/providers/finished_deliveries_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerList() {
  return [
    ChangeNotifierProvider(create: (context) => FinishedDeliveriesProvider()),
    // ChangeNotifierProvider(create: (context) => )
  ];
}
