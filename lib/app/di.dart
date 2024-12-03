import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellos/data/data_source/remote_data_source.dart';
import 'package:wellos/data/network/dio_factory.dart';
import 'package:wellos/domain/repository/repository.dart';
import 'package:wellos/domain/usecase/login_usecase.dart';
import 'package:wellos/presentation/login/view_model/login_view_model.dart';
import '../data/network/app_api.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_implementer.dart';
import 'app_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  //app module, all generic dependencies

  //shared pref instance
  final sharedPreferences = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //app preferences instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  //network info instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  //dio factory instance
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await GetIt.instance.get<DioFactory>().getDio();

  //app service clint instance
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //remote data source instance
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  //repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

Future<void> initLoginModule() async {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

Future<void> initRegisterModule() async {}
