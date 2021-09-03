import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/models/department/department.dart';

class DepartmentSelectCubit extends Cubit<Department>{

  DepartmentSelectCubit() : super(null);

  void onSelectDepartment(Department department){
    emit(department);
  }
}