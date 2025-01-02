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
import 'enums/track_type.dart' as _i4;
import 'exceptions/appexception.dart' as _i5;
import 'exceptions/exceptiontype.enum.dart' as _i6;
import 'tracks.dart' as _i7;
import 'package:sama3ni_client/src/protocol/artists.dart' as _i8;
import 'package:sama3ni_client/src/protocol/categories.dart' as _i9;
import 'package:sama3ni_client/src/protocol/tracks.dart' as _i10;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i11;
export 'artists.dart';
export 'categories.dart';
export 'enums/track_type.dart';
export 'exceptions/appexception.dart';
export 'exceptions/exceptiontype.enum.dart';
export 'tracks.dart';
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
    if (t == _i4.TrackType) {
      return _i4.TrackType.fromJson(data) as T;
    }
    if (t == _i5.AppException) {
      return _i5.AppException.fromJson(data) as T;
    }
    if (t == _i6.ExceptionType) {
      return _i6.ExceptionType.fromJson(data) as T;
    }
    if (t == _i7.Track) {
      return _i7.Track.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Artist?>()) {
      return (data != null ? _i2.Artist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Category?>()) {
      return (data != null ? _i3.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.TrackType?>()) {
      return (data != null ? _i4.TrackType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.AppException?>()) {
      return (data != null ? _i5.AppException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ExceptionType?>()) {
      return (data != null ? _i6.ExceptionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Track?>()) {
      return (data != null ? _i7.Track.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i7.Track>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i7.Track>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i8.Artist>) {
      return (data as List).map((e) => deserialize<_i8.Artist>(e)).toList()
          as dynamic;
    }
    if (t == List<_i9.Category>) {
      return (data as List).map((e) => deserialize<_i9.Category>(e)).toList()
          as dynamic;
    }
    if (t == List<_i10.Track>) {
      return (data as List).map((e) => deserialize<_i10.Track>(e)).toList()
          as dynamic;
    }
    try {
      return _i11.Protocol().deserialize<T>(data, t);
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
    if (data is _i4.TrackType) {
      return 'TrackType';
    }
    if (data is _i5.AppException) {
      return 'AppException';
    }
    if (data is _i6.ExceptionType) {
      return 'ExceptionType';
    }
    if (data is _i7.Track) {
      return 'Track';
    }
    className = _i11.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'TrackType') {
      return deserialize<_i4.TrackType>(data['data']);
    }
    if (dataClassName == 'AppException') {
      return deserialize<_i5.AppException>(data['data']);
    }
    if (dataClassName == 'ExceptionType') {
      return deserialize<_i6.ExceptionType>(data['data']);
    }
    if (dataClassName == 'Track') {
      return deserialize<_i7.Track>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i11.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
