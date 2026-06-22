import "dart:io";
import 'package:first_app/providers/user_lists_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/signup_services.dart';

part 'signup_providers.g.dart';

@riverpod
SignupServices signupServices(Ref ref) {
  return SignupServices();
}

@riverpod
class SignUpNotifier extends _$SignUpNotifier {
  @override
  AsyncValue<String?> build() {
    return const AsyncData(null);
  }

  Future<void> signUserUp({
    required String username,
    required String email,
    required String password,
    File? avatar,
  }) async {
    state = const AsyncLoading();

    try {
      final response = ref.read(signupServicesProvider);

      final data = await response.signUpUser(
        username: username,
        email: email,
        password: password,
        avatar: avatar,
      );

      if (data['success']) {
        ref.invalidate(userlistsProvider);
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
