import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/blocs/signup/signup_bloc.dart';
import 'package:gateway/blocs/signup/signup_event.dart';
import 'package:gateway/blocs/signup/signup_state.dart';
import 'package:gateway/blocs/subject_select/page_view_index_cubit.dart';
import 'package:gateway/blocs/subject_select/subject_list_select_cubit.dart';
import 'package:gateway/blocs/subject_select/subject_select_cubit.dart';
import 'package:gateway/blocs/subject_type/subject_type_cubit.dart';
import 'package:gateway/components/Button.dart';
import 'package:gateway/models/error.dart';
import 'package:gateway/models/subject/subject_type.dart';
import 'package:gateway/pages/signup/select_requirement_page.dart';
import 'package:gateway/pages/signup/subject_list_page.dart';
import 'package:gateway/utils/gateway_color.dart';
import 'package:gateway/components/Appbar.dart' as Gw;

class SelectSubjectPage extends StatelessWidget {
  const SelectSubjectPage({Key key}) : super(key: key);

  static Route route(SignupBloc bloc) {
    return MaterialPageRoute<void>(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: bloc),
          BlocProvider(create: (_) => SubjectTypeCubit()..getSubjectTypes()),
          BlocProvider(create: (_) => SubjectSelectCubit()),
          BlocProvider(create: (_) => PageViewIndexCubit()),
        ],
        child: SelectSubjectPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GatewayColor.white,
      appBar: this._appBar(),
      body: _body(context),
    );
  }
}

extension on SelectSubjectPage {
  Widget _appBar() => Gw.AppBar(
        preferredSize: Size.fromHeight(56),
        title: '',
        leftButtonExist: true,
        backgroundColor: GatewayColor.white,
      );

  Widget _body(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final PageController pageController = PageController();
    final title = BlocProvider.of<SubjectListSelectCubit>(context)
        .subjectSelectTypes[
            BlocProvider.of<SubjectListSelectCubit>(context).state]
        .title;
    final typeName = BlocProvider.of<SubjectListSelectCubit>(context)
        .subjectSelectTypes[
            BlocProvider.of<SubjectListSelectCubit>(context).state]
        .typeName;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<SubjectTypeCubit, List<SubjectType>>(
          builder: (context, subjectTypes) {
            if (subjectTypes != null) {
              return BlocBuilder<PageViewIndexCubit, int>(
                builder: (context, page) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 26),
                      this._indicatorRow(subjectTypes, page),
                      SizedBox(height: 13),
                      Text(
                        subjectTypes[page].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 17),
                      Expanded(
                        child: PageView(
                          controller: pageController,
                          onPageChanged: (page) =>
                              BlocProvider.of<PageViewIndexCubit>(context)
                                  .onChangePage(page),
                          children: [
                            ...subjectTypes.map(
                              (subjectType) {
                                return BlocBuilder<SignupBloc, SignupState>(
                                  builder: (context, state) {
                                    if (state is SignupDateInputted) {
                                      return SubjectListPage(
                                        departmentUUID:
                                            state.signUpRequest.departmentUUID,
                                        typeUUID: subjectType.uuid,
                                        previousUUIDs: state.signUpRequest.completeSubjectUUIDs,
                                        isCheckPrevious: typeName == 'currentSubjectUUIDs'
                                      );
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      this._buttonRow(
                        context,
                        pageController,
                        page,
                        _width,
                        subjectTypes.length,
                        typeName,
                      ),
                      SizedBox(height: 16)
                    ],
                  );
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }

  Widget _indicatorRow(List<SubjectType> subjectTypes, int page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...subjectTypes.map(
          (subjectType) {
            int currentIndex = subjectTypes.indexOf(subjectType);
            bool isCurrentDot = currentIndex == page;

            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 3),
              width: isCurrentDot ? 8 : 6,
              height: isCurrentDot ? 8 : 6,
              decoration: BoxDecoration(
                color:
                    isCurrentDot ? GatewayColor.primary : GatewayColor.hintText,
                borderRadius: BorderRadius.circular(100),
              ),
            );
          },
        )
      ],
    );
  }

  Widget _buttonRow(BuildContext context, PageController pageController,
      int page, double width, int lastPage, String typeName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Button(
          text: '이전',
          width: (width - 68) / 2,
          positiveColors: ButtonColors(backgroundColor: GatewayColor.inactive),
          disabled: page == 0,
          onPressed: () {
            if (page != 0) {
              pageController.animateToPage(
                page - 1,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
        ),
        Button(
          text: (lastPage - 1) == page ? '완료' : '다음',
          width: (width - 68) / 2,
          onPressed: () {
            if (lastPage - 1 != page) {
              pageController.animateToPage(
                page + 1,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            } else {
              BlocProvider.of<SignupBloc>(context).add(
                SignupValueWillChange(
                  name: typeName,
                  value: BlocProvider.of<SubjectSelectCubit>(context).state,
                ),
              );
              bool isFinal = BlocProvider.of<SubjectListSelectCubit>(context)
                  .onIncreaseState();

              if (isFinal) {
                Navigator.of(context).push(SelectRequirementPage.route(
                  BlocProvider.of<SignupBloc>(context),
                ));
              } else {
                Navigator.of(context).push(SelectSubjectPage.route(
                  BlocProvider.of<SignupBloc>(context),
                ));
              }
            }
          },
        ),
      ],
    );
  }
}
