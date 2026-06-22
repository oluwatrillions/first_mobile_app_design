// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginServices)
final loginServicesProvider = LoginServicesProvider._();

final class LoginServicesProvider
    extends $FunctionalProvider<LoginServices, LoginServices, LoginServices>
    with $Provider<LoginServices> {
  LoginServicesProvider._()
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

String _$loginServicesHash() => r'074b4334c0167c8533455c337dfaf1f8d3c4449e';

@ProviderFor(LoginNotifier)
final loginProvider = LoginNotifierProvider._();

final class LoginNotifierProvider
    extends $AsyncNotifierProvider<LoginNotifier, String?> {
  LoginNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loginProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginNotifierHash();

  @$internal
  @override
  LoginNotifier create() => LoginNotifier();
}

String _$loginNotifierHash() => r'96d66ef5d29be2e40c77e829c7c4c9789d69719c';

abstract class _$LoginNotifier extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<String?>, String?>,
        AsyncValue<String?>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
