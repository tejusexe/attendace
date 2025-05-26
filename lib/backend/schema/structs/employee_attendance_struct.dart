// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmployeeAttendanceStruct extends BaseStruct {
  EmployeeAttendanceStruct({
    int? id,
    DateTime? createdAt,
    String? uniqPunchdate,
    DateTime? markin,
    DateTime? markout,
  })  : _id = id,
        _createdAt = createdAt,
        _uniqPunchdate = uniqPunchdate,
        _markin = markin,
        _markout = markout;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "uniqPunchdate" field.
  String? _uniqPunchdate;
  String get uniqPunchdate => _uniqPunchdate ?? '';
  set uniqPunchdate(String? val) => _uniqPunchdate = val;

  bool hasUniqPunchdate() => _uniqPunchdate != null;

  // "markin" field.
  DateTime? _markin;
  DateTime? get markin => _markin;
  set markin(DateTime? val) => _markin = val;

  bool hasMarkin() => _markin != null;

  // "markout" field.
  DateTime? _markout;
  DateTime? get markout => _markout;
  set markout(DateTime? val) => _markout = val;

  bool hasMarkout() => _markout != null;

  static EmployeeAttendanceStruct fromMap(Map<String, dynamic> data) =>
      EmployeeAttendanceStruct(
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as DateTime?,
        uniqPunchdate: data['uniqPunchdate'] as String?,
        markin: data['markin'] as DateTime?,
        markout: data['markout'] as DateTime?,
      );

  static EmployeeAttendanceStruct? maybeFromMap(dynamic data) => data is Map
      ? EmployeeAttendanceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'uniqPunchdate': _uniqPunchdate,
        'markin': _markin,
        'markout': _markout,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'uniqPunchdate': serializeParam(
          _uniqPunchdate,
          ParamType.String,
        ),
        'markin': serializeParam(
          _markin,
          ParamType.DateTime,
        ),
        'markout': serializeParam(
          _markout,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static EmployeeAttendanceStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EmployeeAttendanceStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        uniqPunchdate: deserializeParam(
          data['uniqPunchdate'],
          ParamType.String,
          false,
        ),
        markin: deserializeParam(
          data['markin'],
          ParamType.DateTime,
          false,
        ),
        markout: deserializeParam(
          data['markout'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'EmployeeAttendanceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EmployeeAttendanceStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        uniqPunchdate == other.uniqPunchdate &&
        markin == other.markin &&
        markout == other.markout;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, createdAt, uniqPunchdate, markin, markout]);
}

EmployeeAttendanceStruct createEmployeeAttendanceStruct({
  int? id,
  DateTime? createdAt,
  String? uniqPunchdate,
  DateTime? markin,
  DateTime? markout,
}) =>
    EmployeeAttendanceStruct(
      id: id,
      createdAt: createdAt,
      uniqPunchdate: uniqPunchdate,
      markin: markin,
      markout: markout,
    );
