
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/models/error.dart';
import 'package:gateway/service/auth/auth_service.dart';
import 'package:gateway/service/common/token.dart';

class SelectCurrentSubjectListCubit extends Cubit<List<String>>{
  SelectCurrentSubjectListCubit() : super([]);

  void onChangeSubject(String subjectUUID) async{
    // 이미 존재한다면
    if ( this.state.indexOf(subjectUUID) != -1 ){
      emit(
        this.state.where((uuid) => uuid != subjectUUID).toList()
      );
    }else{
      emit([
        ...this.state,
        subjectUUID,
      ]);
    }
  }

  void onUpdateCurrentSubject() async {
    try{
      String accessToken = await TokenService().getAccessToken();
      print(this.state);
      await AuthService.updateCurrentSubjects(accessToken, this.state);
    } on APIError catch(e){
      print(e.message);
      throw GatewayError(message: e.message);
    }
  }
}