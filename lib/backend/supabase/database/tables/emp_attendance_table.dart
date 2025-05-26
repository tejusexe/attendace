import '../database.dart';

class EmpAttendanceTableTable extends SupabaseTable<EmpAttendanceTableRow> {
  @override
  String get tableName => 'empAttendanceTable';

  @override
  EmpAttendanceTableRow createRow(Map<String, dynamic> data) =>
      EmpAttendanceTableRow(data);
}

class EmpAttendanceTableRow extends SupabaseDataRow {
  EmpAttendanceTableRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EmpAttendanceTableTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get uinqPunchDate => getField<String>('uinqPunchDate')!;
  set uinqPunchDate(String value) => setField<String>('uinqPunchDate', value);

  PostgresTime? get markIn => getField<PostgresTime>('markIn');
  set markIn(PostgresTime? value) => setField<PostgresTime>('markIn', value);

  PostgresTime? get markOut => getField<PostgresTime>('markOut');
  set markOut(PostgresTime? value) => setField<PostgresTime>('markOut', value);

  bool? get onLeave => getField<bool>('onLeave');
  set onLeave(bool? value) => setField<bool>('onLeave', value);

  String? get markInPic => getField<String>('markInPic');
  set markInPic(String? value) => setField<String>('markInPic', value);

  String? get markOutPic => getField<String>('markOutPic');
  set markOutPic(String? value) => setField<String>('markOutPic', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  bool? get markedIn => getField<bool>('markedIn');
  set markedIn(bool? value) => setField<bool>('markedIn', value);

  double get present => getField<double>('present')!;
  set present(double value) => setField<double>('present', value);

  double get takenleave => getField<double>('takenleave')!;
  set takenleave(double value) => setField<double>('takenleave', value);

  double? get hoursWorked => getField<double>('hoursWorked');
  set hoursWorked(double? value) => setField<double>('hoursWorked', value);

  String? get workStatus => getField<String>('WorkStatus');
  set workStatus(String? value) => setField<String>('WorkStatus', value);

  bool? get ismarkedout => getField<bool>('ismarkedout');
  set ismarkedout(bool? value) => setField<bool>('ismarkedout', value);

  String? get inlocation => getField<String>('inlocation');
  set inlocation(String? value) => setField<String>('inlocation', value);

  String? get outlocation => getField<String>('outlocation');
  set outlocation(String? value) => setField<String>('outlocation', value);
}
