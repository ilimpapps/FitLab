import '../database.dart';

class ViewPlanToUserTable extends SupabaseTable<ViewPlanToUserRow> {
  @override
  String get tableName => 'view_plan_to_user';

  @override
  ViewPlanToUserRow createRow(Map<String, dynamic> data) =>
      ViewPlanToUserRow(data);
}

class ViewPlanToUserRow extends SupabaseDataRow {
  ViewPlanToUserRow(super.data);

  @override
  SupabaseTable get table => ViewPlanToUserTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get surname => getField<String>('surname');
  set surname(String? value) => setField<String>('surname', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  DateTime? get birthDate => getField<DateTime>('birth_date');
  set birthDate(DateTime? value) => setField<DateTime>('birth_date', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  bool? get isCoach => getField<bool>('is_coach');
  set isCoach(bool? value) => setField<bool>('is_coach', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  double? get coachRating => getField<double>('coach_rating');
  set coachRating(double? value) => setField<double>('coach_rating', value);

  String? get coachFeedback => getField<String>('coach_feedback');
  set coachFeedback(String? value) => setField<String>('coach_feedback', value);

  String? get coachActivities => getField<String>('coach_activities');
  set coachActivities(String? value) =>
      setField<String>('coach_activities', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);

  DateTime? get usersTrainingsEndDate =>
      getField<DateTime>('users_trainings_end_date');
  set usersTrainingsEndDate(DateTime? value) =>
      setField<DateTime>('users_trainings_end_date', value);

  bool? get hasTraining => getField<bool>('has_training');
  set hasTraining(bool? value) => setField<bool>('has_training', value);

  int? get totalWeekday => getField<int>('total_weekday');
  set totalWeekday(int? value) => setField<int>('total_weekday', value);
}
