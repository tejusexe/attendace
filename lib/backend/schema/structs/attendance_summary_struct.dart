// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceSummaryStruct extends BaseStruct {
  AttendanceSummaryStruct({
    LeaveSummaryStruct? leaveSummary,
    AbsentSummaryStruct? absentSummary,
    PresentSummaryStruct? presentSummary,
  })  : _leaveSummary = leaveSummary,
        _absentSummary = absentSummary,
        _presentSummary = presentSummary;

  // "leaveSummary" field.
  LeaveSummaryStruct? _leaveSummary;
  LeaveSummaryStruct get leaveSummary => _leaveSummary ?? LeaveSummaryStruct();
  set leaveSummary(LeaveSummaryStruct? val) => _leaveSummary = val;

  void updateLeaveSummary(Function(LeaveSummaryStruct) updateFn) {
    updateFn(_leaveSummary ??= LeaveSummaryStruct());
  }

  bool hasLeaveSummary() => _leaveSummary != null;

  // "absentSummary" field.
  AbsentSummaryStruct? _absentSummary;
  AbsentSummaryStruct get absentSummary =>
      _absentSummary ?? AbsentSummaryStruct();
  set absentSummary(AbsentSummaryStruct? val) => _absentSummary = val;

  void updateAbsentSummary(Function(AbsentSummaryStruct) updateFn) {
    updateFn(_absentSummary ??= AbsentSummaryStruct());
  }

  bool hasAbsentSummary() => _absentSummary != null;

  // "presentSummary" field.
  PresentSummaryStruct? _presentSummary;
  PresentSummaryStruct get presentSummary =>
      _presentSummary ?? PresentSummaryStruct();
  set presentSummary(PresentSummaryStruct? val) => _presentSummary = val;

  void updatePresentSummary(Function(PresentSummaryStruct) updateFn) {
    updateFn(_presentSummary ??= PresentSummaryStruct());
  }

  bool hasPresentSummary() => _presentSummary != null;

  static AttendanceSummaryStruct fromMap(Map<String, dynamic> data) =>
      AttendanceSummaryStruct(
        leaveSummary: data['leaveSummary'] is LeaveSummaryStruct
            ? data['leaveSummary']
            : LeaveSummaryStruct.maybeFromMap(data['leaveSummary']),
        absentSummary: data['absentSummary'] is AbsentSummaryStruct
            ? data['absentSummary']
            : AbsentSummaryStruct.maybeFromMap(data['absentSummary']),
        presentSummary: data['presentSummary'] is PresentSummaryStruct
            ? data['presentSummary']
            : PresentSummaryStruct.maybeFromMap(data['presentSummary']),
      );

  static AttendanceSummaryStruct? maybeFromMap(dynamic data) => data is Map
      ? AttendanceSummaryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'leaveSummary': _leaveSummary?.toMap(),
        'absentSummary': _absentSummary?.toMap(),
        'presentSummary': _presentSummary?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'leaveSummary': serializeParam(
          _leaveSummary,
          ParamType.DataStruct,
        ),
        'absentSummary': serializeParam(
          _absentSummary,
          ParamType.DataStruct,
        ),
        'presentSummary': serializeParam(
          _presentSummary,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AttendanceSummaryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AttendanceSummaryStruct(
        leaveSummary: deserializeStructParam(
          data['leaveSummary'],
          ParamType.DataStruct,
          false,
          structBuilder: LeaveSummaryStruct.fromSerializableMap,
        ),
        absentSummary: deserializeStructParam(
          data['absentSummary'],
          ParamType.DataStruct,
          false,
          structBuilder: AbsentSummaryStruct.fromSerializableMap,
        ),
        presentSummary: deserializeStructParam(
          data['presentSummary'],
          ParamType.DataStruct,
          false,
          structBuilder: PresentSummaryStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AttendanceSummaryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AttendanceSummaryStruct &&
        leaveSummary == other.leaveSummary &&
        absentSummary == other.absentSummary &&
        presentSummary == other.presentSummary;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([leaveSummary, absentSummary, presentSummary]);
}

AttendanceSummaryStruct createAttendanceSummaryStruct({
  LeaveSummaryStruct? leaveSummary,
  AbsentSummaryStruct? absentSummary,
  PresentSummaryStruct? presentSummary,
}) =>
    AttendanceSummaryStruct(
      leaveSummary: leaveSummary ?? LeaveSummaryStruct(),
      absentSummary: absentSummary ?? AbsentSummaryStruct(),
      presentSummary: presentSummary ?? PresentSummaryStruct(),
    );
