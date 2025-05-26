// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PresentSummaryStruct extends BaseStruct {
  PresentSummaryStruct({
    List<DateTime>? presentdatesList,
    double? presentdaysNum,
  })  : _presentdatesList = presentdatesList,
        _presentdaysNum = presentdaysNum;

  // "presentdatesList" field.
  List<DateTime>? _presentdatesList;
  List<DateTime> get presentdatesList => _presentdatesList ?? const [];
  set presentdatesList(List<DateTime>? val) => _presentdatesList = val;

  void updatePresentdatesList(Function(List<DateTime>) updateFn) {
    updateFn(_presentdatesList ??= []);
  }

  bool hasPresentdatesList() => _presentdatesList != null;

  // "presentdaysNum" field.
  double? _presentdaysNum;
  double get presentdaysNum => _presentdaysNum ?? 0.0;
  set presentdaysNum(double? val) => _presentdaysNum = val;

  void incrementPresentdaysNum(double amount) =>
      presentdaysNum = presentdaysNum + amount;

  bool hasPresentdaysNum() => _presentdaysNum != null;

  static PresentSummaryStruct fromMap(Map<String, dynamic> data) =>
      PresentSummaryStruct(
        presentdatesList: getDataList(data['presentdatesList']),
        presentdaysNum: castToType<double>(data['presentdaysNum']),
      );

  static PresentSummaryStruct? maybeFromMap(dynamic data) => data is Map
      ? PresentSummaryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'presentdatesList': _presentdatesList,
        'presentdaysNum': _presentdaysNum,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'presentdatesList': serializeParam(
          _presentdatesList,
          ParamType.DateTime,
          isList: true,
        ),
        'presentdaysNum': serializeParam(
          _presentdaysNum,
          ParamType.double,
        ),
      }.withoutNulls;

  static PresentSummaryStruct fromSerializableMap(Map<String, dynamic> data) =>
      PresentSummaryStruct(
        presentdatesList: deserializeParam<DateTime>(
          data['presentdatesList'],
          ParamType.DateTime,
          true,
        ),
        presentdaysNum: deserializeParam(
          data['presentdaysNum'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PresentSummaryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PresentSummaryStruct &&
        listEquality.equals(presentdatesList, other.presentdatesList) &&
        presentdaysNum == other.presentdaysNum;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([presentdatesList, presentdaysNum]);
}

PresentSummaryStruct createPresentSummaryStruct({
  double? presentdaysNum,
}) =>
    PresentSummaryStruct(
      presentdaysNum: presentdaysNum,
    );
