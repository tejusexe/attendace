// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DebugVariableStruct extends BaseStruct {
  DebugVariableStruct({
    EmployeeAttendanceStruct? row,
    String? inputDate,
    String? outputDate,
  })  : _row = row,
        _inputDate = inputDate,
        _outputDate = outputDate;

  // "row" field.
  EmployeeAttendanceStruct? _row;
  EmployeeAttendanceStruct get row => _row ?? EmployeeAttendanceStruct();
  set row(EmployeeAttendanceStruct? val) => _row = val;

  void updateRow(Function(EmployeeAttendanceStruct) updateFn) {
    updateFn(_row ??= EmployeeAttendanceStruct());
  }

  bool hasRow() => _row != null;

  // "inputDate" field.
  String? _inputDate;
  String get inputDate => _inputDate ?? '';
  set inputDate(String? val) => _inputDate = val;

  bool hasInputDate() => _inputDate != null;

  // "outputDate" field.
  String? _outputDate;
  String get outputDate => _outputDate ?? '';
  set outputDate(String? val) => _outputDate = val;

  bool hasOutputDate() => _outputDate != null;

  static DebugVariableStruct fromMap(Map<String, dynamic> data) =>
      DebugVariableStruct(
        row: data['row'] is EmployeeAttendanceStruct
            ? data['row']
            : EmployeeAttendanceStruct.maybeFromMap(data['row']),
        inputDate: data['inputDate'] as String?,
        outputDate: data['outputDate'] as String?,
      );

  static DebugVariableStruct? maybeFromMap(dynamic data) => data is Map
      ? DebugVariableStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'row': _row?.toMap(),
        'inputDate': _inputDate,
        'outputDate': _outputDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'row': serializeParam(
          _row,
          ParamType.DataStruct,
        ),
        'inputDate': serializeParam(
          _inputDate,
          ParamType.String,
        ),
        'outputDate': serializeParam(
          _outputDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static DebugVariableStruct fromSerializableMap(Map<String, dynamic> data) =>
      DebugVariableStruct(
        row: deserializeStructParam(
          data['row'],
          ParamType.DataStruct,
          false,
          structBuilder: EmployeeAttendanceStruct.fromSerializableMap,
        ),
        inputDate: deserializeParam(
          data['inputDate'],
          ParamType.String,
          false,
        ),
        outputDate: deserializeParam(
          data['outputDate'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DebugVariableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DebugVariableStruct &&
        row == other.row &&
        inputDate == other.inputDate &&
        outputDate == other.outputDate;
  }

  @override
  int get hashCode => const ListEquality().hash([row, inputDate, outputDate]);
}

DebugVariableStruct createDebugVariableStruct({
  EmployeeAttendanceStruct? row,
  String? inputDate,
  String? outputDate,
}) =>
    DebugVariableStruct(
      row: row ?? EmployeeAttendanceStruct(),
      inputDate: inputDate,
      outputDate: outputDate,
    );
