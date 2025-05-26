import '../database.dart';

class UserProfileTable extends SupabaseTable<UserProfileRow> {
  @override
  String get tableName => 'userProfile';

  @override
  UserProfileRow createRow(Map<String, dynamic> data) => UserProfileRow(data);
}

class UserProfileRow extends SupabaseDataRow {
  UserProfileRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserProfileTable();

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  String? get firstName => getField<String>('first name');
  set firstName(String? value) => setField<String>('first name', value);

  String? get lastName => getField<String>('last name');
  set lastName(String? value) => setField<String>('last name', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);

  String? get designation => getField<String>('designation');
  set designation(String? value) => setField<String>('designation', value);

  String? get empId => getField<String>('empId');
  set empId(String? value) => setField<String>('empId', value);
}
