import 'dart:io';

import 'package:autism_project/core/helper/shared_preference.dart';
import 'package:autism_project/core/network/network_info.dart';
import 'package:autism_project/presentation/providers/login_and_profile_provider.dart';
import 'package:autism_project/presentation/providers/pending_order_provider.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasources/remote/finished_deliveries_remote.dart';
import 'data/datasources/remote/processed_deliveries_remote.dart';
import 'package:autism_project/data/datasources/remote/login_and_profile_remote.dart';
import 'package:autism_project/data/datasources/remote/pending_order_remote.dart';
import 'package:autism_project/domain/repository/finished_deliveries_repository.dart';
import 'package:autism_project/domain/repository/login_and_profile_repository.dart';
import 'package:autism_project/domain/repository/pending_order_repository.dart';
import 'package:autism_project/domain/repository/processed_deliveries_repository.dart';
import 'package:autism_project/domain/usecase/finished_deliveries_usecase.dart';
import 'package:autism_project/domain/usecase/login_and_profile_usecase.dart';
import 'package:autism_project/domain/usecase/pending_order_usecase.dart';
import 'package:autism_project/domain/usecase/processed_deliveries_usecase.dart';
import 'package:autism_project/presentation/providers/finished_deliveries_provider.dart';
import 'package:autism_project/presentation/providers/processed_deliveries_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //Providers
  sl.registerFactory(() => FinishedDeliveriesProvider());
  sl.registerFactory(() => ProcessedDeliveriesProvider());
  sl.registerFactory(() => PendingOrderProvider());
  sl.registerFactory(() => LoginAndProfileProvider(loginAndProfileUseCase: sl()));

  //UseCases
  sl.registerLazySingleton(() => FinishedDeliveriesUseCase(sl()));
  sl.registerLazySingleton(() => ProcessedDeliveriesUseCase(sl()));
  sl.registerLazySingleton(() => PendingOrderUseCase(sl()));
  sl.registerLazySingleton(() => LoginAndProfileUseCase(sl()));

  //Repository
  sl.registerLazySingleton<FinishedDeliveriesRepository>(
      () => FinishedDeliveriesRepositoryImpl(
            remoteDataSource: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<ProcessedDeliveriesRepository>(
      () => ProcessedDeliveriesRepositoryImpl(
            networkInfo: sl(),
            processDeliveriesRemoteDataSource: sl(),
          ));
  sl.registerLazySingleton<PendingOrderRepository>(
      () => PendingOrderRepositoryImpl(
            networkInfo: sl(),
            pendingOrderRemoteDataSource: sl(),
          ));
  sl.registerLazySingleton<LoginAndProfileRepository>(
      () => LoginAndProfileRepositoryImpl(
            networkInfo: sl(),
            loginAndProfileRemoteDataSource: sl(),
          ));

  //Data Sources
  sl.registerLazySingleton<FinishedDeliveriesRemoteDataSource>(
      () => FinishedDeliveriesAPIService());
  sl.registerLazySingleton<ProcessDeliveriesRemoteDataSource>(
      () => ProcessedDeliveriesAPIService());
  sl.registerLazySingleton<PendingOrderRemoteDataSource>(
      () => PendingOrderAPIService());
  sl.registerLazySingleton<LoginAndProfileRemoteDataSource>(
      () => LoginAndProfileAPIService());

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => SharedPrefs());

  //External
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerFactory(() => sharedPref);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => HttpClient());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
