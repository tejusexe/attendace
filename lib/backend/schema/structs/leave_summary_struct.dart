// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeaveSummaryStruct extends BaseStruct {
  LeaveSummaryStruct({
    List<DateTime>? leaveDates,
    double? leaveNumber,
  })  : _leaveDates = leaveDates,
        _leaveNumber = leaveNumber;

  // "LeaveDates" field.
  List<DateTime>? _leaveDates;
  List<DateTime> get leaveDates => _leaveDates ?? const [];
  set leaveDates(List<DateTime>? val) => _leaveDates = val;

  void updateLeaveDates(Function(List<DateTime>) updateFn) {
    updateFn(_leaveDates ??= []);
  }

  bool hasLeaveDates() => _leaveDates != null;

  // "leaveNumber" field.
  double? _leaveNumber;
  double get leaveNumber => _leaveNumber ?? 0.0;
  set leaveNumber(double? val) => _leaveNumber = val;

  void incrementLeaveNumber(double amount) =>
      leaveNumber = leaveNumber + amount;

  bool hasLeaveNumber() => _leaveNumber != null;

  static LeaveSummaryStruct fromMap(Map<String, dynamic> data) =>
      LeaveSummaryStruct(
        leaveDates: getDataList(data['LeaveDates']),
        leaveNumber: castToType<double>(data['leaveNumber']),
      );

  static LeaveSummaryStruct? maybeFromMap(dynamic data) => data is Map
      ? LeaveSummaryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'LeaveDates': _leaveDates,
        'leaveNumber': _leaveNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'LeaveDates': serializeParam(
          _leaveDates,
          ParamType.DateTime,
          isList: true,
        ),
        'leaveNumber': serializeParam(
          _leaveNumber,
          ParamType.double,
        ),
      }.withoutNulls;

  static LeaveSummaryStruct fromSerializableMap(Map<String, dynamic> data) =>
      LeaveSummaryStruct(
        leaveDates: deserializeParam<DateTime>(
          data['LeaveDates'],
          ParamType.DateTime,
          true,
        ),
        leaveNumber: deserializeParam(
          data['leaveNumber'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'LeaveSummaryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LeaveSummaryStruct &&
        listEquality.equals(leaveDates, other.leaveDates) &&
        leaveNumber == other.leaveNumber;
  }

  @override
  int get hashCode => const ListEquality().hash([leaveDates, leaveNumber]);
}

LeaveSummaryStruct createLeaveSummaryStruct({
  double? leaveNumber,
}) =>
    LeaveSummaryStruct(
      leaveNumber: leaveNumber,
    );
