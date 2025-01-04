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
import 'dart:async' as _i2;
import 'package:sama3ni_client/src/protocol/artists.dart' as _i3;
import 'dart:typed_data' as _i4;
import 'package:sama3ni_client/src/protocol/categories.dart' as _i5;
import 'package:sama3ni_client/src/protocol/follower.dart' as _i6;
import 'package:sama3ni_client/src/protocol/tracks.dart' as _i7;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i8;
import 'protocol.dart' as _i9;

/// {@category Endpoint}
class EndpointArtists extends _i1.EndpointRef {
  EndpointArtists(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'artists';

  _i2.Future<_i3.Artist> getLoggedArtist() =>
      caller.callServerEndpoint<_i3.Artist>(
        'artists',
        'getLoggedArtist',
        {},
      );

  _i2.Future<_i3.Artist> getArtistById(int id) =>
      caller.callServerEndpoint<_i3.Artist>(
        'artists',
        'getArtistById',
        {'id': id},
      );

  _i2.Future<List<_i3.Artist>> getArtists() =>
      caller.callServerEndpoint<List<_i3.Artist>>(
        'artists',
        'getArtists',
        {},
      );

  /// Get the top 10 artists (based on the number of followers) in
  /// descending order.
  _i2.Future<List<_i3.Artist>> getTopArtists() =>
      caller.callServerEndpoint<List<_i3.Artist>>(
        'artists',
        'getTopArtists',
        {},
      );

  _i2.Future<_i3.Artist> updateCoverPhoto(
    _i4.ByteData coverPhoto,
    String fileName,
  ) =>
      caller.callServerEndpoint<_i3.Artist>(
        'artists',
        'updateCoverPhoto',
        {
          'coverPhoto': coverPhoto,
          'fileName': fileName,
        },
      );

  _i2.Future<_i3.Artist> updateLoggedArtist({
    required String displayName,
    required String address,
    required String bio,
    required String ig,
    required String ytb,
    required String sc,
  }) =>
      caller.callServerEndpoint<_i3.Artist>(
        'artists',
        'updateLoggedArtist',
        {
          'displayName': displayName,
          'address': address,
          'bio': bio,
          'ig': ig,
          'ytb': ytb,
          'sc': sc,
        },
      );
}

/// {@category Endpoint}
class EndpointCategories extends _i1.EndpointRef {
  EndpointCategories(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'categories';

  _i2.Future<List<_i5.Category>> getCategories() =>
      caller.callServerEndpoint<List<_i5.Category>>(
        'categories',
        'getCategories',
        {},
      );

  /// Get the top 5 categories, sorted by their name in ascending order.
  _i2.Future<List<_i5.Category>> getTopCategories() =>
      caller.callServerEndpoint<List<_i5.Category>>(
        'categories',
        'getTopCategories',
        {},
      );

  _i2.Future<_i5.Category> getCategoryById(int id) =>
      caller.callServerEndpoint<_i5.Category>(
        'categories',
        'getCategoryById',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointFollower extends _i1.EndpointRef {
  EndpointFollower(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'follower';

  _i2.Future<List<_i6.Follower>> getFollowing([int? artistId]) =>
      caller.callServerEndpoint<List<_i6.Follower>>(
        'follower',
        'getFollowing',
        {'artistId': artistId},
      );

  _i2.Future<List<_i6.Follower>> getFollowers([int? artistId]) =>
      caller.callServerEndpoint<List<_i6.Follower>>(
        'follower',
        'getFollowers',
        {'artistId': artistId},
      );

  _i2.Future<_i6.Follower> followArtist(int artistId) =>
      caller.callServerEndpoint<_i6.Follower>(
        'follower',
        'followArtist',
        {'artistId': artistId},
      );

  _i2.Future<_i6.Follower> unfollowArtist(_i6.Follower follower) =>
      caller.callServerEndpoint<_i6.Follower>(
        'follower',
        'unfollowArtist',
        {'follower': follower},
      );

  _i2.Future<List<_i6.Follower>> unfollowArtistByArtistId(int artistId) =>
      caller.callServerEndpoint<List<_i6.Follower>>(
        'follower',
        'unfollowArtistByArtistId',
        {'artistId': artistId},
      );
}

/// {@category Endpoint}
class EndpointTracks extends _i1.EndpointRef {
  EndpointTracks(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'tracks';

  _i2.Future<List<_i7.Track>> getTopsTracks() =>
      caller.callServerEndpoint<List<_i7.Track>>(
        'tracks',
        'getTopsTracks',
        {},
      );

  _i2.Future<List<_i7.Track>> getTracksByArtist([int? artistId]) =>
      caller.callServerEndpoint<List<_i7.Track>>(
        'tracks',
        'getTracksByArtist',
        {'artistId': artistId},
      );

  _i2.Future<List<_i7.Track>> getTracksByCategory(int categoryId) =>
      caller.callServerEndpoint<List<_i7.Track>>(
        'tracks',
        'getTracksByCategory',
        {'categoryId': categoryId},
      );

  _i2.Future<_i7.Track> createTrack(_i7.Track track) =>
      caller.callServerEndpoint<_i7.Track>(
        'tracks',
        'createTrack',
        {'track': track},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i8.Caller(client);
  }

  late final _i8.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i9.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    artists = EndpointArtists(this);
    categories = EndpointCategories(this);
    follower = EndpointFollower(this);
    tracks = EndpointTracks(this);
    modules = Modules(this);
  }

  late final EndpointArtists artists;

  late final EndpointCategories categories;

  late final EndpointFollower follower;

  late final EndpointTracks tracks;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'artists': artists,
        'categories': categories,
        'follower': follower,
        'tracks': tracks,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
