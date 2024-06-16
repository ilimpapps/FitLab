import '../database.dart';

class ChatsMessagesTable extends SupabaseTable<ChatsMessagesRow> {
  @override
  String get tableName => 'chats_messages';

  @override
  ChatsMessagesRow createRow(Map<String, dynamic> data) =>
      ChatsMessagesRow(data);
}

class ChatsMessagesRow extends SupabaseDataRow {
  ChatsMessagesRow(super.data);

  @override
  SupabaseTable get table => ChatsMessagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

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

  DateTime? get trainingDateTime => getField<DateTime>('training_date_time');
  set trainingDateTime(DateTime? value) =>
      setField<DateTime>('training_date_time', value);

  int? get rlUsersTraining => getField<int>('rl_users_training');
  set rlUsersTraining(int? value) => setField<int>('rl_users_training', value);

  String? get trainingName => getField<String>('training_name');
  set trainingName(String? value) => setField<String>('training_name', value);
}
