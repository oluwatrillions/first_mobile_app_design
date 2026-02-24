import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/signup_services.dart';

part 'signup_providers.g.dart';

@riverpod
SignupServices signupServices(ref) {
  return SignupServices();
}

@riverpod
class SignUpNotifier extends _$SignUpNotifier {
  @override
  AsyncValue<String?> build() {
    return const AsyncData(null);
  }

  Future<void> signUserUp({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    try {
      final response = ref.read(signupServicesProvider);

      final data = await response.signUpUser(
        name: name,
        email: email,
        password: password,
      );

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
