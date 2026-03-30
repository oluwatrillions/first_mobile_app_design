import 'package:first_app/model/user_list.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";
import '../services/user_list.dart';

part 'user_lists_providers.g.dart';

@riverpod
UserLists userlists(ref) {
  return UserLists();
}

@Riverpod(keepAlive: true)
class UserListsNotifier extends _$UserListsNotifier {
  @override
  FutureOr<List<UserList>> build() {
    return fetchUsers();
  }

  Future<List<UserList>> fetchUsers() async {
    final response = ref.read(userlistsProvider);
    return await response.fetchUsers();
  }

  Future<void> refreshUsers() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => fetchUsers());
  }
}
