// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginServices)
const loginServicesProvider = LoginServicesProvider._();

final class LoginServicesProvider
    extends $FunctionalProvider<LoginServices, LoginServices, LoginServices>
    with $Provider<LoginServices> {
  const LoginServicesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loginServicesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginServicesHash();

  @$internal
  @override
  $ProviderElement<LoginServices> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginServices create(Ref ref) {
    return loginServices(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginServices value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginServices>(value),
    );
  }
}

String _$loginServicesHash() => r'ac94364ee1f58d1b4f1e1d7241c83da896b38d4b';

@ProviderFor(LoginNotifier)
const loginProvider = LoginNotifierProvider._();

final class LoginNotifierProvider
    extends $NotifierProvider<LoginNotifier, AsyncValue<String?>> {
  const LoginNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loginProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginNotifierHash();

  @$internal
  @override
  LoginNotifier create() => LoginNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<String?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<String?>>(value),
    );
  }
}

String _$loginNotifierHash() => r'a30a71366d549ff56a16426c01bbfc99c6d63731';

abstract class _$LoginNotifier extends $Notifier<AsyncValue<String?>> {
  AsyncValue<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String?>, AsyncValue<String?>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<String?>, AsyncValue<String?>>,
        AsyncValue<String?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
