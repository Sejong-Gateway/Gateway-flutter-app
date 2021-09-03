import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/blocs/category/category_list_cubit.dart';
import 'package:gateway/blocs/requirement/requirement_bloc.dart';
import 'package:gateway/blocs/requirement/requirement_event.dart';
import 'package:gateway/blocs/signup/signup_bloc.dart';
import 'package:gateway/blocs/signup/signup_event.dart';
import 'package:gateway/blocs/signup/signup_state.dart';
import 'package:gateway/components/Button.dart';
import 'package:gateway/components/TextField.dart' as Gw;
import 'package:gateway/models/auth/category_request.dart';
import 'package:gateway/models/requirement/category.dart';
import 'package:gateway/models/requirement/requirement.dart';
import 'package:gateway/pages/main/main_page.dart';
import 'package:gateway/utils/gateway_color.dart';
import 'package:gateway/components/Appbar.dart' as Gw;

class SelectRequirementPage extends StatelessWidget {
  static Route route(SignupBloc bloc) {
    return MaterialPageRoute<void>(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: bloc),
          BlocProvider(
            create: (_) => CategoryListCubit()..onLoadCategoryList(),
          ),
          BlocProvider(
            create: (_) => RequirementBloc(),
          ),
        ],
        child: SelectRequirementPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CategoryListCubit, List<Category>>(
          listener: (context, categories) {
            if (categories != null) {
              print(categories);
              BlocProvider.of<RequirementBloc>(context)
                ..add(
                  RequirementWillLoad(
                    categories: categories,
                  ),
                );
            }
          },
        ),
        BlocListener<SignupBloc, SignupState>(listener: (context, state){
          if ( state is SignupSuccess ){
            Navigator.of(context).push(MainPage.route());
          }
        }),
      ],
      child: Scaffold(
        backgroundColor: GatewayColor.white,
        appBar: this._appBar(),
        body: _body(context),
      ),
    );
  }
}

extension on SelectRequirementPage {
  Widget _appBar() => Gw.AppBar(
        preferredSize: Size.fromHeight(56),
        title: '',
        leftButtonExist: true,
        backgroundColor: GatewayColor.white,
      );

  Widget _body(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        width: _width,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<CategoryListCubit, List<Category>>(
          builder: (context, categories) {
            if (categories != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '인증 항목을 작성해주세요',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 29),
                  ...categories.map(
                    (category) => this._categoryRow(context, category),
                  ),
                  Expanded(child: SizedBox()),
                  Button(
                    margin: EdgeInsets.only(bottom: 16),
                    text: '완료',
                    onPressed: () {
                      BlocProvider.of<SignupBloc>(context)
                        ..add(SignupValueWillChange<List<CategoryRequest>>(
                          name: 'categories',
                          value: BlocProvider.of<RequirementBloc>(context)
                              .categoryRequests,
                        ));

                      BlocProvider.of<SignupBloc>(context)
                        ..add(SignupWillRegistered());
                    },
                  ),
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _categoryRow(BuildContext context, Category category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 26),
        ...category.requirements.map(
          (requirement) => this._requirementRow(context, category, requirement),
        )
      ],
    );
  }

  Widget _requirementRow(
      BuildContext context, Category category, Requirement requirement) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          requirement.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Column(
              children: [
                Gw.TextField(
                  height: 42.0,
                  hintText: '0',
                  width: 30,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  onChange: (value) {
                    BlocProvider.of<RequirementBloc>(context)
                        .add(RequirementInputWillChanged(
                      categoryUUID: category.uuid,
                      requirementUUID: requirement.uuid,
                      value: int.parse(value ?? 0),
                    ));
                  },
                  textStyle: TextStyle(
                    color: GatewayColor.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 6),
              ],
            ),
            Text(
              requirement.unit,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
