import 'package:first_app/model/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/user_services.dart';

part 'user_provider.g.dart';

@riverpod
UserServices userServices(Ref ref) {
  return UserServices();
}

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  FutureOr<User?> build() {
    return null;
  }

  Future<User?> fetchUser(String id) async {
    final response = ref.read(userServicesProvider);
    state = const AsyncLoading();
    print(id);

    state = await AsyncValue.guard(() async {
      final user = await response.fetchUser(id);
      print(user);
      return user;
    });

    return state.value;
  }
}
