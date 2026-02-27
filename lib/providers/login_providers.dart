import "package:riverpod_annotation/riverpod_annotation.dart";
import '../services/login_services.dart';

part 'login_providers.g.dart';

@riverpod
LoginServices loginServices(ref) {
  return LoginServices();
}

@Riverpod(keepAlive: true)
class LoginNotifier extends _$LoginNotifier {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    final response = ref.read(loginServicesProvider);
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final data = await response.loggedUser(email: email, password: password);

      if (data['success'] == true) {
        return data['message'] as String?;
      } else {
        throw Exception(data['message']);
      }
    });

    return !state.hasError;
  }
}
