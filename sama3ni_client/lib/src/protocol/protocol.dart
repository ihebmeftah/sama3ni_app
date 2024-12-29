/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'artists.dart' as _i2;
import 'categories.dart' as _i3;
import 'exceptions/appexception.dart' as _i4;
import 'exceptions/exceptiontype.enum.dart' as _i5;
import 'package:sama3ni_client/src/protocol/artists.dart' as _i6;
import 'package:sama3ni_client/src/protocol/categories.dart' as _i7;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i8;
export 'artists.dart';
export 'categories.dart';
export 'exceptions/appexception.dart';
export 'exceptions/exceptiontype.enum.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Artist) {
      return _i2.Artist.fromJson(data) as T;
    }
    if (t == _i3.Category) {
      return _i3.Category.fromJson(data) as T;
    }
    if (t == _i4.AppException) {
      return _i4.AppException.fromJson(data) as T;
    }
    if (t == _i5.ExceptionType) {
      return _i5.ExceptionType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Artist?>()) {
      return (data != null ? _i2.Artist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Category?>()) {
      return (data != null ? _i3.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.AppException?>()) {
      return (data != null ? _i4.AppException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ExceptionType?>()) {
      return (data != null ? _i5.ExceptionType.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i6.Artist>) {
      return (data as List).map((e) => deserialize<_i6.Artist>(e)).toList()
          as dynamic;
    }
    if (t == List<_i7.Category>) {
      return (data as List).map((e) => deserialize<_i7.Category>(e)).toList()
          as dynamic;
    }
    try {
      return _i8.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Artist) {
      return 'Artist';
    }
    if (data is _i3.Category) {
      return 'Category';
    }
    if (data is _i4.AppException) {
      return 'AppException';
    }
    if (data is _i5.ExceptionType) {
      return 'ExceptionType';
    }
    className = _i8.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Artist') {
      return deserialize<_i2.Artist>(data['data']);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i3.Category>(data['data']);
    }
    if (dataClassName == 'AppException') {
      return deserialize<_i4.AppException>(data['data']);
    }
    if (dataClassName == 'ExceptionType') {
      return deserialize<_i5.ExceptionType>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i8.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
