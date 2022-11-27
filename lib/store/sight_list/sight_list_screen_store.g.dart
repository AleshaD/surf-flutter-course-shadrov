// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sight_list_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SightListScreenStore on SightListScreenStoreBase, Store {
  late final _$sightsAtom =
      Atom(name: 'SightListScreenStoreBase.sights', context: context);

  @override
  List<Sight> get sights {
    _$sightsAtom.reportRead();
    return super.sights;
  }

  @override
  set sights(List<Sight> value) {
    _$sightsAtom.reportWrite(value, super.sights, () {
      super.sights = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'SightListScreenStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$networkErrorAtom =
      Atom(name: 'SightListScreenStoreBase.networkError', context: context);

  @override
  NetworkExceptions? get networkError {
    _$networkErrorAtom.reportRead();
    return super.networkError;
  }

  @override
  set networkError(NetworkExceptions? value) {
    _$networkErrorAtom.reportWrite(value, super.networkError, () {
      super.networkError = value;
    });
  }

  late final _$SightListScreenStoreBaseActionController =
      ActionController(name: 'SightListScreenStoreBase', context: context);

  @override
  void loadSights() {
    final _$actionInfo = _$SightListScreenStoreBaseActionController.startAction(
        name: 'SightListScreenStoreBase.loadSights');
    try {
      return super.loadSights();
    } finally {
      _$SightListScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sights: ${sights},
isLoading: ${isLoading},
networkError: ${networkError}
    ''';
  }
}
