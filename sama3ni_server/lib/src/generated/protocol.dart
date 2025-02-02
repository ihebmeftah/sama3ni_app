/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'artists.dart' as _i4;
import 'categories.dart' as _i5;
import 'enums/keys.dart' as _i6;
import 'enums/track_type.dart' as _i7;
import 'exceptions/appexception.dart' as _i8;
import 'exceptions/exceptiontype.enum.dart' as _i9;
import 'favoris.dart' as _i10;
import 'follower.dart' as _i11;
import 'track_comments.dart' as _i12;
import 'tracks.dart' as _i13;
import 'package:sama3ni_server/src/generated/artists.dart' as _i14;
import 'package:sama3ni_server/src/generated/categories.dart' as _i15;
import 'package:sama3ni_server/src/generated/track_comments.dart' as _i16;
import 'package:sama3ni_server/src/generated/favoris.dart' as _i17;
import 'package:sama3ni_server/src/generated/follower.dart' as _i18;
import 'package:sama3ni_server/src/generated/tracks.dart' as _i19;
export 'artists.dart';
export 'categories.dart';
export 'enums/keys.dart';
export 'enums/track_type.dart';
export 'exceptions/appexception.dart';
export 'exceptions/exceptiontype.enum.dart';
export 'favoris.dart';
export 'follower.dart';
export 'track_comments.dart';
export 'tracks.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'artists',
      dartName: 'Artist',
      schema: 'public',
      module: 'sama3ni',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'artists_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'displayName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'address',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'bio',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'tags',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'iglink',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'soundcloudlink',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'youtubelink',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'coverphotoUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'artists_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'artists_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_info_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'categories',
      dartName: 'Category',
      schema: 'public',
      module: 'sama3ni',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'categories_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'photo',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'categories_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'comments',
      dartName: 'Comments',
      schema: 'public',
      module: 'sama3ni',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'comments_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artistId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'trackId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'comment',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'comments_fk_0',
          columns: ['artistId'],
          referenceTable: 'artists',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'comments_fk_1',
          columns: ['trackId'],
          referenceTable: 'tracks',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'comments_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'favoris',
      dartName: 'Favoris',
      schema: 'public',
      module: 'sama3ni',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'favoris_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artistId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'trackId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'favoris_fk_0',
          columns: ['artistId'],
          referenceTable: 'artists',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'favoris_fk_1',
          columns: ['trackId'],
          referenceTable: 'tracks',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'favoris_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'followers',
      dartName: 'Follower',
      schema: 'public',
      module: 'sama3ni',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'followers_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'followerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'followingId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'followers_fk_0',
          columns: ['followerId'],
          referenceTable: 'artists',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'followers_fk_1',
          columns: ['followingId'],
          referenceTable: 'artists',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'followers_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'tracks',
      dartName: 'Track',
      schema: 'public',
      module: 'sama3ni',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'tracks_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:TrackType',
        ),
        _i2.ColumnDefinition(
          name: 'bpm',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'key',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'protocol:Keys?',
        ),
        _i2.ColumnDefinition(
          name: 'playtime',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'tags',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'photoUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'audioUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'artistId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'genreId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'tracks_fk_0',
          columns: ['artistId'],
          referenceTable: 'artists',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'tracks_fk_1',
          columns: ['genreId'],
          referenceTable: 'categories',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'tracks_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.Artist) {
      return _i4.Artist.fromJson(data) as T;
    }
    if (t == _i5.Category) {
      return _i5.Category.fromJson(data) as T;
    }
    if (t == _i6.Keys) {
      return _i6.Keys.fromJson(data) as T;
    }
    if (t == _i7.TrackType) {
      return _i7.TrackType.fromJson(data) as T;
    }
    if (t == _i8.AppException) {
      return _i8.AppException.fromJson(data) as T;
    }
    if (t == _i9.ExceptionType) {
      return _i9.ExceptionType.fromJson(data) as T;
    }
    if (t == _i10.Favoris) {
      return _i10.Favoris.fromJson(data) as T;
    }
    if (t == _i11.Follower) {
      return _i11.Follower.fromJson(data) as T;
    }
    if (t == _i12.Comments) {
      return _i12.Comments.fromJson(data) as T;
    }
    if (t == _i13.Track) {
      return _i13.Track.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Artist?>()) {
      return (data != null ? _i4.Artist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Category?>()) {
      return (data != null ? _i5.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Keys?>()) {
      return (data != null ? _i6.Keys.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.TrackType?>()) {
      return (data != null ? _i7.TrackType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.AppException?>()) {
      return (data != null ? _i8.AppException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.ExceptionType?>()) {
      return (data != null ? _i9.ExceptionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Favoris?>()) {
      return (data != null ? _i10.Favoris.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Follower?>()) {
      return (data != null ? _i11.Follower.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Comments?>()) {
      return (data != null ? _i12.Comments.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Track?>()) {
      return (data != null ? _i13.Track.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i11.Follower>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i11.Follower>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i11.Follower>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i11.Follower>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i10.Favoris>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i10.Favoris>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i10.Favoris>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i10.Favoris>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i14.Artist>) {
      return (data as List).map((e) => deserialize<_i14.Artist>(e)).toList()
          as dynamic;
    }
    if (t == List<_i15.Category>) {
      return (data as List).map((e) => deserialize<_i15.Category>(e)).toList()
          as dynamic;
    }
    if (t == List<_i16.Comments>) {
      return (data as List).map((e) => deserialize<_i16.Comments>(e)).toList()
          as dynamic;
    }
    if (t == List<_i17.Favoris>) {
      return (data as List).map((e) => deserialize<_i17.Favoris>(e)).toList()
          as dynamic;
    }
    if (t == List<_i18.Follower>) {
      return (data as List).map((e) => deserialize<_i18.Follower>(e)).toList()
          as dynamic;
    }
    if (t == List<_i19.Track>) {
      return (data as List).map((e) => deserialize<_i19.Track>(e)).toList()
          as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.Artist) {
      return 'Artist';
    }
    if (data is _i5.Category) {
      return 'Category';
    }
    if (data is _i6.Keys) {
      return 'Keys';
    }
    if (data is _i7.TrackType) {
      return 'TrackType';
    }
    if (data is _i8.AppException) {
      return 'AppException';
    }
    if (data is _i9.ExceptionType) {
      return 'ExceptionType';
    }
    if (data is _i10.Favoris) {
      return 'Favoris';
    }
    if (data is _i11.Follower) {
      return 'Follower';
    }
    if (data is _i12.Comments) {
      return 'Comments';
    }
    if (data is _i13.Track) {
      return 'Track';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
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
      return deserialize<_i4.Artist>(data['data']);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i5.Category>(data['data']);
    }
    if (dataClassName == 'Keys') {
      return deserialize<_i6.Keys>(data['data']);
    }
    if (dataClassName == 'TrackType') {
      return deserialize<_i7.TrackType>(data['data']);
    }
    if (dataClassName == 'AppException') {
      return deserialize<_i8.AppException>(data['data']);
    }
    if (dataClassName == 'ExceptionType') {
      return deserialize<_i9.ExceptionType>(data['data']);
    }
    if (dataClassName == 'Favoris') {
      return deserialize<_i10.Favoris>(data['data']);
    }
    if (dataClassName == 'Follower') {
      return deserialize<_i11.Follower>(data['data']);
    }
    if (dataClassName == 'Comments') {
      return deserialize<_i12.Comments>(data['data']);
    }
    if (dataClassName == 'Track') {
      return deserialize<_i13.Track>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.Artist:
        return _i4.Artist.t;
      case _i5.Category:
        return _i5.Category.t;
      case _i10.Favoris:
        return _i10.Favoris.t;
      case _i11.Follower:
        return _i11.Follower.t;
      case _i12.Comments:
        return _i12.Comments.t;
      case _i13.Track:
        return _i13.Track.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'sama3ni';
}
