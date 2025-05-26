import '../database.dart';

class EmpAttendanceTableDuplicateTable
    extends SupabaseTable<EmpAttendanceTableDuplicateRow> {
  @override
  String get tableName => 'empAttendanceTable_duplicate';

  @override
  EmpAttendanceTableDuplicateRow createRow(Map<String, dynamic> data) =>
      EmpAttendanceTableDuplicateRow(data);
}

class EmpAttendanceTableDuplicateRow extends SupabaseDataRow {
  EmpAttendanceTableDuplicateRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EmpAttendanceTableDuplicateTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get uinqPunchDate => getField<String>('uinqPunchDate')!;
  set uinqPunchDate(String value) => setField<String>('uinqPunchDate', value);

  PostgresTime? get markIn => getField<PostgresTime>('markIn');
  set markIn(PostgresTime? value) => setField<PostgresTime>('markIn', value);

  PostgresTime? get markOut => getField<PostgresTime>('markOut');
  set markOut(PostgresTime? value) => setField<PostgresTime>('markOut', value);

  bool get onLeave => getField<bool>('onLeave')!;
  set onLeave(bool value) => setField<bool>('onLeave', value);

  String get markInPic => getField<String>('markInPic')!;
  set markInPic(String value) => setField<String>('markInPic', value);

  String get markOutPic => getField<String>('markOutPic')!;
  set markOutPic(String value) => setField<String>('markOutPic', value);

  DateTime get date => getField<DateTime>('date')!;
  set date(DateTime value) => setField<DateTime>('date', value);
}
