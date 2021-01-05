import 'package:get_it/get_it.dart';
import 'package:login_page/service/api/auth/auth_api.dart';
import 'package:login_page/service/api/auth/auth_api_service.dart';
import 'package:login_page/viewmodel/splash_viewmodel.dart';

var diContainer = GetIt.instance;

void setupDiContainer() {
//  ViewModel 을 DI Container 에 등록해주어서 시작할때 모두 싱글톤으로 처리합니다.
  diContainer.registerFactory(() => SplashViewModel());

//  API 도 마찬가지로 LazySingleton으로 처리
  diContainer.registerLazySingleton<AuthApi>(() => AuthApiService());
}
