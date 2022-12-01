// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visiting_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VisitingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideLoading) loadSights,
    required TResult Function(Sight sight) deleteFromVisited,
    required TResult Function(Sight sight) deleteFromWantToVisit,
    required TResult Function(int fromIndex, int toIndex)
        changeVisitedCardsSequences,
    required TResult Function(int fromIndex, int toIndex)
        changeWantToVisitCardsSequences,
    required TResult Function(Sight sight, DateTime date) addWantToVisitTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideLoading)? loadSights,
    TResult? Function(Sight sight)? deleteFromVisited,
    TResult? Function(Sight sight)? deleteFromWantToVisit,
    TResult? Function(int fromIndex, int toIndex)? changeVisitedCardsSequences,
    TResult? Function(int fromIndex, int toIndex)?
        changeWantToVisitCardsSequences,
    TResult? Function(Sight sight, DateTime date)? addWantToVisitTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideLoading)? loadSights,
    TResult Function(Sight sight)? deleteFromVisited,
    TResult Function(Sight sight)? deleteFromWantToVisit,
    TResult Function(int fromIndex, int toIndex)? changeVisitedCardsSequences,
    TResult Function(int fromIndex, int toIndex)?
        changeWantToVisitCardsSequences,
    TResult Function(Sight sight, DateTime date)? addWantToVisitTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSights value) loadSights,
    required TResult Function(_DeleteFromVisited value) deleteFromVisited,
    required TResult Function(_DeleteFromWantToVisit value)
        deleteFromWantToVisit,
    required TResult Function(_ChangeVisitedCardsSequences value)
        changeVisitedCardsSequences,
    required TResult Function(_ChangeWantToVisitCardsSequences value)
        changeWantToVisitCardsSequences,
    required TResult Function(_AddWantToVisitTime value) addWantToVisitTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSights value)? loadSights,
    TResult? Function(_DeleteFromVisited value)? deleteFromVisited,
    TResult? Function(_DeleteFromWantToVisit value)? deleteFromWantToVisit,
    TResult? Function(_ChangeVisitedCardsSequences value)?
        changeVisitedCardsSequences,
    TResult? Function(_ChangeWantToVisitCardsSequences value)?
        changeWantToVisitCardsSequences,
    TResult? Function(_AddWantToVisitTime value)? addWantToVisitTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSights value)? loadSights,
    TResult Function(_DeleteFromVisited value)? deleteFromVisited,
    TResult Function(_DeleteFromWantToVisit value)? deleteFromWantToVisit,
    TResult Function(_ChangeVisitedCardsSequences value)?
        changeVisitedCardsSequences,
    TResult Function(_ChangeWantToVisitCardsSequences value)?
        changeWantToVisitCardsSequences,
    TResult Function(_AddWantToVisitTime value)? addWantToVisitTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitingEventCopyWith<$Res> {
  factory $VisitingEventCopyWith(
          VisitingEvent value, $Res Function(VisitingEvent) then) =
      _$VisitingEventCopyWithImpl<$Res, VisitingEvent>;
}

/// @nodoc
class _$VisitingEventCopyWithImpl<$Res, $Val extends VisitingEvent>
    implements $VisitingEventCopyWith<$Res> {
  _$VisitingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadSightsCopyWith<$Res> {
  factory _$$_LoadSightsCopyWith(
          _$_LoadSights value, $Res Function(_$_LoadSights) then) =
      __$$_LoadSightsCopyWithImpl<$Res>;
  @useResult
  $Res call({bool hideLoading});
}

/// @nodoc
class __$$_LoadSightsCopyWithImpl<$Res>
    extends _$VisitingEventCopyWithImpl<$Res, _$_LoadSights>
    implements _$$_LoadSightsCopyWith<$Res> {
  __$$_LoadSightsCopyWithImpl(
      _$_LoadSights _value, $Res Function(_$_LoadSights) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideLoading = null,
  }) {
    return _then(_$_LoadSights(
      hideLoading: null == hideLoading
          ? _value.hideLoading
          : hideLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadSights implements _LoadSights {
  const _$_LoadSights({this.hideLoading = false});

  @override
  @JsonKey()
  final bool hideLoading;

  @override
  String toString() {
    return 'VisitingEvent.loadSights(hideLoading: $hideLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSights &&
            (identical(other.hideLoading, hideLoading) ||
                other.hideLoading == hideLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hideLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadSightsCopyWith<_$_LoadSights> get copyWith =>
      __$$_LoadSightsCopyWithImpl<_$_LoadSights>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideLoading) loadSights,
    required TResult Function(Sight sight) deleteFromVisited,
    required TResult Function(Sight sight) deleteFromWantToVisit,
    required TResult Function(int fromIndex, int toIndex)
        changeVisitedCardsSequences,
    required TResult Function(int fromIndex, int toIndex)
        changeWantToVisitCardsSequences,
    required TResult Function(Sight sight, DateTime date) addWantToVisitTime,
  }) {
    return loadSights(hideLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideLoading)? loadSights,
    TResult? Function(Sight sight)? deleteFromVisited,
    TResult? Function(Sight sight)? deleteFromWantToVisit,
    TResult? Function(int fromIndex, int toIndex)? changeVisitedCardsSequences,
    TResult? Function(int fromIndex, int toIndex)?
        changeWantToVisitCardsSequences,
    TResult? Function(Sight sight, DateTime date)? addWantToVisitTime,
  }) {
    return loadSights?.call(hideLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideLoading)? loadSights,
    TResult Function(Sight sight)? deleteFromVisited,
    TResult Function(Sight sight)? deleteFromWantToVisit,
    TResult Function(int fromIndex, int toIndex)? changeVisitedCardsSequences,
    TResult Function(int fromIndex, int toIndex)?
        changeWantToVisitCardsSequences,
    TResult Function(Sight sight, DateTime date)? addWantToVisitTime,
    required TResult orElse(),
  }) {
    if (loadSights != null) {
      return loadSights(hideLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSights value) loadSights,
    required TResult Function(_DeleteFromVisited value) deleteFromVisited,
    required TResult Function(_DeleteFromWantToVisit value)
        deleteFromWantToVisit,
    required TResult Function(_ChangeVisitedCardsSequences value)
        changeVisitedCardsSequences,
    required TResult Function(_ChangeWantToVisitCardsSequences value)
        changeWantToVisitCardsSequences,
    required TResult Function(_AddWantToVisitTime value) addWantToVisitTime,
  }) {
    return loadSights(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSights value)? loadSights,
    TResult? Function(_DeleteFromVisited value)? deleteFromVisited,
    TResult? Function(_DeleteFromWantToVisit value)? deleteFromWantToVisit,
    TResult? Function(_ChangeVisitedCardsSequences value)?
        changeVisitedCardsSequences,
    TResult? Function(_ChangeWantToVisitCardsSequences value)?
        changeWantToVisitCardsSequences,
    TResult? Function(_AddWantToVisitTime value)? addWantToVisitTime,
  }) {
    return loadSights?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSights value)? loadSights,
    TResult Function(_DeleteFromVisited value)? deleteFromVisited,
    TResult Function(_DeleteFromWantToVisit value)? deleteFromWantToVisit,
    TResult Function(_ChangeVisitedCardsSequences value)?
        changeVisitedCardsSequences,
    TResult Function(_ChangeWantToVisitCardsSequences value)?
        changeWantToVisitCardsSequences,
    TResult Function(_AddWantToVisitTime value)? addWantToVisitTime,
    required TResult orElse(),
  }) {
    if (loadSights != null) {
      return loadSights(this);
    }
    return orElse();
  }
}

abstract class _LoadSights implements VisitingEvent {
  const factory _LoadSights({final bool hideLoading}) = _$_LoadSights;

  bool get hideLoading;
  @JsonKey(ignore: true)
  _$$_LoadSightsCopyWith<_$_LoadSights> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteFromVisitedCopyWith<$Res> {
  factory _$$_DeleteFromVisitedCopyWith(_$_DeleteFromVisited value,
          $Res Function(_$_DeleteFromVisited) then) =
      __$$_DeleteFromVisitedCopyWithImpl<$Res>;
  @useResult
  $Res call({Sight sight});
}

/// @nodoc
class __$$_DeleteFromVisitedCopyWithImpl<$Res>
    extends _$VisitingEventCopyWithImpl<$Res, _$_DeleteFromVisited>
    implements _$$_DeleteFromVisitedCopyWith<$Res> {
  __$$_DeleteFromVisitedCopyWithImpl(
      _$_DeleteFromVisited _value, $Res Function(_$_DeleteFromVisited) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sight = null,
  }) {
    return _then(_$_DeleteFromVisited(
      sight: null == sight
          ? _value.sight
          : sight // ignore: cast_nullable_to_non_nullable
              as Sight,
    ));
  }
}

/// @nodoc

class _$_DeleteFromVisited implements _DeleteFromVisited {
  const _$_DeleteFromVisited({required this.sight});

  @override
  final Sight sight;

  @override
  String toString() {
    return 'VisitingEvent.deleteFromVisited(sight: $sight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteFromVisited &&
            (identical(other.sight, sight) || other.sight == sight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteFromVisitedCopyWith<_$_DeleteFromVisited> get copyWith =>
      __$$_DeleteFromVisitedCopyWithImpl<_$_DeleteFromVisited>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideLoading) loadSights,
    required TResult Function(Sight sight) deleteFromVisited,
    required TResult Function(Sight sight) deleteFromWantToVisit,
    required TResult Function(int fromIndex, int toIndex)
        changeVisitedCardsSequences,
    required TResult Function(int fromIndex, int toIndex)
        changeWantToVisitCardsSequences,
    required TResult Function(Sight sight, DateTime date) addWantToVisitTime,
  }) {
    return deleteFromVisited(sight);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideLoading)? loadSights,
    TResult? Function(Sight sight)? deleteFromVisited,
    TResult? Function(Sight sight)? deleteFromWantToVisit,
    TResult? Function(int fromIndex, int toIndex)? changeVisitedCardsSequences,
    TResult? Function(int fromIndex, int toIndex)?
        changeWantToVisitCardsSequences,
    TResult? Function(Sight sight, DateTime date)? addWantToVisitTime,
  }) {
    return deleteFromVisited?.call(sight);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideLoading)? loadSights,
    TResult Function(Sight sight)? deleteFromVisited,
    TResult Function(Sight sight)? deleteFromWantToVisit,
    TResult Function(int fromIndex, int toIndex)? changeVisitedCardsSequences,
    TResult Function(int fromIndex, int toIndex)?
        changeWantToVisitCardsSequences,
    TResult Function(Sight sight, DateTime date)? addWantToVisitTime,
    required TResult orElse(),
  }) {
    if (deleteFromVisited != null) {
      return deleteFromVisited(sight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSights value) loadSights,
    required TResult Function(_DeleteFromVisited value) deleteFromVisited,
    required TResult Function(_DeleteFromWantToVisit value)
        deleteFromWantToVisit,
    required TResult Function(_ChangeVisitedCardsSequences value)
        changeVisitedCardsSequences,
    required TResult Function(_ChangeWantToVisitCardsSequences value)
        changeWantToVisitCardsSequences,
    required TResult Function(_AddWantToVisitTime value) addWantToVisitTime,
  }) {
    return deleteFromVisited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSights value)? loadSights,
    TResult? Function(_DeleteFromVisited value)? deleteFromVisited,
    TResult? Function(_DeleteFromWantToVisit value)? deleteFromWantToVisit,
    TResult? Function(_ChangeVisitedCardsSequences value)?
        changeVisitedCardsSequences,
    TResult? Function(_ChangeWantToVisitCardsSequences value)?
        changeWantToVisitCardsSequences,
    TResult? Function(_AddWantToVisitTime value)? addWantToVisitTime,
  }) {
    return deleteFromVisited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSights value)? loadSights,
    TResult Function(_DeleteFromVisited value)? deleteFromVisited,
    TResult Function(_DeleteFromWantToVisit value)? deleteFromWantToVisit,
    TResult Function(_ChangeVisitedCardsSequences value)?
        changeVisitedCardsSequences,
    TResult Function(_ChangeWantToVisitCardsSequences value)?
        changeWantToVisitCardsSequences,
    TResult Function(_AddWantToVisitTime value)? addWantToVisitTime,
    required TResult orElse(),
  }) {
    if (deleteFromVisited != null) {
      return deleteFromVisited(this);
    }
    return orElse();
  }
}

abstract class _DeleteFromVisited implements VisitingEvent {
  const factory _DeleteFromVisited({required final Sight sight}) =
      _$_DeleteFromVisited;

  Sight get sight;
  @JsonKey(ignore: true)
  _$$_DeleteFromVisitedCopyWith<_$_DeleteFromVisited> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteFromWantToVisitCopyWith<$Res> {
  factory _$$_DeleteFromWantToVisitCopyWith(_$_DeleteFromWantToVisit value,
          $Res Function(_$_DeleteFromWantToVisit) then) =
      __$$_DeleteFromWantToVisitCopyWithImpl<$Res>;
  @useResult
  $Res call({Sight sight});
}

/// @nodoc
class __$$_DeleteFromWantToVisitCopyWithImpl<$Res>
    extends _$VisitingEventCopyWithImpl<$Res, _$_DeleteFromWantToVisit>
    implements _$$_DeleteFromWantToVisitCopyWith<$Res> {
  __$$_DeleteFromWantToVisitCopyWithImpl(_$_DeleteFromWantToVisit _value,
      $Res Function(_$_DeleteFromWantToVisit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sight = null,
  }) {
    return _then(_$_DeleteFromWantToVisit(
      sight: null == sight
          ? _value.sight
          : sight // ignore: cast_nullable_to_non_nullable
              as Sight,
    ));
  }
}

/// @nodoc

class _$_DeleteFromWantToVisit implements _DeleteFromWantToVisit {
  const _$_DeleteFromWantToVisit({required this.sight});

  @override
  final Sight sight;

  @override
  String toString() {
    return 'VisitingEvent.deleteFromWantToVisit(sight: $sight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteFromWantToVisit &&
            (identical(other.sight, sight) || other.sight == sight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteFromWantToVisitCopyWith<_$_DeleteFromWantToVisit> get copyWith =>
      __$$_DeleteFromWantToVisitCopyWithImpl<_$_DeleteFromWantToVisit>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideLoading) loadSights,
    required TResult Function(Sight sight) deleteFromVisited,
    required TResult Function(Sight sight) deleteFromWantToVisit,
    required TResult Function(int fromIndex, int toIndex)
        changeVisitedCardsSequences,
    required TResult Function(int fromIndex, int toIndex)
        changeWantToVisitCardsSequences,
    required TResult Function(Sight sight, DateTime date) addWantToVisitTime,
  }) {
    return deleteFromWantToVisit(sight);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideLoading)? loadSights,
    TResult? Function(Sight sight)? deleteFromVisited,
    TResult? Function(Sight sight)? deleteFromWantToVisit,
    TResult? Function(int fromIndex, int toIndex)? changeVisitedCardsSequences,
    TResult? Function(int fromIndex, int toIndex)?
        changeWantToVisitCardsSequences,
    TResult? Function(Sight sight, DateTime date)? addWantToVisitTime,
  }) {
    return deleteFromWantToVisit?.call(sight);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideLoading)? loadSights,
    TResult Function(Sight sight)? deleteFromVisited,
    TResult Function(Sight sight)? deleteFromWantToVisit,
    TResult Function(int fromIndex, int toIndex)? changeVisitedCardsSequences,
    TResult Function(int fromIndex, int toIndex)?
        changeWantToVisitCardsSequences,
    TResult Function(Sight sight, DateTime date)? addWantToVisitTime,
    required TResult orElse(),
  }) {
    if (deleteFromWantToVisit != null) {
      return deleteFromWantToVisit(sight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSights value) loadSights,
    required TResult Function(_DeleteFromVisited value) deleteFromVisited,
    required TResult Function(_DeleteFromWantToVisit value)
        deleteFromWantToVisit,
    required TResult Function(_ChangeVisitedCardsSequences value)
        changeVisitedCardsSequences,
    required TResult Function(_ChangeWantToVisitCardsSequences value)
        changeWantToVisitCardsSequences,
    required TResult Function(_AddWantToVisitTime value) addWantToVisitTime,
  }) {
    return deleteFromWantToVisit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSights value)? loadSights,
    TResult? Function(_DeleteFromVisited value)? deleteFromVisited,
    TResult? Function(_DeleteFromWantToVisit value)? deleteFromWantToVisit,
    TResult? Function(_ChangeVisitedCardsSequences value)?
        changeVisitedCardsSequences,
    TResult? Function(_ChangeWantToVisitCardsSequences value)?
        changeWantToVisitCardsSequences,
    TResult? Function(_AddWantToVisitTime value)? addWantToVisitTime,
  }) {
    return deleteFromWantToVisit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSights value)? loadSights,
    TResult Function(_DeleteFromVisited value)? deleteFromVisited,
    TResult Function(_DeleteFromWantToVisit value)? deleteFromWantToVisit,
    TResult Function(_ChangeVisitedCardsSequences value)?
        changeVisitedCardsSequences,
    TResult Function(_ChangeWantToVisitCardsSequences value)?
        changeWantToVisitCardsSequences,
    TResult Function(_AddWantToVisitTime value)? addWantToVisitTime,
    required TResult orElse(),
  }) {
    if (deleteFromWantToVisit != null) {
      return deleteFromWantToVisit(this);
    }
    return orElse();
  }
}

abstract class _DeleteFromWantToVisit implements VisitingEvent {
  const factory _DeleteFromWantToVisit({required final Sight sight}) =
      _$_DeleteFromWantToVisit;

  Sight get sight;
  @JsonKey(ignore: true)
  _$$_DeleteFromWantToVisitCopyWith<_$_DeleteFromWantToVisit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeVisitedCardsSequencesCopyWith<$Res> {
  factory _$$_ChangeVisitedCardsSequencesCopyWith(
          _$_ChangeVisitedCardsSequences value,
          $Res Function(_$_ChangeVisitedCardsSequences) then) =
      __$$_ChangeVisitedCardsSequencesCopyWithImpl<$Res>;
  @useResult
  $Res call({int fromIndex, int toIndex});
}

/// @nodoc
class __$$_ChangeVisitedCardsSequencesCopyWithImpl<$Res>
    extends _$VisitingEventCopyWithImpl<$Res, _$_ChangeVisitedCardsSequences>
    implements _$$_ChangeVisitedCardsSequencesCopyWith<$Res> {
  __$$_ChangeVisitedCardsSequencesCopyWithImpl(
      _$_ChangeVisitedCardsSequences _value,
      $Res Function(_$_ChangeVisitedCardsSequences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromIndex = null,
    Object? toIndex = null,
  }) {
    return _then(_$_ChangeVisitedCardsSequences(
      fromIndex: null == fromIndex
          ? _value.fromIndex
          : fromIndex // ignore: cast_nullable_to_non_nullable
              as int,
      toIndex: null == toIndex
          ? _value.toIndex
          : toIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangeVisitedCardsSequences implements _ChangeVisitedCardsSequences {
  const _$_ChangeVisitedCardsSequences(
      {required this.fromIndex, required this.toIndex});

  @override
  final int fromIndex;
  @override
  final int toIndex;

  @override
  String toString() {
    return 'VisitingEvent.changeVisitedCardsSequences(fromIndex: $fromIndex, toIndex: $toIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeVisitedCardsSequences &&
            (identical(other.fromIndex, fromIndex) ||
                other.fromIndex == fromIndex) &&
            (identical(other.toIndex, toIndex) || other.toIndex == toIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fromIndex, toIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeVisitedCardsSequencesCopyWith<_$_ChangeVisitedCardsSequences>
      get copyWith => __$$_ChangeVisitedCardsSequencesCopyWithImpl<
          _$_ChangeVisitedCardsSequences>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideLoading) loadSights,
    required TResult Function(Sight sight) deleteFromVisited,
    required TResult Function(Sight sight) deleteFromWantToVisit,
    required TResult Function(int fromIndex, int toIndex)
        changeVisitedCardsSequences,
    required TResult Function(int fromIndex, int toIndex)
        changeWantToVisitCardsSequences,
    required TResult Function(Sight sight, DateTime date) addWantToVisitTime,
  }) {
    return changeVisitedCardsSequences(fromIndex, toIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideLoading)? loadSights,
    TResult? Function(Sight sight)? deleteFromVisited,
    TResult? Function(Sight sight)? deleteFromWantToVisit,
    TResult? Function(int fromIndex, int toIndex)? changeVisitedCardsSequences,
    TResult? Function(int fromIndex, int toIndex)?
        changeWantToVisitCardsSequences,
    TResult? Function(Sight sight, DateTime date)? addWantToVisitTime,
  }) {
    return changeVisitedCardsSequences?.call(fromIndex, toIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideLoading)? loadSights,
    TResult Function(Sight sight)? deleteFromVisited,
    TResult Function(Sight sight)? deleteFromWantToVisit,
    TResult Function(int fromIndex, int toIndex)? changeVisitedCardsSequences,
    TResult Function(int fromIndex, int toIndex)?
        changeWantToVisitCardsSequences,
    TResult Function(Sight sight, DateTime date)? addWantToVisitTime,
    required TResult orElse(),
  }) {
    if (changeVisitedCardsSequences != null) {
      return changeVisitedCardsSequences(fromIndex, toIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSights value) loadSights,
    required TResult Function(_DeleteFromVisited value) deleteFromVisited,
    required TResult Function(_DeleteFromWantToVisit value)
        deleteFromWantToVisit,
    required TResult Function(_ChangeVisitedCardsSequences value)
        changeVisitedCardsSequences,
    required TResult Function(_ChangeWantToVisitCardsSequences value)
        changeWantToVisitCardsSequences,
    required TResult Function(_AddWantToVisitTime value) addWantToVisitTime,
  }) {
    return changeVisitedCardsSequences(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSights value)? loadSights,
    TResult? Function(_DeleteFromVisited value)? deleteFromVisited,
    TResult? Function(_DeleteFromWantToVisit value)? deleteFromWantToVisit,
    TResult? Function(_ChangeVisitedCardsSequences value)?
        changeVisitedCardsSequences,
    TResult? Function(_ChangeWantToVisitCardsSequences value)?
        changeWantToVisitCardsSequences,
    TResult? Function(_AddWantToVisitTime value)? addWantToVisitTime,
  }) {
    return changeVisitedCardsSequences?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSights value)? loadSights,
    TResult Function(_DeleteFromVisited value)? deleteFromVisited,
    TResult Function(_DeleteFromWantToVisit value)? deleteFromWantToVisit,
    TResult Function(_ChangeVisitedCardsSequences value)?
        changeVisitedCardsSequences,
    TResult Function(_ChangeWantToVisitCardsSequences value)?
        changeWantToVisitCardsSequences,
    TResult Function(_AddWantToVisitTime value)? addWantToVisitTime,
    required TResult orElse(),
  }) {
    if (changeVisitedCardsSequences != null) {
      return changeVisitedCardsSequences(this);
    }
    return orElse();
  }
}

abstract class _ChangeVisitedCardsSequences implements VisitingEvent {
  const factory _ChangeVisitedCardsSequences(
      {required final int fromIndex,
      required final int toIndex}) = _$_ChangeVisitedCardsSequences;

  int get fromIndex;
  int get toIndex;
  @JsonKey(ignore: true)
  _$$_ChangeVisitedCardsSequencesCopyWith<_$_ChangeVisitedCardsSequences>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeWantToVisitCardsSequencesCopyWith<$Res> {
  factory _$$_ChangeWantToVisitCardsSequencesCopyWith(
          _$_ChangeWantToVisitCardsSequences value,
          $Res Function(_$_ChangeWantToVisitCardsSequences) then) =
      __$$_ChangeWantToVisitCardsSequencesCopyWithImpl<$Res>;
  @useResult
  $Res call({int fromIndex, int toIndex});
}

/// @nodoc
class __$$_ChangeWantToVisitCardsSequencesCopyWithImpl<$Res>
    extends _$VisitingEventCopyWithImpl<$Res,
        _$_ChangeWantToVisitCardsSequences>
    implements _$$_ChangeWantToVisitCardsSequencesCopyWith<$Res> {
  __$$_ChangeWantToVisitCardsSequencesCopyWithImpl(
      _$_ChangeWantToVisitCardsSequences _value,
      $Res Function(_$_ChangeWantToVisitCardsSequences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromIndex = null,
    Object? toIndex = null,
  }) {
    return _then(_$_ChangeWantToVisitCardsSequences(
      fromIndex: null == fromIndex
          ? _value.fromIndex
          : fromIndex // ignore: cast_nullable_to_non_nullable
              as int,
      toIndex: null == toIndex
          ? _value.toIndex
          : toIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangeWantToVisitCardsSequences
    implements _ChangeWantToVisitCardsSequences {
  const _$_ChangeWantToVisitCardsSequences(
      {required this.fromIndex, required this.toIndex});

  @override
  final int fromIndex;
  @override
  final int toIndex;

  @override
  String toString() {
    return 'VisitingEvent.changeWantToVisitCardsSequences(fromIndex: $fromIndex, toIndex: $toIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeWantToVisitCardsSequences &&
            (identical(other.fromIndex, fromIndex) ||
                other.fromIndex == fromIndex) &&
            (identical(other.toIndex, toIndex) || other.toIndex == toIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fromIndex, toIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeWantToVisitCardsSequencesCopyWith<
          _$_ChangeWantToVisitCardsSequences>
      get copyWith => __$$_ChangeWantToVisitCardsSequencesCopyWithImpl<
          _$_ChangeWantToVisitCardsSequences>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideLoading) loadSights,
    required TResult Function(Sight sight) deleteFromVisited,
    required TResult Function(Sight sight) deleteFromWantToVisit,
    required TResult Function(int fromIndex, int toIndex)
        changeVisitedCardsSequences,
    required TResult Function(int fromIndex, int toIndex)
        changeWantToVisitCardsSequences,
    required TResult Function(Sight sight, DateTime date) addWantToVisitTime,
  }) {
    return changeWantToVisitCardsSequences(fromIndex, toIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideLoading)? loadSights,
    TResult? Function(Sight sight)? deleteFromVisited,
    TResult? Function(Sight sight)? deleteFromWantToVisit,
    TResult? Function(int fromIndex, int toIndex)? changeVisitedCardsSequences,
    TResult? Function(int fromIndex, int toIndex)?
        changeWantToVisitCardsSequences,
    TResult? Function(Sight sight, DateTime date)? addWantToVisitTime,
  }) {
    return changeWantToVisitCardsSequences?.call(fromIndex, toIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideLoading)? loadSights,
    TResult Function(Sight sight)? deleteFromVisited,
    TResult Function(Sight sight)? deleteFromWantToVisit,
    TResult Function(int fromIndex, int toIndex)? changeVisitedCardsSequences,
    TResult Function(int fromIndex, int toIndex)?
        changeWantToVisitCardsSequences,
    TResult Function(Sight sight, DateTime date)? addWantToVisitTime,
    required TResult orElse(),
  }) {
    if (changeWantToVisitCardsSequences != null) {
      return changeWantToVisitCardsSequences(fromIndex, toIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSights value) loadSights,
    required TResult Function(_DeleteFromVisited value) deleteFromVisited,
    required TResult Function(_DeleteFromWantToVisit value)
        deleteFromWantToVisit,
    required TResult Function(_ChangeVisitedCardsSequences value)
        changeVisitedCardsSequences,
    required TResult Function(_ChangeWantToVisitCardsSequences value)
        changeWantToVisitCardsSequences,
    required TResult Function(_AddWantToVisitTime value) addWantToVisitTime,
  }) {
    return changeWantToVisitCardsSequences(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSights value)? loadSights,
    TResult? Function(_DeleteFromVisited value)? deleteFromVisited,
    TResult? Function(_DeleteFromWantToVisit value)? deleteFromWantToVisit,
    TResult? Function(_ChangeVisitedCardsSequences value)?
        changeVisitedCardsSequences,
    TResult? Function(_ChangeWantToVisitCardsSequences value)?
        changeWantToVisitCardsSequences,
    TResult? Function(_AddWantToVisitTime value)? addWantToVisitTime,
  }) {
    return changeWantToVisitCardsSequences?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSights value)? loadSights,
    TResult Function(_DeleteFromVisited value)? deleteFromVisited,
    TResult Function(_DeleteFromWantToVisit value)? deleteFromWantToVisit,
    TResult Function(_ChangeVisitedCardsSequences value)?
        changeVisitedCardsSequences,
    TResult Function(_ChangeWantToVisitCardsSequences value)?
        changeWantToVisitCardsSequences,
    TResult Function(_AddWantToVisitTime value)? addWantToVisitTime,
    required TResult orElse(),
  }) {
    if (changeWantToVisitCardsSequences != null) {
      return changeWantToVisitCardsSequences(this);
    }
    return orElse();
  }
}

abstract class _ChangeWantToVisitCardsSequences implements VisitingEvent {
  const factory _ChangeWantToVisitCardsSequences(
      {required final int fromIndex,
      required final int toIndex}) = _$_ChangeWantToVisitCardsSequences;

  int get fromIndex;
  int get toIndex;
  @JsonKey(ignore: true)
  _$$_ChangeWantToVisitCardsSequencesCopyWith<
          _$_ChangeWantToVisitCardsSequences>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddWantToVisitTimeCopyWith<$Res> {
  factory _$$_AddWantToVisitTimeCopyWith(_$_AddWantToVisitTime value,
          $Res Function(_$_AddWantToVisitTime) then) =
      __$$_AddWantToVisitTimeCopyWithImpl<$Res>;
  @useResult
  $Res call({Sight sight, DateTime date});
}

/// @nodoc
class __$$_AddWantToVisitTimeCopyWithImpl<$Res>
    extends _$VisitingEventCopyWithImpl<$Res, _$_AddWantToVisitTime>
    implements _$$_AddWantToVisitTimeCopyWith<$Res> {
  __$$_AddWantToVisitTimeCopyWithImpl(
      _$_AddWantToVisitTime _value, $Res Function(_$_AddWantToVisitTime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sight = null,
    Object? date = null,
  }) {
    return _then(_$_AddWantToVisitTime(
      sight: null == sight
          ? _value.sight
          : sight // ignore: cast_nullable_to_non_nullable
              as Sight,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_AddWantToVisitTime implements _AddWantToVisitTime {
  const _$_AddWantToVisitTime({required this.sight, required this.date});

  @override
  final Sight sight;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'VisitingEvent.addWantToVisitTime(sight: $sight, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddWantToVisitTime &&
            (identical(other.sight, sight) || other.sight == sight) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sight, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddWantToVisitTimeCopyWith<_$_AddWantToVisitTime> get copyWith =>
      __$$_AddWantToVisitTimeCopyWithImpl<_$_AddWantToVisitTime>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideLoading) loadSights,
    required TResult Function(Sight sight) deleteFromVisited,
    required TResult Function(Sight sight) deleteFromWantToVisit,
    required TResult Function(int fromIndex, int toIndex)
        changeVisitedCardsSequences,
    required TResult Function(int fromIndex, int toIndex)
        changeWantToVisitCardsSequences,
    required TResult Function(Sight sight, DateTime date) addWantToVisitTime,
  }) {
    return addWantToVisitTime(sight, date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideLoading)? loadSights,
    TResult? Function(Sight sight)? deleteFromVisited,
    TResult? Function(Sight sight)? deleteFromWantToVisit,
    TResult? Function(int fromIndex, int toIndex)? changeVisitedCardsSequences,
    TResult? Function(int fromIndex, int toIndex)?
        changeWantToVisitCardsSequences,
    TResult? Function(Sight sight, DateTime date)? addWantToVisitTime,
  }) {
    return addWantToVisitTime?.call(sight, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideLoading)? loadSights,
    TResult Function(Sight sight)? deleteFromVisited,
    TResult Function(Sight sight)? deleteFromWantToVisit,
    TResult Function(int fromIndex, int toIndex)? changeVisitedCardsSequences,
    TResult Function(int fromIndex, int toIndex)?
        changeWantToVisitCardsSequences,
    TResult Function(Sight sight, DateTime date)? addWantToVisitTime,
    required TResult orElse(),
  }) {
    if (addWantToVisitTime != null) {
      return addWantToVisitTime(sight, date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSights value) loadSights,
    required TResult Function(_DeleteFromVisited value) deleteFromVisited,
    required TResult Function(_DeleteFromWantToVisit value)
        deleteFromWantToVisit,
    required TResult Function(_ChangeVisitedCardsSequences value)
        changeVisitedCardsSequences,
    required TResult Function(_ChangeWantToVisitCardsSequences value)
        changeWantToVisitCardsSequences,
    required TResult Function(_AddWantToVisitTime value) addWantToVisitTime,
  }) {
    return addWantToVisitTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSights value)? loadSights,
    TResult? Function(_DeleteFromVisited value)? deleteFromVisited,
    TResult? Function(_DeleteFromWantToVisit value)? deleteFromWantToVisit,
    TResult? Function(_ChangeVisitedCardsSequences value)?
        changeVisitedCardsSequences,
    TResult? Function(_ChangeWantToVisitCardsSequences value)?
        changeWantToVisitCardsSequences,
    TResult? Function(_AddWantToVisitTime value)? addWantToVisitTime,
  }) {
    return addWantToVisitTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSights value)? loadSights,
    TResult Function(_DeleteFromVisited value)? deleteFromVisited,
    TResult Function(_DeleteFromWantToVisit value)? deleteFromWantToVisit,
    TResult Function(_ChangeVisitedCardsSequences value)?
        changeVisitedCardsSequences,
    TResult Function(_ChangeWantToVisitCardsSequences value)?
        changeWantToVisitCardsSequences,
    TResult Function(_AddWantToVisitTime value)? addWantToVisitTime,
    required TResult orElse(),
  }) {
    if (addWantToVisitTime != null) {
      return addWantToVisitTime(this);
    }
    return orElse();
  }
}

abstract class _AddWantToVisitTime implements VisitingEvent {
  const factory _AddWantToVisitTime(
      {required final Sight sight,
      required final DateTime date}) = _$_AddWantToVisitTime;

  Sight get sight;
  DateTime get date;
  @JsonKey(ignore: true)
  _$$_AddWantToVisitTimeCopyWith<_$_AddWantToVisitTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VisitingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingState,
    required TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)
        sightsReadyState,
    required TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)
        sightsUpdatesState,
    required TResult Function(Exception? error, String message) errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingState,
    TResult? Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsReadyState,
    TResult? Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsUpdatesState,
    TResult? Function(Exception? error, String message)? errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsReadyState,
    TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsUpdatesState,
    TResult Function(Exception? error, String message)? errorState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_SightsReadyState value) sightsReadyState,
    required TResult Function(_SightsUpdatesState value) sightsUpdatesState,
    required TResult Function(_ErrorState value) errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_SightsReadyState value)? sightsReadyState,
    TResult? Function(_SightsUpdatesState value)? sightsUpdatesState,
    TResult? Function(_ErrorState value)? errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_SightsReadyState value)? sightsReadyState,
    TResult Function(_SightsUpdatesState value)? sightsUpdatesState,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitingStateCopyWith<$Res> {
  factory $VisitingStateCopyWith(
          VisitingState value, $Res Function(VisitingState) then) =
      _$VisitingStateCopyWithImpl<$Res, VisitingState>;
}

/// @nodoc
class _$VisitingStateCopyWithImpl<$Res, $Val extends VisitingState>
    implements $VisitingStateCopyWith<$Res> {
  _$VisitingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadingStateCopyWith<$Res> {
  factory _$$_LoadingStateCopyWith(
          _$_LoadingState value, $Res Function(_$_LoadingState) then) =
      __$$_LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingStateCopyWithImpl<$Res>
    extends _$VisitingStateCopyWithImpl<$Res, _$_LoadingState>
    implements _$$_LoadingStateCopyWith<$Res> {
  __$$_LoadingStateCopyWithImpl(
      _$_LoadingState _value, $Res Function(_$_LoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadingState extends _LoadingState {
  const _$_LoadingState() : super._();

  @override
  String toString() {
    return 'VisitingState.loadingState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingState,
    required TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)
        sightsReadyState,
    required TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)
        sightsUpdatesState,
    required TResult Function(Exception? error, String message) errorState,
  }) {
    return loadingState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingState,
    TResult? Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsReadyState,
    TResult? Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsUpdatesState,
    TResult? Function(Exception? error, String message)? errorState,
  }) {
    return loadingState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsReadyState,
    TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsUpdatesState,
    TResult Function(Exception? error, String message)? errorState,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_SightsReadyState value) sightsReadyState,
    required TResult Function(_SightsUpdatesState value) sightsUpdatesState,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return loadingState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_SightsReadyState value)? sightsReadyState,
    TResult? Function(_SightsUpdatesState value)? sightsUpdatesState,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return loadingState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_SightsReadyState value)? sightsReadyState,
    TResult Function(_SightsUpdatesState value)? sightsUpdatesState,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState(this);
    }
    return orElse();
  }
}

abstract class _LoadingState extends VisitingState {
  const factory _LoadingState() = _$_LoadingState;
  const _LoadingState._() : super._();
}

/// @nodoc
abstract class _$$_SightsReadyStateCopyWith<$Res> {
  factory _$$_SightsReadyStateCopyWith(
          _$_SightsReadyState value, $Res Function(_$_SightsReadyState) then) =
      __$$_SightsReadyStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<SightWantToVisit> wantToVisitSights,
      List<SightWantToVisit> visitedSights});
}

/// @nodoc
class __$$_SightsReadyStateCopyWithImpl<$Res>
    extends _$VisitingStateCopyWithImpl<$Res, _$_SightsReadyState>
    implements _$$_SightsReadyStateCopyWith<$Res> {
  __$$_SightsReadyStateCopyWithImpl(
      _$_SightsReadyState _value, $Res Function(_$_SightsReadyState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wantToVisitSights = null,
    Object? visitedSights = null,
  }) {
    return _then(_$_SightsReadyState(
      wantToVisitSights: null == wantToVisitSights
          ? _value._wantToVisitSights
          : wantToVisitSights // ignore: cast_nullable_to_non_nullable
              as List<SightWantToVisit>,
      visitedSights: null == visitedSights
          ? _value._visitedSights
          : visitedSights // ignore: cast_nullable_to_non_nullable
              as List<SightWantToVisit>,
    ));
  }
}

/// @nodoc

class _$_SightsReadyState extends _SightsReadyState {
  const _$_SightsReadyState(
      {required final List<SightWantToVisit> wantToVisitSights,
      required final List<SightWantToVisit> visitedSights})
      : _wantToVisitSights = wantToVisitSights,
        _visitedSights = visitedSights,
        super._();

  final List<SightWantToVisit> _wantToVisitSights;
  @override
  List<SightWantToVisit> get wantToVisitSights {
    if (_wantToVisitSights is EqualUnmodifiableListView)
      return _wantToVisitSights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wantToVisitSights);
  }

  final List<SightWantToVisit> _visitedSights;
  @override
  List<SightWantToVisit> get visitedSights {
    if (_visitedSights is EqualUnmodifiableListView) return _visitedSights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visitedSights);
  }

  @override
  String toString() {
    return 'VisitingState.sightsReadyState(wantToVisitSights: $wantToVisitSights, visitedSights: $visitedSights)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SightsReadyState &&
            const DeepCollectionEquality()
                .equals(other._wantToVisitSights, _wantToVisitSights) &&
            const DeepCollectionEquality()
                .equals(other._visitedSights, _visitedSights));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_wantToVisitSights),
      const DeepCollectionEquality().hash(_visitedSights));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SightsReadyStateCopyWith<_$_SightsReadyState> get copyWith =>
      __$$_SightsReadyStateCopyWithImpl<_$_SightsReadyState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingState,
    required TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)
        sightsReadyState,
    required TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)
        sightsUpdatesState,
    required TResult Function(Exception? error, String message) errorState,
  }) {
    return sightsReadyState(wantToVisitSights, visitedSights);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingState,
    TResult? Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsReadyState,
    TResult? Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsUpdatesState,
    TResult? Function(Exception? error, String message)? errorState,
  }) {
    return sightsReadyState?.call(wantToVisitSights, visitedSights);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsReadyState,
    TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsUpdatesState,
    TResult Function(Exception? error, String message)? errorState,
    required TResult orElse(),
  }) {
    if (sightsReadyState != null) {
      return sightsReadyState(wantToVisitSights, visitedSights);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_SightsReadyState value) sightsReadyState,
    required TResult Function(_SightsUpdatesState value) sightsUpdatesState,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return sightsReadyState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_SightsReadyState value)? sightsReadyState,
    TResult? Function(_SightsUpdatesState value)? sightsUpdatesState,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return sightsReadyState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_SightsReadyState value)? sightsReadyState,
    TResult Function(_SightsUpdatesState value)? sightsUpdatesState,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (sightsReadyState != null) {
      return sightsReadyState(this);
    }
    return orElse();
  }
}

abstract class _SightsReadyState extends VisitingState {
  const factory _SightsReadyState(
          {required final List<SightWantToVisit> wantToVisitSights,
          required final List<SightWantToVisit> visitedSights}) =
      _$_SightsReadyState;
  const _SightsReadyState._() : super._();

  List<SightWantToVisit> get wantToVisitSights;
  List<SightWantToVisit> get visitedSights;
  @JsonKey(ignore: true)
  _$$_SightsReadyStateCopyWith<_$_SightsReadyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SightsUpdatesStateCopyWith<$Res> {
  factory _$$_SightsUpdatesStateCopyWith(_$_SightsUpdatesState value,
          $Res Function(_$_SightsUpdatesState) then) =
      __$$_SightsUpdatesStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<SightWantToVisit> wantToVisitSights,
      List<SightWantToVisit> visitedSights});
}

/// @nodoc
class __$$_SightsUpdatesStateCopyWithImpl<$Res>
    extends _$VisitingStateCopyWithImpl<$Res, _$_SightsUpdatesState>
    implements _$$_SightsUpdatesStateCopyWith<$Res> {
  __$$_SightsUpdatesStateCopyWithImpl(
      _$_SightsUpdatesState _value, $Res Function(_$_SightsUpdatesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wantToVisitSights = null,
    Object? visitedSights = null,
  }) {
    return _then(_$_SightsUpdatesState(
      wantToVisitSights: null == wantToVisitSights
          ? _value._wantToVisitSights
          : wantToVisitSights // ignore: cast_nullable_to_non_nullable
              as List<SightWantToVisit>,
      visitedSights: null == visitedSights
          ? _value._visitedSights
          : visitedSights // ignore: cast_nullable_to_non_nullable
              as List<SightWantToVisit>,
    ));
  }
}

/// @nodoc

class _$_SightsUpdatesState extends _SightsUpdatesState {
  const _$_SightsUpdatesState(
      {required final List<SightWantToVisit> wantToVisitSights,
      required final List<SightWantToVisit> visitedSights})
      : _wantToVisitSights = wantToVisitSights,
        _visitedSights = visitedSights,
        super._();

  final List<SightWantToVisit> _wantToVisitSights;
  @override
  List<SightWantToVisit> get wantToVisitSights {
    if (_wantToVisitSights is EqualUnmodifiableListView)
      return _wantToVisitSights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wantToVisitSights);
  }

  final List<SightWantToVisit> _visitedSights;
  @override
  List<SightWantToVisit> get visitedSights {
    if (_visitedSights is EqualUnmodifiableListView) return _visitedSights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visitedSights);
  }

  @override
  String toString() {
    return 'VisitingState.sightsUpdatesState(wantToVisitSights: $wantToVisitSights, visitedSights: $visitedSights)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SightsUpdatesState &&
            const DeepCollectionEquality()
                .equals(other._wantToVisitSights, _wantToVisitSights) &&
            const DeepCollectionEquality()
                .equals(other._visitedSights, _visitedSights));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_wantToVisitSights),
      const DeepCollectionEquality().hash(_visitedSights));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SightsUpdatesStateCopyWith<_$_SightsUpdatesState> get copyWith =>
      __$$_SightsUpdatesStateCopyWithImpl<_$_SightsUpdatesState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingState,
    required TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)
        sightsReadyState,
    required TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)
        sightsUpdatesState,
    required TResult Function(Exception? error, String message) errorState,
  }) {
    return sightsUpdatesState(wantToVisitSights, visitedSights);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingState,
    TResult? Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsReadyState,
    TResult? Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsUpdatesState,
    TResult? Function(Exception? error, String message)? errorState,
  }) {
    return sightsUpdatesState?.call(wantToVisitSights, visitedSights);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsReadyState,
    TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsUpdatesState,
    TResult Function(Exception? error, String message)? errorState,
    required TResult orElse(),
  }) {
    if (sightsUpdatesState != null) {
      return sightsUpdatesState(wantToVisitSights, visitedSights);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_SightsReadyState value) sightsReadyState,
    required TResult Function(_SightsUpdatesState value) sightsUpdatesState,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return sightsUpdatesState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_SightsReadyState value)? sightsReadyState,
    TResult? Function(_SightsUpdatesState value)? sightsUpdatesState,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return sightsUpdatesState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_SightsReadyState value)? sightsReadyState,
    TResult Function(_SightsUpdatesState value)? sightsUpdatesState,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (sightsUpdatesState != null) {
      return sightsUpdatesState(this);
    }
    return orElse();
  }
}

abstract class _SightsUpdatesState extends VisitingState {
  const factory _SightsUpdatesState(
          {required final List<SightWantToVisit> wantToVisitSights,
          required final List<SightWantToVisit> visitedSights}) =
      _$_SightsUpdatesState;
  const _SightsUpdatesState._() : super._();

  List<SightWantToVisit> get wantToVisitSights;
  List<SightWantToVisit> get visitedSights;
  @JsonKey(ignore: true)
  _$$_SightsUpdatesStateCopyWith<_$_SightsUpdatesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorStateCopyWith<$Res> {
  factory _$$_ErrorStateCopyWith(
          _$_ErrorState value, $Res Function(_$_ErrorState) then) =
      __$$_ErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception? error, String message});
}

/// @nodoc
class __$$_ErrorStateCopyWithImpl<$Res>
    extends _$VisitingStateCopyWithImpl<$Res, _$_ErrorState>
    implements _$$_ErrorStateCopyWith<$Res> {
  __$$_ErrorStateCopyWithImpl(
      _$_ErrorState _value, $Res Function(_$_ErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = null,
  }) {
    return _then(_$_ErrorState(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorState extends _ErrorState {
  const _$_ErrorState(
      {this.error, this.message = 'При загрузке произошла ошибка'})
      : super._();

  @override
  final Exception? error;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'VisitingState.errorState(error: $error, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorState &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorStateCopyWith<_$_ErrorState> get copyWith =>
      __$$_ErrorStateCopyWithImpl<_$_ErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingState,
    required TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)
        sightsReadyState,
    required TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)
        sightsUpdatesState,
    required TResult Function(Exception? error, String message) errorState,
  }) {
    return errorState(error, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingState,
    TResult? Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsReadyState,
    TResult? Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsUpdatesState,
    TResult? Function(Exception? error, String message)? errorState,
  }) {
    return errorState?.call(error, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingState,
    TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsReadyState,
    TResult Function(List<SightWantToVisit> wantToVisitSights,
            List<SightWantToVisit> visitedSights)?
        sightsUpdatesState,
    TResult Function(Exception? error, String message)? errorState,
    required TResult orElse(),
  }) {
    if (errorState != null) {
      return errorState(error, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_SightsReadyState value) sightsReadyState,
    required TResult Function(_SightsUpdatesState value) sightsUpdatesState,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return errorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_SightsReadyState value)? sightsReadyState,
    TResult? Function(_SightsUpdatesState value)? sightsUpdatesState,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return errorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_SightsReadyState value)? sightsReadyState,
    TResult Function(_SightsUpdatesState value)? sightsUpdatesState,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (errorState != null) {
      return errorState(this);
    }
    return orElse();
  }
}

abstract class _ErrorState extends VisitingState {
  const factory _ErrorState({final Exception? error, final String message}) =
      _$_ErrorState;
  const _ErrorState._() : super._();

  Exception? get error;
  String get message;
  @JsonKey(ignore: true)
  _$$_ErrorStateCopyWith<_$_ErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
