import 'package:autism_project/domain/usecase/finished_deliveries_usecase.dart';
import 'package:autism_project/domain/usecase/login_and_profile_usecase.dart';
import 'package:autism_project/domain/usecase/pending_order_usecase.dart';
import 'package:autism_project/domain/usecase/processed_deliveries_usecase.dart';
import 'package:autism_project/presentation/providers/finished_deliveries_provider.dart';
import 'package:autism_project/presentation/providers/processed_deliveries_provider.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Providers
  sl.registerFactory(() => FinishedDeliveriesProvider());
  sl.registerFactory(() => ProcessedDeliveriesProvider());
  //UseCases
  sl.registerLazySingleton(() => FinishedDeliveriesUseCase(sl()));
  sl.registerLazySingleton(() => ProcessedDeliveriesUseCase(sl()));
  sl.registerLazySingleton(() => PendingOrderUseCase(sl()));
  sl.registerLazySingleton(() => LoginAndProfileUseCase(sl()));
  

}