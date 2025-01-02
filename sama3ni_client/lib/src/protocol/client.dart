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
import 'package:sama3ni_client/src/protocol/tracks.dart' as _i6;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i7;
import 'protocol.dart' as _i8;

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

  _i2.Future<_i3.Artist> updateCoverPhoto(
    _i4.ByteData coverPhoto,
    dynamic fileName,
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

  _i2.Future<_i5.Category> getCategoryById(int id) =>
      caller.callServerEndpoint<_i5.Category>(
        'categories',
        'getCategoryById',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointTracks extends _i1.EndpointRef {
  EndpointTracks(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'tracks';

  /// Retrieves a list of tracks by a specific artist.
  ///
  /// If [artistId] is provided, it fetches tracks associated with the given artist ID.
  /// If [artistId] is not provided, it retrieves tracks for the currently logged-in artist.
  ///
  /// [session] is the current session used for database operations and authentication.
  ///
  /// Returns a [Future] containing a list of [Track] objects associated with the artist.
  _i2.Future<List<_i6.Track>> getTracksByArtist([int? artistId]) =>
      caller.callServerEndpoint<List<_i6.Track>>(
        'tracks',
        'getTracksByArtist',
        {'artistId': artistId},
      );

  _i2.Future<List<_i6.Track>> getTracksByCategory(int categoryId) =>
      caller.callServerEndpoint<List<_i6.Track>>(
        'tracks',
        'getTracksByCategory',
        {'categoryId': categoryId},
      );

  _i2.Future<_i6.Track> createTrack(_i6.Track track) =>
      caller.callServerEndpoint<_i6.Track>(
        'tracks',
        'createTrack',
        {'track': track},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i7.Caller(client);
  }

  late final _i7.Caller auth;
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
          _i8.Protocol(),
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
    tracks = EndpointTracks(this);
    modules = Modules(this);
  }

  late final EndpointArtists artists;

  late final EndpointCategories categories;

  late final EndpointTracks tracks;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'artists': artists,
        'categories': categories,
        'tracks': tracks,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
