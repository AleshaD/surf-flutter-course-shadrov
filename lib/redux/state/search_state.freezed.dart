// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  List<SearchedSight> get sigths => throw _privateConstructorUsedError;
  Set<String> get history => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SearchedSight> sigths, Set<String> history)
        init,
    required TResult Function(List<SearchedSight> sigths, Set<String> history)
        inProgress,
    required TResult Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)
        erorr,
    required TResult Function(
            List<SearchedSight> sigths, Set<String> history, String query)
        result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SearchedSight> sigths, Set<String> history)? init,
    TResult? Function(List<SearchedSight> sigths, Set<String> history)?
        inProgress,
    TResult? Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)?
        erorr,
    TResult? Function(
            List<SearchedSight> sigths, Set<String> history, String query)?
        result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SearchedSight> sigths, Set<String> history)? init,
    TResult Function(List<SearchedSight> sigths, Set<String> history)?
        inProgress,
    TResult Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)?
        erorr,
    TResult Function(
            List<SearchedSight> sigths, Set<String> history, String query)?
        result,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Erorr value) erorr,
    required TResult Function(_Result value) result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Erorr value)? erorr,
    TResult? Function(_Result value)? result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Erorr value)? erorr,
    TResult Function(_Result value)? result,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call({List<SearchedSight> sigths, Set<String> history});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sigths = null,
    Object? history = null,
  }) {
    return _then(_value.copyWith(
      sigths: null == sigths
          ? _value.sigths
          : sigths // ignore: cast_nullable_to_non_nullable
              as List<SearchedSight>,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$$_InitCopyWith(_$_Init value, $Res Function(_$_Init) then) =
      __$$_InitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SearchedSight> sigths, Set<String> history});
}

/// @nodoc
class __$$_InitCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sigths = null,
    Object? history = null,
  }) {
    return _then(_$_Init(
      sigths: null == sigths
          ? _value._sigths
          : sigths // ignore: cast_nullable_to_non_nullable
              as List<SearchedSight>,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$_Init extends _Init {
  const _$_Init(
      {final List<SearchedSight> sigths = const [],
      final Set<String> history = const {}})
      : _sigths = sigths,
        _history = history,
        super._();

  final List<SearchedSight> _sigths;
  @override
  @JsonKey()
  List<SearchedSight> get sigths {
    if (_sigths is EqualUnmodifiableListView) return _sigths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sigths);
  }

  final Set<String> _history;
  @override
  @JsonKey()
  Set<String> get history {
    if (_history is EqualUnmodifiableSetView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_history);
  }

  @override
  String toString() {
    return 'SearchState.init(sigths: $sigths, history: $history)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Init &&
            const DeepCollectionEquality().equals(other._sigths, _sigths) &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sigths),
      const DeepCollectionEquality().hash(_history));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitCopyWith<_$_Init> get copyWith =>
      __$$_InitCopyWithImpl<_$_Init>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SearchedSight> sigths, Set<String> history)
        init,
    required TResult Function(List<SearchedSight> sigths, Set<String> history)
        inProgress,
    required TResult Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)
        erorr,
    required TResult Function(
            List<SearchedSight> sigths, Set<String> history, String query)
        result,
  }) {
    return init(sigths, history);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SearchedSight> sigths, Set<String> history)? init,
    TResult? Function(List<SearchedSight> sigths, Set<String> history)?
        inProgress,
    TResult? Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)?
        erorr,
    TResult? Function(
            List<SearchedSight> sigths, Set<String> history, String query)?
        result,
  }) {
    return init?.call(sigths, history);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SearchedSight> sigths, Set<String> history)? init,
    TResult Function(List<SearchedSight> sigths, Set<String> history)?
        inProgress,
    TResult Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)?
        erorr,
    TResult Function(
            List<SearchedSight> sigths, Set<String> history, String query)?
        result,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(sigths, history);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Erorr value) erorr,
    required TResult Function(_Result value) result,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Erorr value)? erorr,
    TResult? Function(_Result value)? result,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Erorr value)? erorr,
    TResult Function(_Result value)? result,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init extends SearchState {
  const factory _Init(
      {final List<SearchedSight> sigths, final Set<String> history}) = _$_Init;
  const _Init._() : super._();

  @override
  List<SearchedSight> get sigths;
  @override
  Set<String> get history;
  @override
  @JsonKey(ignore: true)
  _$$_InitCopyWith<_$_Init> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InProgressCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_InProgressCopyWith(
          _$_InProgress value, $Res Function(_$_InProgress) then) =
      __$$_InProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SearchedSight> sigths, Set<String> history});
}

/// @nodoc
class __$$_InProgressCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_InProgress>
    implements _$$_InProgressCopyWith<$Res> {
  __$$_InProgressCopyWithImpl(
      _$_InProgress _value, $Res Function(_$_InProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sigths = null,
    Object? history = null,
  }) {
    return _then(_$_InProgress(
      sigths: null == sigths
          ? _value._sigths
          : sigths // ignore: cast_nullable_to_non_nullable
              as List<SearchedSight>,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$_InProgress extends _InProgress {
  const _$_InProgress(
      {final List<SearchedSight> sigths = const [],
      final Set<String> history = const {}})
      : _sigths = sigths,
        _history = history,
        super._();

  final List<SearchedSight> _sigths;
  @override
  @JsonKey()
  List<SearchedSight> get sigths {
    if (_sigths is EqualUnmodifiableListView) return _sigths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sigths);
  }

  final Set<String> _history;
  @override
  @JsonKey()
  Set<String> get history {
    if (_history is EqualUnmodifiableSetView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_history);
  }

  @override
  String toString() {
    return 'SearchState.inProgress(sigths: $sigths, history: $history)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InProgress &&
            const DeepCollectionEquality().equals(other._sigths, _sigths) &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sigths),
      const DeepCollectionEquality().hash(_history));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InProgressCopyWith<_$_InProgress> get copyWith =>
      __$$_InProgressCopyWithImpl<_$_InProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SearchedSight> sigths, Set<String> history)
        init,
    required TResult Function(List<SearchedSight> sigths, Set<String> history)
        inProgress,
    required TResult Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)
        erorr,
    required TResult Function(
            List<SearchedSight> sigths, Set<String> history, String query)
        result,
  }) {
    return inProgress(sigths, history);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SearchedSight> sigths, Set<String> history)? init,
    TResult? Function(List<SearchedSight> sigths, Set<String> history)?
        inProgress,
    TResult? Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)?
        erorr,
    TResult? Function(
            List<SearchedSight> sigths, Set<String> history, String query)?
        result,
  }) {
    return inProgress?.call(sigths, history);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SearchedSight> sigths, Set<String> history)? init,
    TResult Function(List<SearchedSight> sigths, Set<String> history)?
        inProgress,
    TResult Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)?
        erorr,
    TResult Function(
            List<SearchedSight> sigths, Set<String> history, String query)?
        result,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(sigths, history);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Erorr value) erorr,
    required TResult Function(_Result value) result,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Erorr value)? erorr,
    TResult? Function(_Result value)? result,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Erorr value)? erorr,
    TResult Function(_Result value)? result,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _InProgress extends SearchState {
  const factory _InProgress(
      {final List<SearchedSight> sigths,
      final Set<String> history}) = _$_InProgress;
  const _InProgress._() : super._();

  @override
  List<SearchedSight> get sigths;
  @override
  Set<String> get history;
  @override
  @JsonKey(ignore: true)
  _$$_InProgressCopyWith<_$_InProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErorrCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$$_ErorrCopyWith(_$_Erorr value, $Res Function(_$_Erorr) then) =
      __$$_ErorrCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SearchedSight> sigths, Set<String> history, String errorMessage});
}

/// @nodoc
class __$$_ErorrCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_Erorr>
    implements _$$_ErorrCopyWith<$Res> {
  __$$_ErorrCopyWithImpl(_$_Erorr _value, $Res Function(_$_Erorr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sigths = null,
    Object? history = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_Erorr(
      sigths: null == sigths
          ? _value._sigths
          : sigths // ignore: cast_nullable_to_non_nullable
              as List<SearchedSight>,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Erorr extends _Erorr {
  const _$_Erorr(
      {final List<SearchedSight> sigths = const [],
      final Set<String> history = const {},
      this.errorMessage = 'Ошибка при поиске'})
      : _sigths = sigths,
        _history = history,
        super._();

  final List<SearchedSight> _sigths;
  @override
  @JsonKey()
  List<SearchedSight> get sigths {
    if (_sigths is EqualUnmodifiableListView) return _sigths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sigths);
  }

  final Set<String> _history;
  @override
  @JsonKey()
  Set<String> get history {
    if (_history is EqualUnmodifiableSetView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_history);
  }

  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'SearchState.erorr(sigths: $sigths, history: $history, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Erorr &&
            const DeepCollectionEquality().equals(other._sigths, _sigths) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sigths),
      const DeepCollectionEquality().hash(_history),
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErorrCopyWith<_$_Erorr> get copyWith =>
      __$$_ErorrCopyWithImpl<_$_Erorr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SearchedSight> sigths, Set<String> history)
        init,
    required TResult Function(List<SearchedSight> sigths, Set<String> history)
        inProgress,
    required TResult Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)
        erorr,
    required TResult Function(
            List<SearchedSight> sigths, Set<String> history, String query)
        result,
  }) {
    return erorr(sigths, history, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SearchedSight> sigths, Set<String> history)? init,
    TResult? Function(List<SearchedSight> sigths, Set<String> history)?
        inProgress,
    TResult? Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)?
        erorr,
    TResult? Function(
            List<SearchedSight> sigths, Set<String> history, String query)?
        result,
  }) {
    return erorr?.call(sigths, history, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SearchedSight> sigths, Set<String> history)? init,
    TResult Function(List<SearchedSight> sigths, Set<String> history)?
        inProgress,
    TResult Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)?
        erorr,
    TResult Function(
            List<SearchedSight> sigths, Set<String> history, String query)?
        result,
    required TResult orElse(),
  }) {
    if (erorr != null) {
      return erorr(sigths, history, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Erorr value) erorr,
    required TResult Function(_Result value) result,
  }) {
    return erorr(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Erorr value)? erorr,
    TResult? Function(_Result value)? result,
  }) {
    return erorr?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Erorr value)? erorr,
    TResult Function(_Result value)? result,
    required TResult orElse(),
  }) {
    if (erorr != null) {
      return erorr(this);
    }
    return orElse();
  }
}

abstract class _Erorr extends SearchState {
  const factory _Erorr(
      {final List<SearchedSight> sigths,
      final Set<String> history,
      final String errorMessage}) = _$_Erorr;
  const _Erorr._() : super._();

  @override
  List<SearchedSight> get sigths;
  @override
  Set<String> get history;
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ErorrCopyWith<_$_Erorr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResultCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$$_ResultCopyWith(_$_Result value, $Res Function(_$_Result) then) =
      __$$_ResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SearchedSight> sigths, Set<String> history, String query});
}

/// @nodoc
class __$$_ResultCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_Result>
    implements _$$_ResultCopyWith<$Res> {
  __$$_ResultCopyWithImpl(_$_Result _value, $Res Function(_$_Result) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sigths = null,
    Object? history = null,
    Object? query = null,
  }) {
    return _then(_$_Result(
      sigths: null == sigths
          ? _value._sigths
          : sigths // ignore: cast_nullable_to_non_nullable
              as List<SearchedSight>,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Result extends _Result {
  const _$_Result(
      {final List<SearchedSight> sigths = const [],
      final Set<String> history = const {},
      this.query = ''})
      : _sigths = sigths,
        _history = history,
        super._();

  final List<SearchedSight> _sigths;
  @override
  @JsonKey()
  List<SearchedSight> get sigths {
    if (_sigths is EqualUnmodifiableListView) return _sigths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sigths);
  }

  final Set<String> _history;
  @override
  @JsonKey()
  Set<String> get history {
    if (_history is EqualUnmodifiableSetView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_history);
  }

  @override
  @JsonKey()
  final String query;

  @override
  String toString() {
    return 'SearchState.result(sigths: $sigths, history: $history, query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            const DeepCollectionEquality().equals(other._sigths, _sigths) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sigths),
      const DeepCollectionEquality().hash(_history),
      query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      __$$_ResultCopyWithImpl<_$_Result>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SearchedSight> sigths, Set<String> history)
        init,
    required TResult Function(List<SearchedSight> sigths, Set<String> history)
        inProgress,
    required TResult Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)
        erorr,
    required TResult Function(
            List<SearchedSight> sigths, Set<String> history, String query)
        result,
  }) {
    return result(sigths, history, query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SearchedSight> sigths, Set<String> history)? init,
    TResult? Function(List<SearchedSight> sigths, Set<String> history)?
        inProgress,
    TResult? Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)?
        erorr,
    TResult? Function(
            List<SearchedSight> sigths, Set<String> history, String query)?
        result,
  }) {
    return result?.call(sigths, history, query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SearchedSight> sigths, Set<String> history)? init,
    TResult Function(List<SearchedSight> sigths, Set<String> history)?
        inProgress,
    TResult Function(List<SearchedSight> sigths, Set<String> history,
            String errorMessage)?
        erorr,
    TResult Function(
            List<SearchedSight> sigths, Set<String> history, String query)?
        result,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(sigths, history, query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Erorr value) erorr,
    required TResult Function(_Result value) result,
  }) {
    return result(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Erorr value)? erorr,
    TResult? Function(_Result value)? result,
  }) {
    return result?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Erorr value)? erorr,
    TResult Function(_Result value)? result,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(this);
    }
    return orElse();
  }
}

abstract class _Result extends SearchState {
  const factory _Result(
      {final List<SearchedSight> sigths,
      final Set<String> history,
      final String query}) = _$_Result;
  const _Result._() : super._();

  @override
  List<SearchedSight> get sigths;
  @override
  Set<String> get history;
  String get query;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}
