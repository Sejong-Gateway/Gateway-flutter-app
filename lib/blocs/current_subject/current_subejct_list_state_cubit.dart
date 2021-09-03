import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentSubjectListStateCubit extends Cubit<bool>{
  CurrentSubjectListStateCubit() : super(false);

  void changeState() async{
    emit(!this.state);
  }
}