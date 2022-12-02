// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchAction {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getSightsSearchAction,
    required TResult Function(List<SearchedSight> sights, Set<String> history)
        resultSearchAction,
    required TResult Function(String query) deleteQuerySearchAction,
    required TResult Function() deleteHistorySearchAction,
    required TResult Function(String errorMsg) anErrorHasoccurred,
    required TResult Function() getSearchHistory,
    required TResult Function(Set<String> history) historyChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getSightsSearchAction,
    TResult? Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult? Function(String query)? deleteQuerySearchAction,
    TResult? Function()? deleteHistorySearchAction,
    TResult? Function(String errorMsg)? anErrorHasoccurred,
    TResult? Function()? getSearchHistory,
    TResult? Function(Set<String> history)? historyChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getSightsSearchAction,
    TResult Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult Function(String query)? deleteQuerySearchAction,
    TResult Function()? deleteHistorySearchAction,
    TResult Function(String errorMsg)? anErrorHasoccurred,
    TResult Function()? getSearchHistory,
    TResult Function(Set<String> history)? historyChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSightsSearchAction value)
        getSightsSearchAction,
    required TResult Function(ResultSearchAction value) resultSearchAction,
    required TResult Function(DeleteQuerySearchAction value)
        deleteQuerySearchAction,
    required TResult Function(DeleteHistorySearchAction value)
        deleteHistorySearchAction,
    required TResult Function(AnErrorHasoccurredSearchAction value)
        anErrorHasoccurred,
    required TResult Function(GetSearchHistorySearchAction value)
        getSearchHistory,
    required TResult Function(HistoryChangeSearchAction value) historyChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult? Function(ResultSearchAction value)? resultSearchAction,
    TResult? Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult? Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult? Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult? Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult? Function(HistoryChangeSearchAction value)? historyChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult Function(ResultSearchAction value)? resultSearchAction,
    TResult Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult Function(HistoryChangeSearchAction value)? historyChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchActionCopyWith<$Res> {
  factory $SearchActionCopyWith(
          SearchAction value, $Res Function(SearchAction) then) =
      _$SearchActionCopyWithImpl<$Res, SearchAction>;
}

/// @nodoc
class _$SearchActionCopyWithImpl<$Res, $Val extends SearchAction>
    implements $SearchActionCopyWith<$Res> {
  _$SearchActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetSightsSearchActionCopyWith<$Res> {
  factory _$$GetSightsSearchActionCopyWith(_$GetSightsSearchAction value,
          $Res Function(_$GetSightsSearchAction) then) =
      __$$GetSightsSearchActionCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$GetSightsSearchActionCopyWithImpl<$Res>
    extends _$SearchActionCopyWithImpl<$Res, _$GetSightsSearchAction>
    implements _$$GetSightsSearchActionCopyWith<$Res> {
  __$$GetSightsSearchActionCopyWithImpl(_$GetSightsSearchAction _value,
      $Res Function(_$GetSightsSearchAction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$GetSightsSearchAction(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetSightsSearchAction implements GetSightsSearchAction {
  const _$GetSightsSearchAction({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'SearchAction.getSightsSearchAction(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSightsSearchAction &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSightsSearchActionCopyWith<_$GetSightsSearchAction> get copyWith =>
      __$$GetSightsSearchActionCopyWithImpl<_$GetSightsSearchAction>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getSightsSearchAction,
    required TResult Function(List<SearchedSight> sights, Set<String> history)
        resultSearchAction,
    required TResult Function(String query) deleteQuerySearchAction,
    required TResult Function() deleteHistorySearchAction,
    required TResult Function(String errorMsg) anErrorHasoccurred,
    required TResult Function() getSearchHistory,
    required TResult Function(Set<String> history) historyChange,
  }) {
    return getSightsSearchAction(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getSightsSearchAction,
    TResult? Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult? Function(String query)? deleteQuerySearchAction,
    TResult? Function()? deleteHistorySearchAction,
    TResult? Function(String errorMsg)? anErrorHasoccurred,
    TResult? Function()? getSearchHistory,
    TResult? Function(Set<String> history)? historyChange,
  }) {
    return getSightsSearchAction?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getSightsSearchAction,
    TResult Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult Function(String query)? deleteQuerySearchAction,
    TResult Function()? deleteHistorySearchAction,
    TResult Function(String errorMsg)? anErrorHasoccurred,
    TResult Function()? getSearchHistory,
    TResult Function(Set<String> history)? historyChange,
    required TResult orElse(),
  }) {
    if (getSightsSearchAction != null) {
      return getSightsSearchAction(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSightsSearchAction value)
        getSightsSearchAction,
    required TResult Function(ResultSearchAction value) resultSearchAction,
    required TResult Function(DeleteQuerySearchAction value)
        deleteQuerySearchAction,
    required TResult Function(DeleteHistorySearchAction value)
        deleteHistorySearchAction,
    required TResult Function(AnErrorHasoccurredSearchAction value)
        anErrorHasoccurred,
    required TResult Function(GetSearchHistorySearchAction value)
        getSearchHistory,
    required TResult Function(HistoryChangeSearchAction value) historyChange,
  }) {
    return getSightsSearchAction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult? Function(ResultSearchAction value)? resultSearchAction,
    TResult? Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult? Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult? Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult? Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult? Function(HistoryChangeSearchAction value)? historyChange,
  }) {
    return getSightsSearchAction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult Function(ResultSearchAction value)? resultSearchAction,
    TResult Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult Function(HistoryChangeSearchAction value)? historyChange,
    required TResult orElse(),
  }) {
    if (getSightsSearchAction != null) {
      return getSightsSearchAction(this);
    }
    return orElse();
  }
}

abstract class GetSightsSearchAction implements SearchAction {
  const factory GetSightsSearchAction({required final String query}) =
      _$GetSightsSearchAction;

  String get query;
  @JsonKey(ignore: true)
  _$$GetSightsSearchActionCopyWith<_$GetSightsSearchAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultSearchActionCopyWith<$Res> {
  factory _$$ResultSearchActionCopyWith(_$ResultSearchAction value,
          $Res Function(_$ResultSearchAction) then) =
      __$$ResultSearchActionCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SearchedSight> sights, Set<String> history});
}

/// @nodoc
class __$$ResultSearchActionCopyWithImpl<$Res>
    extends _$SearchActionCopyWithImpl<$Res, _$ResultSearchAction>
    implements _$$ResultSearchActionCopyWith<$Res> {
  __$$ResultSearchActionCopyWithImpl(
      _$ResultSearchAction _value, $Res Function(_$ResultSearchAction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sights = null,
    Object? history = null,
  }) {
    return _then(_$ResultSearchAction(
      sights: null == sights
          ? _value._sights
          : sights // ignore: cast_nullable_to_non_nullable
              as List<SearchedSight>,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$ResultSearchAction implements ResultSearchAction {
  const _$ResultSearchAction(
      {required final List<SearchedSight> sights,
      required final Set<String> history})
      : _sights = sights,
        _history = history;

  final List<SearchedSight> _sights;
  @override
  List<SearchedSight> get sights {
    if (_sights is EqualUnmodifiableListView) return _sights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sights);
  }

  final Set<String> _history;
  @override
  Set<String> get history {
    if (_history is EqualUnmodifiableSetView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_history);
  }

  @override
  String toString() {
    return 'SearchAction.resultSearchAction(sights: $sights, history: $history)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultSearchAction &&
            const DeepCollectionEquality().equals(other._sights, _sights) &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sights),
      const DeepCollectionEquality().hash(_history));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultSearchActionCopyWith<_$ResultSearchAction> get copyWith =>
      __$$ResultSearchActionCopyWithImpl<_$ResultSearchAction>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getSightsSearchAction,
    required TResult Function(List<SearchedSight> sights, Set<String> history)
        resultSearchAction,
    required TResult Function(String query) deleteQuerySearchAction,
    required TResult Function() deleteHistorySearchAction,
    required TResult Function(String errorMsg) anErrorHasoccurred,
    required TResult Function() getSearchHistory,
    required TResult Function(Set<String> history) historyChange,
  }) {
    return resultSearchAction(sights, history);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getSightsSearchAction,
    TResult? Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult? Function(String query)? deleteQuerySearchAction,
    TResult? Function()? deleteHistorySearchAction,
    TResult? Function(String errorMsg)? anErrorHasoccurred,
    TResult? Function()? getSearchHistory,
    TResult? Function(Set<String> history)? historyChange,
  }) {
    return resultSearchAction?.call(sights, history);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getSightsSearchAction,
    TResult Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult Function(String query)? deleteQuerySearchAction,
    TResult Function()? deleteHistorySearchAction,
    TResult Function(String errorMsg)? anErrorHasoccurred,
    TResult Function()? getSearchHistory,
    TResult Function(Set<String> history)? historyChange,
    required TResult orElse(),
  }) {
    if (resultSearchAction != null) {
      return resultSearchAction(sights, history);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSightsSearchAction value)
        getSightsSearchAction,
    required TResult Function(ResultSearchAction value) resultSearchAction,
    required TResult Function(DeleteQuerySearchAction value)
        deleteQuerySearchAction,
    required TResult Function(DeleteHistorySearchAction value)
        deleteHistorySearchAction,
    required TResult Function(AnErrorHasoccurredSearchAction value)
        anErrorHasoccurred,
    required TResult Function(GetSearchHistorySearchAction value)
        getSearchHistory,
    required TResult Function(HistoryChangeSearchAction value) historyChange,
  }) {
    return resultSearchAction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult? Function(ResultSearchAction value)? resultSearchAction,
    TResult? Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult? Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult? Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult? Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult? Function(HistoryChangeSearchAction value)? historyChange,
  }) {
    return resultSearchAction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult Function(ResultSearchAction value)? resultSearchAction,
    TResult Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult Function(HistoryChangeSearchAction value)? historyChange,
    required TResult orElse(),
  }) {
    if (resultSearchAction != null) {
      return resultSearchAction(this);
    }
    return orElse();
  }
}

abstract class ResultSearchAction implements SearchAction {
  const factory ResultSearchAction(
      {required final List<SearchedSight> sights,
      required final Set<String> history}) = _$ResultSearchAction;

  List<SearchedSight> get sights;
  Set<String> get history;
  @JsonKey(ignore: true)
  _$$ResultSearchActionCopyWith<_$ResultSearchAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteQuerySearchActionCopyWith<$Res> {
  factory _$$DeleteQuerySearchActionCopyWith(_$DeleteQuerySearchAction value,
          $Res Function(_$DeleteQuerySearchAction) then) =
      __$$DeleteQuerySearchActionCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$DeleteQuerySearchActionCopyWithImpl<$Res>
    extends _$SearchActionCopyWithImpl<$Res, _$DeleteQuerySearchAction>
    implements _$$DeleteQuerySearchActionCopyWith<$Res> {
  __$$DeleteQuerySearchActionCopyWithImpl(_$DeleteQuerySearchAction _value,
      $Res Function(_$DeleteQuerySearchAction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$DeleteQuerySearchAction(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteQuerySearchAction implements DeleteQuerySearchAction {
  const _$DeleteQuerySearchAction({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'SearchAction.deleteQuerySearchAction(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteQuerySearchAction &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteQuerySearchActionCopyWith<_$DeleteQuerySearchAction> get copyWith =>
      __$$DeleteQuerySearchActionCopyWithImpl<_$DeleteQuerySearchAction>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getSightsSearchAction,
    required TResult Function(List<SearchedSight> sights, Set<String> history)
        resultSearchAction,
    required TResult Function(String query) deleteQuerySearchAction,
    required TResult Function() deleteHistorySearchAction,
    required TResult Function(String errorMsg) anErrorHasoccurred,
    required TResult Function() getSearchHistory,
    required TResult Function(Set<String> history) historyChange,
  }) {
    return deleteQuerySearchAction(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getSightsSearchAction,
    TResult? Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult? Function(String query)? deleteQuerySearchAction,
    TResult? Function()? deleteHistorySearchAction,
    TResult? Function(String errorMsg)? anErrorHasoccurred,
    TResult? Function()? getSearchHistory,
    TResult? Function(Set<String> history)? historyChange,
  }) {
    return deleteQuerySearchAction?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getSightsSearchAction,
    TResult Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult Function(String query)? deleteQuerySearchAction,
    TResult Function()? deleteHistorySearchAction,
    TResult Function(String errorMsg)? anErrorHasoccurred,
    TResult Function()? getSearchHistory,
    TResult Function(Set<String> history)? historyChange,
    required TResult orElse(),
  }) {
    if (deleteQuerySearchAction != null) {
      return deleteQuerySearchAction(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSightsSearchAction value)
        getSightsSearchAction,
    required TResult Function(ResultSearchAction value) resultSearchAction,
    required TResult Function(DeleteQuerySearchAction value)
        deleteQuerySearchAction,
    required TResult Function(DeleteHistorySearchAction value)
        deleteHistorySearchAction,
    required TResult Function(AnErrorHasoccurredSearchAction value)
        anErrorHasoccurred,
    required TResult Function(GetSearchHistorySearchAction value)
        getSearchHistory,
    required TResult Function(HistoryChangeSearchAction value) historyChange,
  }) {
    return deleteQuerySearchAction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult? Function(ResultSearchAction value)? resultSearchAction,
    TResult? Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult? Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult? Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult? Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult? Function(HistoryChangeSearchAction value)? historyChange,
  }) {
    return deleteQuerySearchAction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult Function(ResultSearchAction value)? resultSearchAction,
    TResult Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult Function(HistoryChangeSearchAction value)? historyChange,
    required TResult orElse(),
  }) {
    if (deleteQuerySearchAction != null) {
      return deleteQuerySearchAction(this);
    }
    return orElse();
  }
}

abstract class DeleteQuerySearchAction implements SearchAction {
  const factory DeleteQuerySearchAction({required final String query}) =
      _$DeleteQuerySearchAction;

  String get query;
  @JsonKey(ignore: true)
  _$$DeleteQuerySearchActionCopyWith<_$DeleteQuerySearchAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteHistorySearchActionCopyWith<$Res> {
  factory _$$DeleteHistorySearchActionCopyWith(
          _$DeleteHistorySearchAction value,
          $Res Function(_$DeleteHistorySearchAction) then) =
      __$$DeleteHistorySearchActionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteHistorySearchActionCopyWithImpl<$Res>
    extends _$SearchActionCopyWithImpl<$Res, _$DeleteHistorySearchAction>
    implements _$$DeleteHistorySearchActionCopyWith<$Res> {
  __$$DeleteHistorySearchActionCopyWithImpl(_$DeleteHistorySearchAction _value,
      $Res Function(_$DeleteHistorySearchAction) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteHistorySearchAction implements DeleteHistorySearchAction {
  const _$DeleteHistorySearchAction();

  @override
  String toString() {
    return 'SearchAction.deleteHistorySearchAction()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteHistorySearchAction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getSightsSearchAction,
    required TResult Function(List<SearchedSight> sights, Set<String> history)
        resultSearchAction,
    required TResult Function(String query) deleteQuerySearchAction,
    required TResult Function() deleteHistorySearchAction,
    required TResult Function(String errorMsg) anErrorHasoccurred,
    required TResult Function() getSearchHistory,
    required TResult Function(Set<String> history) historyChange,
  }) {
    return deleteHistorySearchAction();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getSightsSearchAction,
    TResult? Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult? Function(String query)? deleteQuerySearchAction,
    TResult? Function()? deleteHistorySearchAction,
    TResult? Function(String errorMsg)? anErrorHasoccurred,
    TResult? Function()? getSearchHistory,
    TResult? Function(Set<String> history)? historyChange,
  }) {
    return deleteHistorySearchAction?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getSightsSearchAction,
    TResult Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult Function(String query)? deleteQuerySearchAction,
    TResult Function()? deleteHistorySearchAction,
    TResult Function(String errorMsg)? anErrorHasoccurred,
    TResult Function()? getSearchHistory,
    TResult Function(Set<String> history)? historyChange,
    required TResult orElse(),
  }) {
    if (deleteHistorySearchAction != null) {
      return deleteHistorySearchAction();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSightsSearchAction value)
        getSightsSearchAction,
    required TResult Function(ResultSearchAction value) resultSearchAction,
    required TResult Function(DeleteQuerySearchAction value)
        deleteQuerySearchAction,
    required TResult Function(DeleteHistorySearchAction value)
        deleteHistorySearchAction,
    required TResult Function(AnErrorHasoccurredSearchAction value)
        anErrorHasoccurred,
    required TResult Function(GetSearchHistorySearchAction value)
        getSearchHistory,
    required TResult Function(HistoryChangeSearchAction value) historyChange,
  }) {
    return deleteHistorySearchAction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult? Function(ResultSearchAction value)? resultSearchAction,
    TResult? Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult? Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult? Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult? Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult? Function(HistoryChangeSearchAction value)? historyChange,
  }) {
    return deleteHistorySearchAction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult Function(ResultSearchAction value)? resultSearchAction,
    TResult Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult Function(HistoryChangeSearchAction value)? historyChange,
    required TResult orElse(),
  }) {
    if (deleteHistorySearchAction != null) {
      return deleteHistorySearchAction(this);
    }
    return orElse();
  }
}

abstract class DeleteHistorySearchAction implements SearchAction {
  const factory DeleteHistorySearchAction() = _$DeleteHistorySearchAction;
}

/// @nodoc
abstract class _$$AnErrorHasoccurredSearchActionCopyWith<$Res> {
  factory _$$AnErrorHasoccurredSearchActionCopyWith(
          _$AnErrorHasoccurredSearchAction value,
          $Res Function(_$AnErrorHasoccurredSearchAction) then) =
      __$$AnErrorHasoccurredSearchActionCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMsg});
}

/// @nodoc
class __$$AnErrorHasoccurredSearchActionCopyWithImpl<$Res>
    extends _$SearchActionCopyWithImpl<$Res, _$AnErrorHasoccurredSearchAction>
    implements _$$AnErrorHasoccurredSearchActionCopyWith<$Res> {
  __$$AnErrorHasoccurredSearchActionCopyWithImpl(
      _$AnErrorHasoccurredSearchAction _value,
      $Res Function(_$AnErrorHasoccurredSearchAction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = null,
  }) {
    return _then(_$AnErrorHasoccurredSearchAction(
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AnErrorHasoccurredSearchAction
    implements AnErrorHasoccurredSearchAction {
  const _$AnErrorHasoccurredSearchAction({required this.errorMsg});

  @override
  final String errorMsg;

  @override
  String toString() {
    return 'SearchAction.anErrorHasoccurred(errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnErrorHasoccurredSearchAction &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnErrorHasoccurredSearchActionCopyWith<_$AnErrorHasoccurredSearchAction>
      get copyWith => __$$AnErrorHasoccurredSearchActionCopyWithImpl<
          _$AnErrorHasoccurredSearchAction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getSightsSearchAction,
    required TResult Function(List<SearchedSight> sights, Set<String> history)
        resultSearchAction,
    required TResult Function(String query) deleteQuerySearchAction,
    required TResult Function() deleteHistorySearchAction,
    required TResult Function(String errorMsg) anErrorHasoccurred,
    required TResult Function() getSearchHistory,
    required TResult Function(Set<String> history) historyChange,
  }) {
    return anErrorHasoccurred(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getSightsSearchAction,
    TResult? Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult? Function(String query)? deleteQuerySearchAction,
    TResult? Function()? deleteHistorySearchAction,
    TResult? Function(String errorMsg)? anErrorHasoccurred,
    TResult? Function()? getSearchHistory,
    TResult? Function(Set<String> history)? historyChange,
  }) {
    return anErrorHasoccurred?.call(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getSightsSearchAction,
    TResult Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult Function(String query)? deleteQuerySearchAction,
    TResult Function()? deleteHistorySearchAction,
    TResult Function(String errorMsg)? anErrorHasoccurred,
    TResult Function()? getSearchHistory,
    TResult Function(Set<String> history)? historyChange,
    required TResult orElse(),
  }) {
    if (anErrorHasoccurred != null) {
      return anErrorHasoccurred(errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSightsSearchAction value)
        getSightsSearchAction,
    required TResult Function(ResultSearchAction value) resultSearchAction,
    required TResult Function(DeleteQuerySearchAction value)
        deleteQuerySearchAction,
    required TResult Function(DeleteHistorySearchAction value)
        deleteHistorySearchAction,
    required TResult Function(AnErrorHasoccurredSearchAction value)
        anErrorHasoccurred,
    required TResult Function(GetSearchHistorySearchAction value)
        getSearchHistory,
    required TResult Function(HistoryChangeSearchAction value) historyChange,
  }) {
    return anErrorHasoccurred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult? Function(ResultSearchAction value)? resultSearchAction,
    TResult? Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult? Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult? Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult? Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult? Function(HistoryChangeSearchAction value)? historyChange,
  }) {
    return anErrorHasoccurred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult Function(ResultSearchAction value)? resultSearchAction,
    TResult Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult Function(HistoryChangeSearchAction value)? historyChange,
    required TResult orElse(),
  }) {
    if (anErrorHasoccurred != null) {
      return anErrorHasoccurred(this);
    }
    return orElse();
  }
}

abstract class AnErrorHasoccurredSearchAction implements SearchAction {
  const factory AnErrorHasoccurredSearchAction(
      {required final String errorMsg}) = _$AnErrorHasoccurredSearchAction;

  String get errorMsg;
  @JsonKey(ignore: true)
  _$$AnErrorHasoccurredSearchActionCopyWith<_$AnErrorHasoccurredSearchAction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSearchHistorySearchActionCopyWith<$Res> {
  factory _$$GetSearchHistorySearchActionCopyWith(
          _$GetSearchHistorySearchAction value,
          $Res Function(_$GetSearchHistorySearchAction) then) =
      __$$GetSearchHistorySearchActionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetSearchHistorySearchActionCopyWithImpl<$Res>
    extends _$SearchActionCopyWithImpl<$Res, _$GetSearchHistorySearchAction>
    implements _$$GetSearchHistorySearchActionCopyWith<$Res> {
  __$$GetSearchHistorySearchActionCopyWithImpl(
      _$GetSearchHistorySearchAction _value,
      $Res Function(_$GetSearchHistorySearchAction) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetSearchHistorySearchAction implements GetSearchHistorySearchAction {
  const _$GetSearchHistorySearchAction();

  @override
  String toString() {
    return 'SearchAction.getSearchHistory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSearchHistorySearchAction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getSightsSearchAction,
    required TResult Function(List<SearchedSight> sights, Set<String> history)
        resultSearchAction,
    required TResult Function(String query) deleteQuerySearchAction,
    required TResult Function() deleteHistorySearchAction,
    required TResult Function(String errorMsg) anErrorHasoccurred,
    required TResult Function() getSearchHistory,
    required TResult Function(Set<String> history) historyChange,
  }) {
    return getSearchHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getSightsSearchAction,
    TResult? Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult? Function(String query)? deleteQuerySearchAction,
    TResult? Function()? deleteHistorySearchAction,
    TResult? Function(String errorMsg)? anErrorHasoccurred,
    TResult? Function()? getSearchHistory,
    TResult? Function(Set<String> history)? historyChange,
  }) {
    return getSearchHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getSightsSearchAction,
    TResult Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult Function(String query)? deleteQuerySearchAction,
    TResult Function()? deleteHistorySearchAction,
    TResult Function(String errorMsg)? anErrorHasoccurred,
    TResult Function()? getSearchHistory,
    TResult Function(Set<String> history)? historyChange,
    required TResult orElse(),
  }) {
    if (getSearchHistory != null) {
      return getSearchHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSightsSearchAction value)
        getSightsSearchAction,
    required TResult Function(ResultSearchAction value) resultSearchAction,
    required TResult Function(DeleteQuerySearchAction value)
        deleteQuerySearchAction,
    required TResult Function(DeleteHistorySearchAction value)
        deleteHistorySearchAction,
    required TResult Function(AnErrorHasoccurredSearchAction value)
        anErrorHasoccurred,
    required TResult Function(GetSearchHistorySearchAction value)
        getSearchHistory,
    required TResult Function(HistoryChangeSearchAction value) historyChange,
  }) {
    return getSearchHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult? Function(ResultSearchAction value)? resultSearchAction,
    TResult? Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult? Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult? Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult? Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult? Function(HistoryChangeSearchAction value)? historyChange,
  }) {
    return getSearchHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult Function(ResultSearchAction value)? resultSearchAction,
    TResult Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult Function(HistoryChangeSearchAction value)? historyChange,
    required TResult orElse(),
  }) {
    if (getSearchHistory != null) {
      return getSearchHistory(this);
    }
    return orElse();
  }
}

abstract class GetSearchHistorySearchAction implements SearchAction {
  const factory GetSearchHistorySearchAction() = _$GetSearchHistorySearchAction;
}

/// @nodoc
abstract class _$$HistoryChangeSearchActionCopyWith<$Res> {
  factory _$$HistoryChangeSearchActionCopyWith(
          _$HistoryChangeSearchAction value,
          $Res Function(_$HistoryChangeSearchAction) then) =
      __$$HistoryChangeSearchActionCopyWithImpl<$Res>;
  @useResult
  $Res call({Set<String> history});
}

/// @nodoc
class __$$HistoryChangeSearchActionCopyWithImpl<$Res>
    extends _$SearchActionCopyWithImpl<$Res, _$HistoryChangeSearchAction>
    implements _$$HistoryChangeSearchActionCopyWith<$Res> {
  __$$HistoryChangeSearchActionCopyWithImpl(_$HistoryChangeSearchAction _value,
      $Res Function(_$HistoryChangeSearchAction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
  }) {
    return _then(_$HistoryChangeSearchAction(
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$HistoryChangeSearchAction implements HistoryChangeSearchAction {
  const _$HistoryChangeSearchAction({required final Set<String> history})
      : _history = history;

  final Set<String> _history;
  @override
  Set<String> get history {
    if (_history is EqualUnmodifiableSetView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_history);
  }

  @override
  String toString() {
    return 'SearchAction.historyChange(history: $history)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryChangeSearchAction &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_history));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryChangeSearchActionCopyWith<_$HistoryChangeSearchAction>
      get copyWith => __$$HistoryChangeSearchActionCopyWithImpl<
          _$HistoryChangeSearchAction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) getSightsSearchAction,
    required TResult Function(List<SearchedSight> sights, Set<String> history)
        resultSearchAction,
    required TResult Function(String query) deleteQuerySearchAction,
    required TResult Function() deleteHistorySearchAction,
    required TResult Function(String errorMsg) anErrorHasoccurred,
    required TResult Function() getSearchHistory,
    required TResult Function(Set<String> history) historyChange,
  }) {
    return historyChange(history);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? getSightsSearchAction,
    TResult? Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult? Function(String query)? deleteQuerySearchAction,
    TResult? Function()? deleteHistorySearchAction,
    TResult? Function(String errorMsg)? anErrorHasoccurred,
    TResult? Function()? getSearchHistory,
    TResult? Function(Set<String> history)? historyChange,
  }) {
    return historyChange?.call(history);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? getSightsSearchAction,
    TResult Function(List<SearchedSight> sights, Set<String> history)?
        resultSearchAction,
    TResult Function(String query)? deleteQuerySearchAction,
    TResult Function()? deleteHistorySearchAction,
    TResult Function(String errorMsg)? anErrorHasoccurred,
    TResult Function()? getSearchHistory,
    TResult Function(Set<String> history)? historyChange,
    required TResult orElse(),
  }) {
    if (historyChange != null) {
      return historyChange(history);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSightsSearchAction value)
        getSightsSearchAction,
    required TResult Function(ResultSearchAction value) resultSearchAction,
    required TResult Function(DeleteQuerySearchAction value)
        deleteQuerySearchAction,
    required TResult Function(DeleteHistorySearchAction value)
        deleteHistorySearchAction,
    required TResult Function(AnErrorHasoccurredSearchAction value)
        anErrorHasoccurred,
    required TResult Function(GetSearchHistorySearchAction value)
        getSearchHistory,
    required TResult Function(HistoryChangeSearchAction value) historyChange,
  }) {
    return historyChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult? Function(ResultSearchAction value)? resultSearchAction,
    TResult? Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult? Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult? Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult? Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult? Function(HistoryChangeSearchAction value)? historyChange,
  }) {
    return historyChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSightsSearchAction value)? getSightsSearchAction,
    TResult Function(ResultSearchAction value)? resultSearchAction,
    TResult Function(DeleteQuerySearchAction value)? deleteQuerySearchAction,
    TResult Function(DeleteHistorySearchAction value)?
        deleteHistorySearchAction,
    TResult Function(AnErrorHasoccurredSearchAction value)? anErrorHasoccurred,
    TResult Function(GetSearchHistorySearchAction value)? getSearchHistory,
    TResult Function(HistoryChangeSearchAction value)? historyChange,
    required TResult orElse(),
  }) {
    if (historyChange != null) {
      return historyChange(this);
    }
    return orElse();
  }
}

abstract class HistoryChangeSearchAction implements SearchAction {
  const factory HistoryChangeSearchAction(
      {required final Set<String> history}) = _$HistoryChangeSearchAction;

  Set<String> get history;
  @JsonKey(ignore: true)
  _$$HistoryChangeSearchActionCopyWith<_$HistoryChangeSearchAction>
      get copyWith => throw _privateConstructorUsedError;
}
