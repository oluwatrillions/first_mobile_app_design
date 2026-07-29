// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userServices)
final userServicesProvider = UserServicesProvider._();

final class UserServicesProvider
    extends $FunctionalProvider<UserServices, UserServices, UserServices>
    with $Provider<UserServices> {
  UserServicesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userServicesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userServicesHash();

  @$internal
  @override
  $ProviderElement<UserServices> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserServices create(Ref ref) {
    return userServices(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserServices value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserServices>(value),
    );
  }
}

String _$userServicesHash() => r'd43b886ef1d228087c08e001346b10062d72785d';

@ProviderFor(UserNotifier)
final userProvider = UserNotifierProvider._();

final class UserNotifierProvider
    extends $AsyncNotifierProvider<UserNotifier, User?> {
  UserNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userNotifierHash();

  @$internal
  @override
  UserNotifier create() => UserNotifier();
}

String _$userNotifierHash() => r'4618e86a072a62cd76dd6d2559b88f1a919c0a6e';

abstract class _$UserNotifier extends $AsyncNotifier<User?> {
  FutureOr<User?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<User?>, User?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<User?>, User?>,
        AsyncValue<User?>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
