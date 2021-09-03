import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/blocs/auth/current_user_cuibt.dart';
import 'package:gateway/blocs/subject_type/subject_type_cubit.dart';
import 'package:gateway/components/indicator_view.dart';
import 'package:gateway/components/subject_row.dart';
import 'package:gateway/models/auth/user.dart';
import 'package:gateway/models/subject/subject.dart';
import 'package:gateway/models/subject/subject_type.dart';
import 'package:gateway/utils/gateway_color.dart';
import 'package:gateway/components/Button.dart' as Gateway;

class RemainSubjectsTab extends StatelessWidget {
  final User user;

  const RemainSubjectsTab({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Gateway.Button(
                positiveColors: Gateway.ButtonColors(
                  backgroundColor: Colors.white,
                  textColor: GatewayColor.primary,
                  borderColor: GatewayColor.primary,
                ),
                borderRadius: BorderRadius.circular(20),
                width: 84,
                height: 25,
                fontSize: 12,
                text: "전공",
              ),
              SizedBox(
                width: 11,
              ),
              Gateway.Button(
                positiveColors: Gateway.ButtonColors(
                  backgroundColor: Colors.white,
                  textColor: GatewayColor.primary,
                  borderColor: GatewayColor.primary,
                ),
                borderRadius: BorderRadius.circular(20),
                width: 84,
                height: 25,
                fontSize: 12,
                text: "교양",
              ),
            ],
          ),
        ),
        SizedBox(
          height: 23,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '앞으로 들어야할 과목',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        BlocBuilder<SubjectTypeCubit, List<SubjectType>>(
          builder: (context, types) {
            if (types != null) {
              return Column(
                children: [
                  ...types.map(
                        (type) => Column(
                      children: [
                        this._modify(type.name),
                        SizedBox(height: 10),
                        ...user.remainSubjects
                            .where(
                                (subject) => subject.type.uuid == type.uuid)
                            .map(
                              (Subject subject) =>
                              SubjectRow(subject: subject),
                        ),
                        SizedBox(height: 22),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ],
    );
  }

  Widget _modify(String labelText1) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            labelText1,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
