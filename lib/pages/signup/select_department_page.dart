import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/blocs/collage/collage_bloc.dart';
import 'package:gateway/blocs/collage/collage_event.dart';
import 'package:gateway/blocs/collage/collage_state.dart';
import 'package:gateway/blocs/collage/department_select_cubit.dart';
import 'package:gateway/blocs/subject_type/subject_type_cubit.dart';
import 'package:gateway/models/department/collage.dart';
import 'package:gateway/models/department/department.dart';
import 'package:gateway/utils/gateway_color.dart';
import 'package:gateway/components/AppBar.dart' as Gateway;
import 'package:gateway/components/TextField.dart' as Gateway;
import 'package:gateway/components/SearchBar.dart' as Gateway;

class SelectDepartmentPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CollageBloc()..add(CollageWillLoad()),
          ),

        ],
        child: SelectDepartmentPage(),
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

extension on SelectDepartmentPage {
  Widget _appBar() => Gateway.AppBar(
        preferredSize: Size.fromHeight(56),
        title: '학과 선택',
        leftButtonExist: true,
        backgroundColor: GatewayColor.white,
      );

  Widget _body(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Gateway.SearchBar(
                hintText: '학과이름을 검색해주세요',
                onChange: (value) => BlocProvider.of<CollageBloc>(context)
                  ..add(
                    CollageSearchWillChanged(value),
                  ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              height: 16,
              color: GatewayColor.hintText.withOpacity(0.2),
            ),
            BlocBuilder<CollageBloc, CollageState>(
              builder: (context, state) {
                if (state is CollageLoadSuccess) {
                  return Expanded(
                    child: ListView(
                      children: [
                        SizedBox(height: 24),
                        ...state.filteredCollages.map(
                          (collage) => this
                              ._collageRow(context, collage, state.searchValue),
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _collageRow(
      BuildContext context, Collage collage, String searchValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            collage.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: GatewayColor.black,
            ),
          ),
        ),
        SizedBox(height: 8),
        ...collage.departments
            .map(
              (department) => _departmentRow(context, department, searchValue),
            )
            .toList(),
        SizedBox(height: 24),
      ],
    );
  }

  Widget _departmentRow(
      BuildContext context, Department department, String searchValue) {
    int index = department.name.indexOf(searchValue);
    String leftString = department.name.substring(0, index);
    String rightString = department.name
        .substring(index + searchValue.length, department.name.length);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(department);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: GatewayColor.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 0),
              blurRadius: 6,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            )
          ],
        ),
        child: Row(
          children: [
            Text(
              leftString,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: GatewayColor.black,
              ),
            ),
            Text(
              searchValue,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: GatewayColor.primary,
              ),
            ),
            Text(
              rightString,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: GatewayColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
