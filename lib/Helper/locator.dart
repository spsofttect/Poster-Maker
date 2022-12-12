import 'package:get_it/get_it.dart';
import 'package:poster_maker/Helper/authentication_service.dart';

GetIt locator = GetIt.instance;

 setupLocator() {
  // locator.registerLazySingleton(() => NavigationService());
  // locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AnalyticsService());
  // locator.registerLazySingleton(() => FirestoreService());
  // locator.registerLazySingleton(() => CloudStorageService());
  // locator.registerLazySingleton(() => ImageSelector());
  // locator.registerLazySingleton(() => PushNotificationService());
}
