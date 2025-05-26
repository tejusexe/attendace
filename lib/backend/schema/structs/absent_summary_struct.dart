// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AbsentSummaryStruct extends BaseStruct {
  AbsentSummaryStruct({
    List<DateTime>? absentDates,
    double? absentDaysNum,
  })  : _absentDates = absentDates,
        _absentDaysNum = absentDaysNum;

  // "absentDates" field.
  List<DateTime>? _absentDates;
  List<DateTime> get absentDates => _absentDates ?? const [];
  set absentDates(List<DateTime>? val) => _absentDates = val;

  void updateAbsentDates(Function(List<DateTime>) updateFn) {
    updateFn(_absentDates ??= []);
  }

  bool hasAbsentDates() => _absentDates != null;

  // "absentDaysNum" field.
  double? _absentDaysNum;
  double get absentDaysNum => _absentDaysNum ?? 0.0;
  set absentDaysNum(double? val) => _absentDaysNum = val;

  void incrementAbsentDaysNum(double amount) =>
      absentDaysNum = absentDaysNum + amount;

  bool hasAbsentDaysNum() => _absentDaysNum != null;

  static AbsentSummaryStruct fromMap(Map<String, dynamic> data) =>
      AbsentSummaryStruct(
        absentDates: getDataList(data['absentDates']),
        absentDaysNum: castToType<double>(data['absentDaysNum']),
      );

  static AbsentSummaryStruct? maybeFromMap(dynamic data) => data is Map
      ? AbsentSummaryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'absentDates': _absentDates,
        'absentDaysNum': _absentDaysNum,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'absentDates': serializeParam(
          _absentDates,
          ParamType.DateTime,
          isList: true,
        ),
        'absentDaysNum': serializeParam(
          _absentDaysNum,
          ParamType.double,
        ),
      }.withoutNulls;

  static AbsentSummaryStruct fromSerializableMap(Map<String, dynamic> data) =>
      AbsentSummaryStruct(
        absentDates: deserializeParam<DateTime>(
          data['absentDates'],
          ParamType.DateTime,
          true,
        ),
        absentDaysNum: deserializeParam(
          data['absentDaysNum'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'AbsentSummaryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AbsentSummaryStruct &&
        listEquality.equals(absentDates, other.absentDates) &&
        absentDaysNum == other.absentDaysNum;
  }

  @override
  int get hashCode => const ListEquality().hash([absentDates, absentDaysNum]);
}

AbsentSummaryStruct createAbsentSummaryStruct({
  double? absentDaysNum,
}) =>
    AbsentSummaryStruct(
      absentDaysNum: absentDaysNum,
    );
