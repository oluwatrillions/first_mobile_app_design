// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(signupServices)
const signupServicesProvider = SignupServicesProvider._();

final class SignupServicesProvider
    extends $FunctionalProvider<SignupServices, SignupServices, SignupServices>
    with $Provider<SignupServices> {
  const SignupServicesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'signupServicesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$signupServicesHash();

  @$internal
  @override
  $ProviderElement<SignupServices> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignupServices create(Ref ref) {
    return signupServices(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignupServices value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignupServices>(value),
    );
  }
}

String _$signupServicesHash() => r'a611a65365113b3c88a64bfd6417409eb7826e0d';

@ProviderFor(SignUpNotifier)
const signUpProvider = SignUpNotifierProvider._();

final class SignUpNotifierProvider
    extends $NotifierProvider<SignUpNotifier, AsyncValue<String?>> {
  const SignUpNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'signUpProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$signUpNotifierHash();

  @$internal
  @override
  SignUpNotifier create() => SignUpNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<String?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<String?>>(value),
    );
  }
}

String _$signUpNotifierHash() => r'508dfb925faa1a3d369e667c5a4fea5a7fbf83e8';

abstract class _$SignUpNotifier extends $Notifier<AsyncValue<String?>> {
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
