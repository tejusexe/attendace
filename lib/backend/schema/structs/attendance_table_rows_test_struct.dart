// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceTableRowsTestStruct extends BaseStruct {
  AttendanceTableRowsTestStruct({
    String? uniqueId,
    DateTime? date,
    double? present,
    double? leave,
  })  : _uniqueId = uniqueId,
        _date = date,
        _present = present,
        _leave = leave;

  // "uniqueId" field.
  String? _uniqueId;
  String get uniqueId => _uniqueId ?? '';
  set uniqueId(String? val) => _uniqueId = val;

  bool hasUniqueId() => _uniqueId != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "present" field.
  double? _present;
  double get present => _present ?? 0.0;
  set present(double? val) => _present = val;

  void incrementPresent(double amount) => present = present + amount;

  bool hasPresent() => _present != null;

  // "leave" field.
  double? _leave;
  double get leave => _leave ?? 0.0;
  set leave(double? val) => _leave = val;

  void incrementLeave(double amount) => leave = leave + amount;

  bool hasLeave() => _leave != null;

  static AttendanceTableRowsTestStruct fromMap(Map<String, dynamic> data) =>
      AttendanceTableRowsTestStruct(
        uniqueId: data['uniqueId'] as String?,
        date: data['Date'] as DateTime?,
        present: castToType<double>(data['present']),
        leave: castToType<double>(data['leave']),
      );

  static AttendanceTableRowsTestStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? AttendanceTableRowsTestStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'uniqueId': _uniqueId,
        'Date': _date,
        'present': _present,
        'leave': _leave,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uniqueId': serializeParam(
          _uniqueId,
          ParamType.String,
        ),
        'Date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'present': serializeParam(
          _present,
          ParamType.double,
        ),
        'leave': serializeParam(
          _leave,
          ParamType.double,
        ),
      }.withoutNulls;

  static AttendanceTableRowsTestStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AttendanceTableRowsTestStruct(
        uniqueId: deserializeParam(
          data['uniqueId'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['Date'],
          ParamType.DateTime,
          false,
        ),
        present: deserializeParam(
          data['present'],
          ParamType.double,
          false,
        ),
        leave: deserializeParam(
          data['leave'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'AttendanceTableRowsTestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AttendanceTableRowsTestStruct &&
        uniqueId == other.uniqueId &&
        date == other.date &&
        present == other.present &&
        leave == other.leave;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([uniqueId, date, present, leave]);
}

AttendanceTableRowsTestStruct createAttendanceTableRowsTestStruct({
  String? uniqueId,
  DateTime? date,
  double? present,
  double? leave,
}) =>
    AttendanceTableRowsTestStruct(
      uniqueId: uniqueId,
      date: date,
      present: present,
      leave: leave,
    );
