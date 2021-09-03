import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/models/auth/user.dart';
import 'package:gateway/models/department/department.dart';
import 'package:gateway/service/auth/auth_service.dart';
import 'package:gateway/service/collage/collage_service.dart';
import 'package:gateway/service/common/token.dart';

class DepartmentCubit extends Cubit<Department>{
  DepartmentCubit() : super(null);

  void getDepartment() async{
    String accessToken = await TokenService().getAccessToken();

    User user = await AuthService.getUserInfo(accessToken);

    Department department = await CollageService.getDepartment(user.department.uuid);

    emit(department);
  }
}