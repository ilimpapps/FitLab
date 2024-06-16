import '../database.dart';

class ViewChatsMessagesTable extends SupabaseTable<ViewChatsMessagesRow> {
  @override
  String get tableName => 'view_chats_messages';

  @override
  ViewChatsMessagesRow createRow(Map<String, dynamic> data) =>
      ViewChatsMessagesRow(data);
}

class ViewChatsMessagesRow extends SupabaseDataRow {
  ViewChatsMessagesRow(super.data);

  @override
  SupabaseTable get table => ViewChatsMessagesTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get rlUsers => getField<String>('rl_users');
  set rlUsers(String? value) => setField<String>('rl_users', value);

  int? get rlChats => getField<int>('rl_chats');
  set rlChats(int? value) => setField<int>('rl_chats', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  String? get sticker => getField<String>('sticker');
  set sticker(String? value) => setField<String>('sticker', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);

  String? get video => getField<String>('video');
  set video(String? value) => setField<String>('video', value);

  int? get rlTraining => getField<int>('rl_training');
  set rlTraining(int? value) => setField<int>('rl_training', value);

  int? get rlExcercise => getField<int>('rl_excercise');
  set rlExcercise(int? value) => setField<int>('rl_excercise', value);

  String? get usersName => getField<String>('users_name');
  set usersName(String? value) => setField<String>('users_name', value);

  String? get usersSurname => getField<String>('users_surname');
  set usersSurname(String? value) => setField<String>('users_surname', value);

  String? get usersPhotoUrl => getField<String>('users_photo_url');
  set usersPhotoUrl(String? value) =>
      setField<String>('users_photo_url', value);

  String? get usersTrainingsName => getField<String>('users_trainings_name');
  set usersTrainingsName(String? value) =>
      setField<String>('users_trainings_name', value);

  String? get exercisesName => getField<String>('exercises_name');
  set exercisesName(String? value) => setField<String>('exercises_name', value);
}
