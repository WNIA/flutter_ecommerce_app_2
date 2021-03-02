import 'dart:io';

import 'package:autism_project/data/source/remote/login_remote.dart';
import 'package:autism_project/domain/repository/login_repository.dart';
import 'package:autism_project/domain/usecase/login_usecase.dart';
import 'package:autism_project/presentation/provider/login_provider.dart';

import 'core/push_notification/push_notification.dart';
import 'data/source/local/pending_order_local.dart';
import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/data/source/remote/finished_delivery_remote.dart';
import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/data/source/remote/pending_order_remote.dart';
import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/domain/repository/pending_order_repository.dart';
import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/domain/usecase/pending_order_usecase.dart';
import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/presentation/provider/pending_order_provider.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/helper/shared_prefs.dart';
import 'core/network/network_info.dart';
import 'data/source/local/finished_delivery_local.dart';
import 'domain/repository/finished_delivey_repository.dart';
import 'domain/usecase/finished_delivery_usecase.dart';
import 'presentation/provider/finished_delivery_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Providers
  sl.registerFactory(() => AuthProvider(loginUseCase: sl()));

  sl.registerFactory(
      () => FinishedDeliveryProvider(finishedDeliveryUseCase: sl()));

  sl.registerFactory(
      () => PendingOrderProvider(pendingOrderPaginationUseCase: sl()));

  //UseCases
  sl.registerFactory(() => AuthUseCase(loginRepository: sl()));

  sl.registerLazySingleton(() =>
      FinishedDeliveryPaginationUseCase(finishedDeliveryRepository: sl()));

  sl.registerLazySingleton(
      () => PendingOrderPaginationUseCase(pendingOrderRepository: sl()));

  //Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      networkInfo: sl(), sharedPrefs: sl(), loginRemoteDataSource: sl()));

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
  sl.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteImpl());

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

  sl.registerLazySingleton<PushNotification>(
      () => PushNotificationImpl(firebaseMessaging: sl()));

  //External
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerFactory(() => sharedPref);
  sl.registerLazySingleton(() => HttpClient());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
