// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_in_user_providers.dart';

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

@ProviderFor(LoggedInUserNotifier)
final loggedInUserProvider = LoggedInUserNotifierProvider._();

final class LoggedInUserNotifierProvider
    extends $AsyncNotifierProvider<LoggedInUserNotifier, User?> {
  LoggedInUserNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loggedInUserProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loggedInUserNotifierHash();

  @$internal
  @override
  LoggedInUserNotifier create() => LoggedInUserNotifier();
}

String _$loggedInUserNotifierHash() =>
    r'c915de29e92e4590eec1d93e94fa837530ca3877';

abstract class _$LoggedInUserNotifier extends $AsyncNotifier<User?> {
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
