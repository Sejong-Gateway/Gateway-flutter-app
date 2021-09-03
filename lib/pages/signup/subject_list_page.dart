import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/blocs/subject/subject_bloc.dart';
import 'package:gateway/blocs/subject/subject_event.dart';
import 'package:gateway/blocs/subject/subject_state.dart';
import 'package:gateway/blocs/subject_select/subject_select_cubit.dart';
import 'package:gateway/models/subject/subject.dart';
import 'package:gateway/utils/gateway_color.dart';
import 'package:gateway/components/Appbar.dart' as Gw;

class SubjectListPage extends StatelessWidget {
  final String typeUUID;
  final String departmentUUID;
  final List<String> previousUUIDs;
  final bool isCheckPrevious;

  const SubjectListPage({
    Key key,
    this.typeUUID,
    this.departmentUUID,
    this.previousUUIDs,
    this.isCheckPrevious = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SubjectBloc()
        ..add(
          SubjectWillLoad(
            typeUUID: this.typeUUID,
            departmentUUID: this.departmentUUID,
          ),
        ),
      child: this._body(context),
    );
  }
}

extension on SubjectListPage {
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
      height: _height,
      child: BlocBuilder<SubjectBloc, SubjectState>(
        builder: (context, state) {
          if (state is SubjectLoadSuccess) {
            return BlocBuilder<SubjectSelectCubit, List<String>>(
                builder: (context, subjectUUIDs) {
              return Wrap(
                children: [
                  // ...state.subjects.
                  // where((subject) => !this.isCheckPrevious || !(this.previousUUIDs.any((uuid) => uuid == subject.uuid)) ).map(
                  //   (subject) => this._subjectBox(context, _width, subject),
                  // )
                  ...state.subjects.map((subject) {
                    bool isDisabled = this.isCheckPrevious &&
                        (this
                            .previousUUIDs
                            .any((uuid) => uuid == subject.uuid));
                    return this._subjectBox(context, _width, subject, isDisabled);
                  })
                ],
              );
            });
          } else {
            return SizedBox();
          }
        },
      ),
    ));
  }

  Widget _subjectBox(BuildContext context, double width, Subject subject, bool disabled) {
    bool isSelect = BlocProvider.of<SubjectSelectCubit>(context)
            .state
            .indexOf(subject.uuid) !=
        -1;
    return GestureDetector(
      onTap: () {
        if ( disabled ) return;
        if (isSelect) {
          BlocProvider.of<SubjectSelectCubit>(context)
            ..onRemoveSubject(subject.uuid);
        } else {
          BlocProvider.of<SubjectSelectCubit>(context)
            ..onAddSubject(subject.uuid);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: (width - 68) / 2,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: disabled ? GatewayColor.hintText : isSelect ? GatewayColor.primary : GatewayColor.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 0),
              blurRadius: 6,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            subject.name,
            style: TextStyle(
              color: disabled ? GatewayColor.black : isSelect ? GatewayColor.white : GatewayColor.primary,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
