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

String _$userlistsHash() => r'90a06bc71c09cc3a3550dee09164cfa301c98007';

@ProviderFor(UserListsNotifier)
final userListsProvider = UserListsNotifierProvider._();

final class UserListsNotifierProvider
    extends $AsyncNotifierProvider<UserListsNotifier, List<UserList>> {
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

String _$userListsNotifierHash() => r'53b2e36cd8ab030eaef0f7fb29a6ed19a545f0d6';

abstract class _$UserListsNotifier extends $AsyncNotifier<List<UserList>> {
  FutureOr<List<UserList>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<UserList>>, List<UserList>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<UserList>>, List<UserList>>,
        AsyncValue<List<UserList>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
