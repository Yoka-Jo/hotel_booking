// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$_LoginObjectCopyWith(
          _$_LoginObject value, $Res Function(_$_LoginObject) then) =
      __$$_LoginObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_LoginObjectCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$_LoginObject>
    implements _$$_LoginObjectCopyWith<$Res> {
  __$$_LoginObjectCopyWithImpl(
      _$_LoginObject _value, $Res Function(_$_LoginObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_LoginObject(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginObject &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      __$$_LoginObjectCopyWithImpl<_$_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(
      {required final String email,
      required final String password}) = _$_LoginObject;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpObject {
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpObjectCopyWith<SignUpObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpObjectCopyWith<$Res> {
  factory $SignUpObjectCopyWith(
          SignUpObject value, $Res Function(SignUpObject) then) =
      _$SignUpObjectCopyWithImpl<$Res, SignUpObject>;
  @useResult
  $Res call({String userName, String email, String password});
}

/// @nodoc
class _$SignUpObjectCopyWithImpl<$Res, $Val extends SignUpObject>
    implements $SignUpObjectCopyWith<$Res> {
  _$SignUpObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpObjectCopyWith<$Res>
    implements $SignUpObjectCopyWith<$Res> {
  factory _$$_SignUpObjectCopyWith(
          _$_SignUpObject value, $Res Function(_$_SignUpObject) then) =
      __$$_SignUpObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String email, String password});
}

/// @nodoc
class __$$_SignUpObjectCopyWithImpl<$Res>
    extends _$SignUpObjectCopyWithImpl<$Res, _$_SignUpObject>
    implements _$$_SignUpObjectCopyWith<$Res> {
  __$$_SignUpObjectCopyWithImpl(
      _$_SignUpObject _value, $Res Function(_$_SignUpObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_SignUpObject(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignUpObject implements _SignUpObject {
  _$_SignUpObject(
      {required this.userName, required this.email, required this.password});

  @override
  final String userName;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpObject(userName: $userName, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpObject &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpObjectCopyWith<_$_SignUpObject> get copyWith =>
      __$$_SignUpObjectCopyWithImpl<_$_SignUpObject>(this, _$identity);
}

abstract class _SignUpObject implements SignUpObject {
  factory _SignUpObject(
      {required final String userName,
      required final String email,
      required final String password}) = _$_SignUpObject;

  @override
  String get userName;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpObjectCopyWith<_$_SignUpObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ResetPasswordObject {
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordObjectCopyWith<ResetPasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordObjectCopyWith<$Res> {
  factory $ResetPasswordObjectCopyWith(
          ResetPasswordObject value, $Res Function(ResetPasswordObject) then) =
      _$ResetPasswordObjectCopyWithImpl<$Res, ResetPasswordObject>;
  @useResult
  $Res call({String password, String confirmPassword});
}

/// @nodoc
class _$ResetPasswordObjectCopyWithImpl<$Res, $Val extends ResetPasswordObject>
    implements $ResetPasswordObjectCopyWith<$Res> {
  _$ResetPasswordObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResetPasswordObjectCopyWith<$Res>
    implements $ResetPasswordObjectCopyWith<$Res> {
  factory _$$_ResetPasswordObjectCopyWith(_$_ResetPasswordObject value,
          $Res Function(_$_ResetPasswordObject) then) =
      __$$_ResetPasswordObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String password, String confirmPassword});
}

/// @nodoc
class __$$_ResetPasswordObjectCopyWithImpl<$Res>
    extends _$ResetPasswordObjectCopyWithImpl<$Res, _$_ResetPasswordObject>
    implements _$$_ResetPasswordObjectCopyWith<$Res> {
  __$$_ResetPasswordObjectCopyWithImpl(_$_ResetPasswordObject _value,
      $Res Function(_$_ResetPasswordObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$_ResetPasswordObject(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ResetPasswordObject implements _ResetPasswordObject {
  _$_ResetPasswordObject(
      {required this.password, required this.confirmPassword});

  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'ResetPasswordObject(password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPasswordObject &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, confirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResetPasswordObjectCopyWith<_$_ResetPasswordObject> get copyWith =>
      __$$_ResetPasswordObjectCopyWithImpl<_$_ResetPasswordObject>(
          this, _$identity);
}

abstract class _ResetPasswordObject implements ResetPasswordObject {
  factory _ResetPasswordObject(
      {required final String password,
      required final String confirmPassword}) = _$_ResetPasswordObject;

  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordObjectCopyWith<_$_ResetPasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgotPasswordObject {
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordObjectCopyWith<ForgotPasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordObjectCopyWith<$Res> {
  factory $ForgotPasswordObjectCopyWith(ForgotPasswordObject value,
          $Res Function(ForgotPasswordObject) then) =
      _$ForgotPasswordObjectCopyWithImpl<$Res, ForgotPasswordObject>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPasswordObjectCopyWithImpl<$Res,
        $Val extends ForgotPasswordObject>
    implements $ForgotPasswordObjectCopyWith<$Res> {
  _$ForgotPasswordObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordObjectCopyWith<$Res>
    implements $ForgotPasswordObjectCopyWith<$Res> {
  factory _$$_ForgotPasswordObjectCopyWith(_$_ForgotPasswordObject value,
          $Res Function(_$_ForgotPasswordObject) then) =
      __$$_ForgotPasswordObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_ForgotPasswordObjectCopyWithImpl<$Res>
    extends _$ForgotPasswordObjectCopyWithImpl<$Res, _$_ForgotPasswordObject>
    implements _$$_ForgotPasswordObjectCopyWith<$Res> {
  __$$_ForgotPasswordObjectCopyWithImpl(_$_ForgotPasswordObject _value,
      $Res Function(_$_ForgotPasswordObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_ForgotPasswordObject(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ForgotPasswordObject implements _ForgotPasswordObject {
  _$_ForgotPasswordObject({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordObject(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordObject &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordObjectCopyWith<_$_ForgotPasswordObject> get copyWith =>
      __$$_ForgotPasswordObjectCopyWithImpl<_$_ForgotPasswordObject>(
          this, _$identity);
}

abstract class _ForgotPasswordObject implements ForgotPasswordObject {
  factory _ForgotPasswordObject({required final String email}) =
      _$_ForgotPasswordObject;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordObjectCopyWith<_$_ForgotPasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}
