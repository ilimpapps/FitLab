import '../database.dart';

class UsersTrainingsTable extends SupabaseTable<UsersTrainingsRow> {
  @override
  String get tableName => 'users_trainings';

  @override
  UsersTrainingsRow createRow(Map<String, dynamic> data) =>
      UsersTrainingsRow(data);
}

class UsersTrainingsRow extends SupabaseDataRow {
  UsersTrainingsRow(super.data);

  @override
  SupabaseTable get table => UsersTrainingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get rlUsers => getField<String>('rl_users')!;
  set rlUsers(String value) => setField<String>('rl_users', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);

  DateTime? get trainingDate => getField<DateTime>('training_date');
  set trainingDate(DateTime? value) =>
      setField<DateTime>('training_date', value);

  int? get weekday => getField<int>('weekday');
  set weekday(int? value) => setField<int>('weekday', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get rating => getField<int>('rating');
  set rating(int? value) => setField<int>('rating', value);

  int? get myState => getField<int>('my_state');
  set myState(int? value) => setField<int>('my_state', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  int? get rlCoachTrainingsPlans => getField<int>('rl_coach_trainings_plans');
  set rlCoachTrainingsPlans(int? value) =>
      setField<int>('rl_coach_trainings_plans', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  List<DateTime> get trainingStartDates =>
      getListField<DateTime>('training_start_dates');
  set trainingStartDates(List<DateTime>? value) =>
      setListField<DateTime>('training_start_dates', value);

  List<DateTime> get trainingEndDates =>
      getListField<DateTime>('training_end_dates');
  set trainingEndDates(List<DateTime>? value) =>
      setListField<DateTime>('training_end_dates', value);
}
