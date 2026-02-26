import "package:riverpod_annotation/riverpod_annotation.dart";
import '../services/login_services.dart';

part 'login_providers.g.dart';

@riverpod
LoginServices loginServices(ref) {
  return LoginServices();
}

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  AsyncValue<String?> build() {
    return const AsyncData(null);
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final response = ref.read(loginServicesProvider);
    try {
      final data = await response.loggedUser(email: email, password: password);

      if (!ref.mounted) {
        throw Exception('Provider was unmounted');
      }

      if (data['success'] == true) {
        state = AsyncData(data['message']);
      } else {
        state = AsyncError(data['message'], StackTrace.current);
      }
    } catch (error, stackTrace) {
      state = AsyncError('An error occured, please try again', stackTrace);
      print({'Error': error, 'StackTrace': stackTrace});
    }
  }
}
