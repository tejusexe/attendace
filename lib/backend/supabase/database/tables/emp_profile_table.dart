import '../database.dart';

class EmpProfileTableTable extends SupabaseTable<EmpProfileTableRow> {
  @override
  String get tableName => 'empProfileTable';

  @override
  EmpProfileTableRow createRow(Map<String, dynamic> data) =>
      EmpProfileTableRow(data);
}

class EmpProfileTableRow extends SupabaseDataRow {
  EmpProfileTableRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EmpProfileTableTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  DateTime get doj => getField<DateTime>('doj')!;
  set doj(DateTime value) => setField<DateTime>('doj', value);

  DateTime get dob => getField<DateTime>('dob')!;
  set dob(DateTime value) => setField<DateTime>('dob', value);

  String get gender => getField<String>('gender')!;
  set gender(String value) => setField<String>('gender', value);
}
