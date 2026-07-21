import 'package:first_app/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list.freezed.dart';
part 'user_list.g.dart';

@freezed
abstract class UserList with _$UserList {
  const factory UserList({
    required List<User> users,
  }) = _UserList;

  factory UserList.fromJson(Map<String, dynamic> json) =>
      _$UserListFromJson(json);
}
