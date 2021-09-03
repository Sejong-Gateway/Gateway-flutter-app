import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/models/auth/user.dart';
import 'package:gateway/models/error.dart';
import 'package:gateway/models/subject/subject.dart';
import 'package:gateway/service/auth/auth_service.dart';
import 'package:gateway/service/common/token.dart';

class CurrentUserCubit extends Cubit<User>{
  CurrentUserCubit() : super(null);

  void getCurrentUser() async{
    try{
      String accessToken = await TokenService().getAccessToken();

      User user = await AuthService.getUserInfo(accessToken);

      emit(user);
    } on APIError catch(e){
      print(e);
    }
  }
}