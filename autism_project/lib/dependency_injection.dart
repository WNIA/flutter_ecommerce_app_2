import 'dart:io';

import 'package:autism_project/core/data/shared_prefs.dart';
import 'package:autism_project/features/finished_delivery/data/datasource/remote/finished_delivery_remote.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  //UseCases
  sl.registerLazySingleton(
      () => FinishedDeliveryPaginationUseCase(finishedDeliveryRepository: sl()));

  //Repository
  sl.registerLazySingleton<FinishedDeliveryRepository>(() =>
      FinishedDeliveryRepositoryImpl(
          networkInfo: sl(), finishedDeliveryRemote: sl(), finishedDeliveryLocal: sl()));

  //Data Sources
  sl.registerLazySingleton<FinishedDeliveryRemote>(
      () => FinishedDeliveryRemoteImpl(client: sl()));
  sl.registerLazySingleton<FinishedDeliveryLocal>(
          () => FinishedDeliveryLocalImpl());

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<LocalDataSource>(
      () => SharedPrefs(sharedPreferences: sl()));

  //External
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerFactory(() => sharedPref);
  sl.registerLazySingleton(() => HttpClient());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
