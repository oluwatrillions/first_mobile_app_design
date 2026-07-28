import 'package:first_app/model/user_list.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";
import '../services/user_lists_services.dart';

part 'user_lists_providers.g.dart';

@riverpod
UserListsServices userlistsServices(Ref ref) {
  return UserListsServices();
}

@Riverpod(keepAlive: true)
class UserListsNotifier extends _$UserListsNotifier {
  @override
  FutureOr<UserList> build() {
    return fetchUsers();
  }

  Future<UserList> fetchUsers() async {
    final response = ref.read(userlistsServicesProvider);
    return await response.fetchUsers();
  }

  Future<void> refreshUsers() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => fetchUsers());
  }
}
