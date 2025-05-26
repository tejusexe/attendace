import '../database.dart';

class UniqueIdsTableTable extends SupabaseTable<UniqueIdsTableRow> {
  @override
  String get tableName => 'unique_ids_table';

  @override
  UniqueIdsTableRow createRow(Map<String, dynamic> data) =>
      UniqueIdsTableRow(data);
}

class UniqueIdsTableRow extends SupabaseDataRow {
  UniqueIdsTableRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UniqueIdsTableTable();

  String get uniqueIdCol => getField<String>('unique_id_col')!;
  set uniqueIdCol(String value) => setField<String>('unique_id_col', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
