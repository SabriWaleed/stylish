import 'package:dio/dio.dart';
import 'package:ecommerce_project/Core/networking/dio_consumer.dart';
import 'package:ecommerce_project/Core/services/secure_storage_service.dart';
import 'package:ecommerce_project/Core/services/shared_preferences_service.dart';
import 'package:ecommerce_project/Features/auth/data/repos/auth_repo.dart';
import 'package:ecommerce_project/Features/auth/data/repos/auth_repo_implementation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getit = GetIt.instance; //ده Singleton جاهز من GetIt.

Future<void> setupGetIt() async {
  //دي دالة بتسجل كل الـ وغالبا بتناديها في الميينDependencies.
  // Register SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  getit.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(prefs),
  ); //علشان امل سنجل تون للشيرد بريفرنسس واستخدمه  علي  مدار  الابلكيشن  كله

  // Register SecureStorageService
  getit.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(),
  ); //علشان امل سنجل تون للسيكيور استوردج واستخدمه  علي  مدار  الابلكيشن  كله

  // Register DioConsumer as a singleton
  getit.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: Dio()));

  // Register AuthRepoImplementation مع inject الـ services بشكل صح
  getit.registerLazySingleton<AuthRepo>(
    () => AuthRepoImplementation(
      getit<DioConsumer>(),
      getit<SecureStorageService>(),
      getit<SharedPreferencesService>(),
    ),
  );
}
