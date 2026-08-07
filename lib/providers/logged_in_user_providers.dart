import 'package:first_app/model/user.dart';
import 'package:first_app/services/user_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logged_in_user_providers.g.dart';

@riverpod
UserServices userServices(Ref ref) {
  return UserServices();
}

@Riverpod(keepAlive: true)
class LoggedInUserNotifier extends _$LoggedInUserNotifier {
  @override
  FutureOr<User?> build() {
    return null;
  }

  Future<void> fetchloggedInUser(String id) async {
    final response = ref.read(userServicesProvider);
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final user = await response.fetchUser(id);
      return user;
    });
  }
}
