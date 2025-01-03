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
import 'enums/keys.dart' as _i4;
import 'enums/track_type.dart' as _i5;
import 'exceptions/appexception.dart' as _i6;
import 'exceptions/exceptiontype.enum.dart' as _i7;
import 'follower.dart' as _i8;
import 'tracks.dart' as _i9;
import 'package:sama3ni_client/src/protocol/artists.dart' as _i10;
import 'package:sama3ni_client/src/protocol/categories.dart' as _i11;
import 'package:sama3ni_client/src/protocol/follower.dart' as _i12;
import 'package:sama3ni_client/src/protocol/tracks.dart' as _i13;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i14;
export 'artists.dart';
export 'categories.dart';
export 'enums/keys.dart';
export 'enums/track_type.dart';
export 'exceptions/appexception.dart';
export 'exceptions/exceptiontype.enum.dart';
export 'follower.dart';
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
    if (t == _i4.Keys) {
      return _i4.Keys.fromJson(data) as T;
    }
    if (t == _i5.TrackType) {
      return _i5.TrackType.fromJson(data) as T;
    }
    if (t == _i6.AppException) {
      return _i6.AppException.fromJson(data) as T;
    }
    if (t == _i7.ExceptionType) {
      return _i7.ExceptionType.fromJson(data) as T;
    }
    if (t == _i8.Follower) {
      return _i8.Follower.fromJson(data) as T;
    }
    if (t == _i9.Track) {
      return _i9.Track.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Artist?>()) {
      return (data != null ? _i2.Artist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Category?>()) {
      return (data != null ? _i3.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Keys?>()) {
      return (data != null ? _i4.Keys.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.TrackType?>()) {
      return (data != null ? _i5.TrackType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AppException?>()) {
      return (data != null ? _i6.AppException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ExceptionType?>()) {
      return (data != null ? _i7.ExceptionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Follower?>()) {
      return (data != null ? _i8.Follower.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Track?>()) {
      return (data != null ? _i9.Track.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i8.Follower>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i8.Follower>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i8.Follower>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i8.Follower>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i10.Artist>) {
      return (data as List).map((e) => deserialize<_i10.Artist>(e)).toList()
          as dynamic;
    }
    if (t == List<_i11.Category>) {
      return (data as List).map((e) => deserialize<_i11.Category>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.Follower>) {
      return (data as List).map((e) => deserialize<_i12.Follower>(e)).toList()
          as dynamic;
    }
    if (t == List<_i13.Track>) {
      return (data as List).map((e) => deserialize<_i13.Track>(e)).toList()
          as dynamic;
    }
    try {
      return _i14.Protocol().deserialize<T>(data, t);
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
    if (data is _i4.Keys) {
      return 'Keys';
    }
    if (data is _i5.TrackType) {
      return 'TrackType';
    }
    if (data is _i6.AppException) {
      return 'AppException';
    }
    if (data is _i7.ExceptionType) {
      return 'ExceptionType';
    }
    if (data is _i8.Follower) {
      return 'Follower';
    }
    if (data is _i9.Track) {
      return 'Track';
    }
    className = _i14.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Keys') {
      return deserialize<_i4.Keys>(data['data']);
    }
    if (dataClassName == 'TrackType') {
      return deserialize<_i5.TrackType>(data['data']);
    }
    if (dataClassName == 'AppException') {
      return deserialize<_i6.AppException>(data['data']);
    }
    if (dataClassName == 'ExceptionType') {
      return deserialize<_i7.ExceptionType>(data['data']);
    }
    if (dataClassName == 'Follower') {
      return deserialize<_i8.Follower>(data['data']);
    }
    if (dataClassName == 'Track') {
      return deserialize<_i9.Track>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i14.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
