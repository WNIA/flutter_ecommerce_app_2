import 'dart:io';

import 'package:autism_project/features/finished_delivery/data/datasource/remote/finished_delivery_remote.dart';
import 'package:autism_project/features/pending_order/data/datasource/local/pending_order_local.dart';
import 'package:autism_project/features/pending_order/data/datasource/remote/pending_order_remote.dart';
import 'package:autism_project/features/pending_order/domain/repository/pending_order_repository.dart';
import 'package:autism_project/features/pending_order/domain/usecase/pending_order_usecase.dart';
import 'package:autism_project/features/pending_order/presentation/provider/pending_order_provider.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/helper/shared_prefs.dart';
import 'core/network/network_info.dart';
import 'features/finished_delivery/data/datasource/local/finished_delivery_local.dart';
import 'features/finished_delivery/domain/repository/finished_delivey_repository.dart';
import 'features/finished_delivery/domain/usecase/finished_delivery_usecase.dart';
import 'features/finished_delivery/presentation/provider/finished_delivery_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Providers
  sl.registerFactory(
      () => FinishedDeliveryProvider(finishedDeliveryUseCase: sl()));

  sl.registerFactory(
      () => PendingOrderProvider(pendingOrderPaginationUseCase: sl()));

  //UseCases
  sl.registerLazySingleton(() =>
      FinishedDeliveryPaginationUseCase(finishedDeliveryRepository: sl()));

  sl.registerLazySingleton(
      () => PendingOrderPaginationUseCase(pendingOrderRepository: sl()));

  //Repository
  sl.registerLazySingleton<FinishedDeliveryRepository>(
      () => FinishedDeliveryRepositoryImpl(
            networkInfo: sl(),
            finishedDeliveryRemote: sl(),
            finishedDeliveryLocal: sl(),
          ));

  sl.registerLazySingleton<PendingOrderRepository>(() =>
      PendingOrderRepositoryImpl(
          networkInfo: sl(),
          pendingOrderLocal: sl(),
          pendingOrderRemote: sl()));

  //Data Sources
  sl.registerLazySingleton<FinishedDeliveryRemoteDataSource>(
      () => FinishedDeliveryRemoteImpl(client: sl()));
  sl.registerLazySingleton<FinishedDeliveryLocal>(
      () => FinishedDeliveryLocalImpl());

  sl.registerLazySingleton<PendingOrderRemoteDataSource>(
      () => PendingOrderRemoteImpl(client: sl()));
  sl.registerLazySingleton<PendingOrderLocal>(() => PendingOrderLocalImpl());

  //Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<SharedPrefs>(
      () => SharedPrefsImpl(sharedPrefs: sl()));

  //External
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerFactory(() => sharedPref);
  sl.registerLazySingleton(() => HttpClient());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
