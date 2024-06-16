import '../database.dart';

class PlanTemplateTable extends SupabaseTable<PlanTemplateRow> {
  @override
  String get tableName => 'plan_template';

  @override
  PlanTemplateRow createRow(Map<String, dynamic> data) => PlanTemplateRow(data);
}

class PlanTemplateRow extends SupabaseDataRow {
  PlanTemplateRow(super.data);

  @override
  SupabaseTable get table => PlanTemplateTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  dynamic get plan => getField<dynamic>('plan');
  set plan(dynamic value) => setField<dynamic>('plan', value);
}
