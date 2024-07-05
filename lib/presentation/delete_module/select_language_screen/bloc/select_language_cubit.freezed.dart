// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_language_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectLanguageState {
  List<LanguageResponseDto> get languageList =>
      throw _privateConstructorUsedError;
  ScreenStateUIModel get screenState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectLanguageStateCopyWith<SelectLanguageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectLanguageStateCopyWith<$Res> {
  factory $SelectLanguageStateCopyWith(
          SelectLanguageState value, $Res Function(SelectLanguageState) then) =
      _$SelectLanguageStateCopyWithImpl<$Res, SelectLanguageState>;
  @useResult
  $Res call(
      {List<LanguageResponseDto> languageList, ScreenStateUIModel screenState});
}

/// @nodoc
class _$SelectLanguageStateCopyWithImpl<$Res, $Val extends SelectLanguageState>
    implements $SelectLanguageStateCopyWith<$Res> {
  _$SelectLanguageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageList = null,
    Object? screenState = null,
  }) {
    return _then(_value.copyWith(
      languageList: null == languageList
          ? _value.languageList
          : languageList // ignore: cast_nullable_to_non_nullable
              as List<LanguageResponseDto>,
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenStateUIModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectLanguageStateImplCopyWith<$Res>
    implements $SelectLanguageStateCopyWith<$Res> {
  factory _$$SelectLanguageStateImplCopyWith(_$SelectLanguageStateImpl value,
          $Res Function(_$SelectLanguageStateImpl) then) =
      __$$SelectLanguageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LanguageResponseDto> languageList, ScreenStateUIModel screenState});
}

/// @nodoc
class __$$SelectLanguageStateImplCopyWithImpl<$Res>
    extends _$SelectLanguageStateCopyWithImpl<$Res, _$SelectLanguageStateImpl>
    implements _$$SelectLanguageStateImplCopyWith<$Res> {
  __$$SelectLanguageStateImplCopyWithImpl(_$SelectLanguageStateImpl _value,
      $Res Function(_$SelectLanguageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageList = null,
    Object? screenState = null,
  }) {
    return _then(_$SelectLanguageStateImpl(
      languageList: null == languageList
          ? _value._languageList
          : languageList // ignore: cast_nullable_to_non_nullable
              as List<LanguageResponseDto>,
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenStateUIModel,
    ));
  }
}

/// @nodoc

class _$SelectLanguageStateImpl implements _SelectLanguageState {
  const _$SelectLanguageStateImpl(
      {final List<LanguageResponseDto> languageList = const [],
      required this.screenState})
      : _languageList = languageList;

  final List<LanguageResponseDto> _languageList;
  @override
  @JsonKey()
  List<LanguageResponseDto> get languageList {
    if (_languageList is EqualUnmodifiableListView) return _languageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languageList);
  }

  @override
  final ScreenStateUIModel screenState;

  @override
  String toString() {
    return 'SelectLanguageState(languageList: $languageList, screenState: $screenState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectLanguageStateImpl &&
            const DeepCollectionEquality()
                .equals(other._languageList, _languageList) &&
            (identical(other.screenState, screenState) ||
                other.screenState == screenState));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_languageList), screenState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectLanguageStateImplCopyWith<_$SelectLanguageStateImpl> get copyWith =>
      __$$SelectLanguageStateImplCopyWithImpl<_$SelectLanguageStateImpl>(
          this, _$identity);
}

abstract class _SelectLanguageState implements SelectLanguageState {
  const factory _SelectLanguageState(
          {final List<LanguageResponseDto> languageList,
          required final ScreenStateUIModel screenState}) =
      _$SelectLanguageStateImpl;

  @override
  List<LanguageResponseDto> get languageList;
  @override
  ScreenStateUIModel get screenState;
  @override
  @JsonKey(ignore: true)
  _$$SelectLanguageStateImplCopyWith<_$SelectLanguageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
