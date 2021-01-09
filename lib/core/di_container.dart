import 'package:get_it/get_it.dart';
import 'package:login_page/service/api/auth/auth_api.dart';
import 'package:login_page/service/api/auth/auth_api_service.dart';
import 'package:login_page/service/api/common/token.dart';
import 'package:login_page/service/api/subject/subject_api.dart';
import 'package:login_page/service/api/subject/subject_api_service.dart';
import 'package:login_page/viewmodel/certificate_req_viewmodel.dart';
import 'package:login_page/viewmodel/current_select_viewmodel.dart';
import 'package:login_page/viewmodel/login_viewmodel.dart';
import 'package:login_page/viewmodel/main_viewmodel.dart';
import 'package:login_page/viewmodel/register_viewmodel.dart';
import 'package:login_page/viewmodel/splash_viewmodel.dart';

var diContainer = GetIt.instance;

void setupDiContainer() {
//  ViewModel 을 DI Container 에 등록해주어서 시작할때 모두 싱글톤으로 처리합니다.
  diContainer.registerFactory(() => SplashViewModel());
  diContainer.registerFactory(() => CurrentSelectViewModel());
  diContainer.registerFactory(() => RegisterViewModel());
  diContainer.registerFactory(() => LoginViewModel());
  diContainer.registerFactory(() => CertificateReqViewModel());
  diContainer.registerFactory(() => MainViewModel());

//  API 도 마찬가지로 LazySingleton으로 처리
  diContainer.registerFactory(() => TokenService());
  diContainer.registerLazySingleton<AuthApi>(() => AuthApiService());
  diContainer.registerLazySingleton<SubjectApi>(() => SubjectApiService());

}
