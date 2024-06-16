import '../database.dart';

class PassedTrainingsTable extends SupabaseTable<PassedTrainingsRow> {
  @override
  String get tableName => 'passed_trainings';

  @override
  PassedTrainingsRow createRow(Map<String, dynamic> data) =>
      PassedTrainingsRow(data);
}

class PassedTrainingsRow extends SupabaseDataRow {
  PassedTrainingsRow(super.data);

  @override
  SupabaseTable get table => PassedTrainingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get rlUser => getField<String>('rl_user');
  set rlUser(String? value) => setField<String>('rl_user', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  int? get rlTraining => getField<int>('rl_training');
  set rlTraining(int? value) => setField<int>('rl_training', value);

  int? get rating => getField<int>('rating');
  set rating(int? value) => setField<int>('rating', value);

  int? get userFeeling => getField<int>('user_feeling');
  set userFeeling(int? value) => setField<int>('user_feeling', value);

  String? get trainingComment => getField<String>('training_comment');
  set trainingComment(String? value) =>
      setField<String>('training_comment', value);

  int? get trainingProgress => getField<int>('training_progress');
  set trainingProgress(int? value) => setField<int>('training_progress', value);

  String? get trainingName => getField<String>('training_name');
  set trainingName(String? value) => setField<String>('training_name', value);

  DateTime? get startTraining => getField<DateTime>('start_training');
  set startTraining(DateTime? value) =>
      setField<DateTime>('start_training', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);
}
