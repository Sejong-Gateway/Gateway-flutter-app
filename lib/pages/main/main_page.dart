import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gateway/blocs/auth/current_user_cuibt.dart';
import 'package:gateway/blocs/current_subject/current_subejct_list_state_cubit.dart';
import 'package:gateway/blocs/current_subject/select_current_subject_list_cubit.dart';
import 'package:gateway/blocs/department/department_cubit.dart';
import 'package:gateway/blocs/subject_type/subject_type_cubit.dart';
import 'package:gateway/components/modal_view.dart';
import 'package:gateway/models/auth/user.dart';
import 'package:gateway/pages/certificate_guideline.dart';
import 'package:gateway/pages/main/current_subjects_tab.dart';
import 'package:gateway/pages/main/current_tab.dart';
import 'package:gateway/pages/main/remain_subjects_tab.dart';
import 'package:gateway/pages/profile_page.dart';

class MainPage extends StatelessWidget{

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CurrentUserCubit()..getCurrentUser(),
          ),
          BlocProvider(
            create: (_) => SubjectTypeCubit()..getSubjectTypes(),
          ),
          BlocProvider(
            create: (_) => DepartmentCubit()..getDepartment(),
          ),
          BlocProvider(
            create: (_) => CurrentSubjectListStateCubit(),
          ),
          BlocProvider(
            create: (_) => SelectCurrentSubjectListCubit(),
          ),
        ],
        child: MainPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TabBar(
                        labelColor: Colors.black,
                        indicatorColor: Colors.black,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(width: 3.0),
                          insets: EdgeInsets.symmetric(horizontal: 60.0),
                        ),
                        tabs: [
                          Tab(
                            child: Text(
                              "나의 현황",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "수강중",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "수강계획",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModal(
                            context: context,
                            builder: (_) => this._modalView(context)
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15, left: 10),
                        child: SvgPicture.asset('asset/hamburgerMenu.svg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // TabVarView 구현. 각 탭에 해당하는 컨텐트 구성
          body: Container(
            color: Colors.white,
            child: BlocBuilder<CurrentUserCubit, User>(
              builder: (context, user){
                if ( user != null ){
                  return TabBarView(
                    children: [
                      CurrentStatusTab(user: user),
                      CurrentSubjectsTab(user: user),
                      RemainSubjectsTab(user: user),
                    ],
                  );
                }
                else{
                  return SizedBox();
                }
              },
            )
          ),
        ),
      ),
    );
  }
}

extension on MainPage{
  Widget _modalView(BuildContext context){
    return ModalView(
      padding: EdgeInsets.symmetric(
          horizontal: 36, vertical: 13),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(ProfilePage.route()),
            child: this._modelItem(context, '내 정보'),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(Certificateguideline.route()),
            child: this._modelItem(context, '공학인증'),
          ),
        ],
      ),
    );
  }

  Widget _modelItem(BuildContext context, String title) => Padding(
    padding:
    EdgeInsets.symmetric(vertical: 15),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Expanded(child: SizedBox()),
        SvgPicture.asset(
          'asset/icons/ic_right_arrow.svg',
        ),
      ],
    ),
  );
}