// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_lists_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userlistsServices)
final userlistsServicesProvider = UserlistsServicesProvider._();

final class UserlistsServicesProvider extends $FunctionalProvider<
    UserListsServices,
    UserListsServices,
    UserListsServices> with $Provider<UserListsServices> {
  UserlistsServicesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userlistsServicesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userlistsServicesHash();

  @$internal
  @override
  $ProviderElement<UserListsServices> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserListsServices create(Ref ref) {
    return userlistsServices(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserListsServices value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserListsServices>(value),
    );
  }
}

String _$userlistsServicesHash() => r'c0b59d1d6369ab367ffb0e49b1d5e40cad7c250f';

@ProviderFor(UserListsNotifier)
final userListsProvider = UserListsNotifierProvider._();

final class UserListsNotifierProvider
    extends $AsyncNotifierProvider<UserListsNotifier, UserList> {
  UserListsNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userListsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userListsNotifierHash();

  @$internal
  @override
  UserListsNotifier create() => UserListsNotifier();
}

String _$userListsNotifierHash() => r'd8dc5771723482f0cab9927f2083f8ca5785e236';

abstract class _$UserListsNotifier extends $AsyncNotifier<UserList> {
  FutureOr<UserList> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserList>, UserList>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<UserList>, UserList>,
        AsyncValue<UserList>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
