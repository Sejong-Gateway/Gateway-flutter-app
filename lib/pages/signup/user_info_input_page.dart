import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/blocs/collage/department_select_cubit.dart';
import 'package:gateway/blocs/signup/signup_bloc.dart';
import 'package:gateway/blocs/signup/signup_event.dart';
import 'package:gateway/components/Button.dart';
import 'package:gateway/models/department/department.dart';
import 'package:gateway/pages/signup/select_department_page.dart';
import 'package:gateway/pages/signup/select_subject_page.dart';
import 'package:gateway/utils/gateway_color.dart';
import 'package:gateway/components/Appbar.dart' as Gateway;
import 'package:gateway/components/TextField.dart' as Gateway;
import 'package:gateway/components/Checkbox.dart' as Gateway;
import 'package:gateway/components/Dropdown.dart' as Gateway;

class UserInfoInputPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => SignupBloc()..add(SignupWillLoad()),
          ),
          BlocProvider(
            create: (_) => DepartmentSelectCubit(),
          ),
        ],
        child: UserInfoInputPage(),
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

extension on UserInfoInputPage {
  Widget _appBar() => Gateway.AppBar(
        preferredSize: Size.fromHeight(56),
        title: '회원가입',
        leftButtonExist: true,
        backgroundColor: GatewayColor.white,
      );

  Widget _body(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            SizedBox(height: 24),
            Gateway.TextField(
              labelText: '학번',
              hintText: '학번을 입력해주세요 ',
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              onChange: (value) {
                BlocProvider.of<SignupBloc>(context)
                  ..add(
                    SignupValueWillChange<int>(
                      name: 'studentId',
                      value: int.parse(value),
                    ),
                  );
              },
            ),
            SizedBox(height: 36),
            Gateway.TextField(
              labelText: '비밀번호',
              hintText: '비밀번호를 입력해주세요 ',
              type: Gateway.TextFieldType.password,
              onChange: (value) {
                BlocProvider.of<SignupBloc>(context)
                  ..add(SignupValueWillChange<String>(
                    name: 'password',
                    value: value,
                  ));
              },
            ),
            SizedBox(height: 36),
            _semesterRow(context),
            SizedBox(height: 36),
            _departmentRow(context),
            SizedBox(height: 60),
            this._buttonRow(context),
          ],
        ),
      ),
    );
  }

  Widget _semesterRow(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '이수학기',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 13),
        Gateway.Dropdown(
          activeColors: Gateway.DropdownColors(
            textColor: GatewayColor.black,
            borderColor: GatewayColor.inactive,
          ),
          defaultColors: Gateway.DropdownColors(
            textColor: GatewayColor.hintText,
            borderColor: GatewayColor.inactive,
          ),
          items: [
            {'value': 1, 'label': '1학년 1학기'},
            {'value': 2, 'label': '1학년 2학기'},
            {'value': 3, 'label': '2학년 1학기'},
            {'value': 4, 'label': '2학년 2학기'},
            {'value': 5, 'label': '3학년 1학기'},
            {'value': 6, 'label': '3학년 2학기'},
            {'value': 7, 'label': '4학년 1학기'},
            {'value': 8, 'label': '4학년 2학기'},
            {'value': 9, 'label': '초과학기'},
          ],
          labelGetter: (item, index, items) => item['label'],
          onClickListItem: (item) => BlocProvider.of<SignupBloc>(context)
            ..add(
              SignupValueWillChange(
                name: 'semester',
                value: item['value'],
              ),
            ),
          hint: "이수학기를 선택해주세요",
        )
      ],
    );
  }

  Widget _departmentRow(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '학과',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 13),
        GestureDetector(
          onTap: () async {
            final department =
                await Navigator.of(context).push(SelectDepartmentPage.route());

            BlocProvider.of<SignupBloc>(context)
              ..add(
                SignupValueWillChange(
                  name: 'departmentUUID',
                  value: department.uuid,
                ),
              );

            BlocProvider.of<DepartmentSelectCubit>(context)
              ..onSelectDepartment(department);
          },
          child: BlocBuilder<DepartmentSelectCubit, Department>(
            builder: (context, state) {
              return Container(
                height: 48,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: GatewayColor.inactive),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      state == null ? '학과를 선택해주세요' : state.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: state == null
                            ? GatewayColor.hintText
                            : GatewayColor.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buttonRow(BuildContext context) {
    return Button(
      borderRadius: BorderRadius.circular(4),
      height: 48,
      text: '회원가입',
      onPressed: () {
        Navigator.of(context).push(
          SelectSubjectPage.route(
            BlocProvider.of<SignupBloc>(context),
          ),
        );
      },
    );
  }
}
