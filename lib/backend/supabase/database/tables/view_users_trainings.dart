import '../database.dart';

class ViewUsersTrainingsTable extends SupabaseTable<ViewUsersTrainingsRow> {
  @override
  String get tableName => 'view_users_trainings';

  @override
  ViewUsersTrainingsRow createRow(Map<String, dynamic> data) =>
      ViewUsersTrainingsRow(data);
}

class ViewUsersTrainingsRow extends SupabaseDataRow {
  ViewUsersTrainingsRow(super.data);

  @override
  SupabaseTable get table => ViewUsersTrainingsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get rlUsers => getField<String>('rl_users');
  set rlUsers(String? value) => setField<String>('rl_users', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);

  int? get weekday => getField<int>('weekday');
  set weekday(int? value) => setField<int>('weekday', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  String? get coachName => getField<String>('coach_name');
  set coachName(String? value) => setField<String>('coach_name', value);

  String? get coachSurname => getField<String>('coach_surname');
  set coachSurname(String? value) => setField<String>('coach_surname', value);

  String? get coachPhotoUrl => getField<String>('coach_photo_url');
  set coachPhotoUrl(String? value) =>
      setField<String>('coach_photo_url', value);

  String? get usersName => getField<String>('users_name');
  set usersName(String? value) => setField<String>('users_name', value);

  String? get usersSurname => getField<String>('users_surname');
  set usersSurname(String? value) => setField<String>('users_surname', value);

  String? get usersPhotoUrl => getField<String>('users_photo_url');
  set usersPhotoUrl(String? value) =>
      setField<String>('users_photo_url', value);

  int? get exercisesCount => getField<int>('exercises_count');
  set exercisesCount(int? value) => setField<int>('exercises_count', value);
}
