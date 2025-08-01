// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'technology.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Technology {

 String? get id; String get name; String get iconPath;
/// Create a copy of Technology
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TechnologyCopyWith<Technology> get copyWith => _$TechnologyCopyWithImpl<Technology>(this as Technology, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Technology&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,iconPath);

@override
String toString() {
  return 'Technology(id: $id, name: $name, iconPath: $iconPath)';
}


}

/// @nodoc
abstract mixin class $TechnologyCopyWith<$Res>  {
  factory $TechnologyCopyWith(Technology value, $Res Function(Technology) _then) = _$TechnologyCopyWithImpl;
@useResult
$Res call({
 String? id, String name, String iconPath
});




}
/// @nodoc
class _$TechnologyCopyWithImpl<$Res>
    implements $TechnologyCopyWith<$Res> {
  _$TechnologyCopyWithImpl(this._self, this._then);

  final Technology _self;
  final $Res Function(Technology) _then;

/// Create a copy of Technology
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? iconPath = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconPath: null == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Technology].
extension TechnologyPatterns on Technology {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Technology value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Technology() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Technology value)  $default,){
final _that = this;
switch (_that) {
case _Technology():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Technology value)?  $default,){
final _that = this;
switch (_that) {
case _Technology() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name,  String iconPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Technology() when $default != null:
return $default(_that.id,_that.name,_that.iconPath);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name,  String iconPath)  $default,) {final _that = this;
switch (_that) {
case _Technology():
return $default(_that.id,_that.name,_that.iconPath);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name,  String iconPath)?  $default,) {final _that = this;
switch (_that) {
case _Technology() when $default != null:
return $default(_that.id,_that.name,_that.iconPath);case _:
  return null;

}
}

}

/// @nodoc


class _Technology implements Technology {
  const _Technology({this.id, required this.name, required this.iconPath});
  

@override final  String? id;
@override final  String name;
@override final  String iconPath;

/// Create a copy of Technology
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TechnologyCopyWith<_Technology> get copyWith => __$TechnologyCopyWithImpl<_Technology>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Technology&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,iconPath);

@override
String toString() {
  return 'Technology(id: $id, name: $name, iconPath: $iconPath)';
}


}

/// @nodoc
abstract mixin class _$TechnologyCopyWith<$Res> implements $TechnologyCopyWith<$Res> {
  factory _$TechnologyCopyWith(_Technology value, $Res Function(_Technology) _then) = __$TechnologyCopyWithImpl;
@override @useResult
$Res call({
 String? id, String name, String iconPath
});




}
/// @nodoc
class __$TechnologyCopyWithImpl<$Res>
    implements _$TechnologyCopyWith<$Res> {
  __$TechnologyCopyWithImpl(this._self, this._then);

  final _Technology _self;
  final $Res Function(_Technology) _then;

/// Create a copy of Technology
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? iconPath = null,}) {
  return _then(_Technology(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconPath: null == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
