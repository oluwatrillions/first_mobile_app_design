// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_lists_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userlists)
final userlistsProvider = UserlistsProvider._();

final class UserlistsProvider
    extends $FunctionalProvider<UserLists, UserLists, UserLists>
    with $Provider<UserLists> {
  UserlistsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userlistsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userlistsHash();

  @$internal
  @override
  $ProviderElement<UserLists> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserLists create(Ref ref) {
    return userlists(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserLists value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserLists>(value),
    );
  }
}

String _$userlistsHash() => r'5e12db81dfe374496e9ccaaa8a6dc24bea8cbbdd';

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

String _$userListsNotifierHash() => r'ad0cfb27ee117959a5945dfbb9188b9226124955';

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
