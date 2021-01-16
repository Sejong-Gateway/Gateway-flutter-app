import 'package:login_page/core/base_viewmodel.dart';
import 'package:login_page/core/di_container.dart';
import 'package:login_page/models/subject_model.dart';
import 'package:login_page/models/user_model.dart';
import 'package:login_page/service/api/auth/auth_api.dart';
import 'package:login_page/service/api/common/token.dart';
import 'package:login_page/service/api/subject/subject_api.dart';

class MainViewModel extends BaseViewModel{
  TokenService _tokenService = diContainer<TokenService>();
  AuthApi _authApiService = diContainer<AuthApi>();
  SubjectApi _subjectApi  = diContainer<SubjectApi>();
  UserModel user;
  List<SubjectModel> futureSubjectList = [];


  void onInitState() async{
    String accessToken = await _tokenService.getAccessToken();
    user = await _authApiService.getUserInfo(accessToken);
    setState(ViewState.IDLE);
  }

  void onFutureInit() async{
    String accessToken = await _tokenService.getAccessToken();
    user = await _authApiService.getUserInfo(accessToken);
    futureSubjectList = await _subjectApi.getSubject(user.major);
    user.currentSubjects.map((e){
      futureSubjectList.remove(e);
    });
    user.completeSubjects.map((e){
      futureSubjectList.remove(e);
    });
    setState(ViewState.IDLE);
  }

  void getCurrentSubjectList(){

  }

  int getTotalCredit() {
    return user.completeSubjects.fold(0, (previousValue, element) => previousValue + element.credit);
  }

  int getSubjectCredit(String type){
    return user.completeSubjects.fold(0, (previousValue, element){
      if ( element.type == type){
        return previousValue + element.credit;
      }
      return previousValue;
    });
  }

  void getFutureSubjectList() async{

  }
}