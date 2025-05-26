// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkDurationStruct extends BaseStruct {
  WorkDurationStruct({
    double? numDayPresent,
    double? durationWorked,
  })  : _numDayPresent = numDayPresent,
        _durationWorked = durationWorked;

  // "numDayPresent" field.
  double? _numDayPresent;
  double get numDayPresent => _numDayPresent ?? 0.0;
  set numDayPresent(double? val) => _numDayPresent = val;

  void incrementNumDayPresent(double amount) =>
      numDayPresent = numDayPresent + amount;

  bool hasNumDayPresent() => _numDayPresent != null;

  // "durationWorked" field.
  double? _durationWorked;
  double get durationWorked => _durationWorked ?? 0.0;
  set durationWorked(double? val) => _durationWorked = val;

  void incrementDurationWorked(double amount) =>
      durationWorked = durationWorked + amount;

  bool hasDurationWorked() => _durationWorked != null;

  static WorkDurationStruct fromMap(Map<String, dynamic> data) =>
      WorkDurationStruct(
        numDayPresent: castToType<double>(data['numDayPresent']),
        durationWorked: castToType<double>(data['durationWorked']),
      );

  static WorkDurationStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkDurationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'numDayPresent': _numDayPresent,
        'durationWorked': _durationWorked,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'numDayPresent': serializeParam(
          _numDayPresent,
          ParamType.double,
        ),
        'durationWorked': serializeParam(
          _durationWorked,
          ParamType.double,
        ),
      }.withoutNulls;

  static WorkDurationStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkDurationStruct(
        numDayPresent: deserializeParam(
          data['numDayPresent'],
          ParamType.double,
          false,
        ),
        durationWorked: deserializeParam(
          data['durationWorked'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'WorkDurationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WorkDurationStruct &&
        numDayPresent == other.numDayPresent &&
        durationWorked == other.durationWorked;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([numDayPresent, durationWorked]);
}

WorkDurationStruct createWorkDurationStruct({
  double? numDayPresent,
  double? durationWorked,
}) =>
    WorkDurationStruct(
      numDayPresent: numDayPresent,
      durationWorked: durationWorked,
    );
