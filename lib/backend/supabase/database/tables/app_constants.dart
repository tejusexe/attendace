import '../database.dart';

class AppConstantsTable extends SupabaseTable<AppConstantsRow> {
  @override
  String get tableName => 'appConstants';

  @override
  AppConstantsRow createRow(Map<String, dynamic> data) => AppConstantsRow(data);
}

class AppConstantsRow extends SupabaseDataRow {
  AppConstantsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppConstantsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  int? get radiusToNearby => getField<int>('radiusToNearby');
  set radiusToNearby(int? value) => setField<int>('radiusToNearby', value);
}
