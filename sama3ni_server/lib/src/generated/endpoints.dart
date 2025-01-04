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
import '../endpoints/artists_endpoint.dart' as _i2;
import '../endpoints/categories_enpoint.dart' as _i3;
import '../endpoints/follower_endpoint.dart' as _i4;
import '../endpoints/tracks_endpoint.dart' as _i5;
import 'dart:typed_data' as _i6;
import 'package:sama3ni_server/src/generated/follower.dart' as _i7;
import 'package:sama3ni_server/src/generated/tracks.dart' as _i8;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i9;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'artists': _i2.ArtistsEndpoint()
        ..initialize(
          server,
          'artists',
          null,
        ),
      'categories': _i3.CategoriesEndpoint()
        ..initialize(
          server,
          'categories',
          null,
        ),
      'follower': _i4.FollowerEndpoint()
        ..initialize(
          server,
          'follower',
          null,
        ),
      'tracks': _i5.TracksEndpoint()
        ..initialize(
          server,
          'tracks',
          null,
        ),
    };
    connectors['artists'] = _i1.EndpointConnector(
      name: 'artists',
      endpoint: endpoints['artists']!,
      methodConnectors: {
        'getLoggedArtist': _i1.MethodConnector(
          name: 'getLoggedArtist',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artists'] as _i2.ArtistsEndpoint)
                  .getLoggedArtist(session),
        ),
        'getArtistById': _i1.MethodConnector(
          name: 'getArtistById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artists'] as _i2.ArtistsEndpoint).getArtistById(
            session,
            params['id'],
          ),
        ),
        'getArtists': _i1.MethodConnector(
          name: 'getArtists',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artists'] as _i2.ArtistsEndpoint).getArtists(session),
        ),
        'getTopArtists': _i1.MethodConnector(
          name: 'getTopArtists',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artists'] as _i2.ArtistsEndpoint)
                  .getTopArtists(session),
        ),
        'updateCoverPhoto': _i1.MethodConnector(
          name: 'updateCoverPhoto',
          params: {
            'coverPhoto': _i1.ParameterDescription(
              name: 'coverPhoto',
              type: _i1.getType<_i6.ByteData>(),
              nullable: false,
            ),
            'fileName': _i1.ParameterDescription(
              name: 'fileName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artists'] as _i2.ArtistsEndpoint).updateCoverPhoto(
            session,
            params['coverPhoto'],
            params['fileName'],
          ),
        ),
        'updateLoggedArtist': _i1.MethodConnector(
          name: 'updateLoggedArtist',
          params: {
            'displayName': _i1.ParameterDescription(
              name: 'displayName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'address': _i1.ParameterDescription(
              name: 'address',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'bio': _i1.ParameterDescription(
              name: 'bio',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'ig': _i1.ParameterDescription(
              name: 'ig',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'ytb': _i1.ParameterDescription(
              name: 'ytb',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'sc': _i1.ParameterDescription(
              name: 'sc',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artists'] as _i2.ArtistsEndpoint).updateLoggedArtist(
            session,
            displayName: params['displayName'],
            address: params['address'],
            bio: params['bio'],
            ig: params['ig'],
            ytb: params['ytb'],
            sc: params['sc'],
          ),
        ),
      },
    );
    connectors['categories'] = _i1.EndpointConnector(
      name: 'categories',
      endpoint: endpoints['categories']!,
      methodConnectors: {
        'getCategories': _i1.MethodConnector(
          name: 'getCategories',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['categories'] as _i3.CategoriesEndpoint)
                  .getCategories(session),
        ),
        'getTopCategories': _i1.MethodConnector(
          name: 'getTopCategories',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['categories'] as _i3.CategoriesEndpoint)
                  .getTopCategories(session),
        ),
        'getCategoryById': _i1.MethodConnector(
          name: 'getCategoryById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['categories'] as _i3.CategoriesEndpoint)
                  .getCategoryById(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['follower'] = _i1.EndpointConnector(
      name: 'follower',
      endpoint: endpoints['follower']!,
      methodConnectors: {
        'getFollowing': _i1.MethodConnector(
          name: 'getFollowing',
          params: {
            'artistId': _i1.ParameterDescription(
              name: 'artistId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['follower'] as _i4.FollowerEndpoint).getFollowing(
            session,
            params['artistId'],
          ),
        ),
        'getFollowers': _i1.MethodConnector(
          name: 'getFollowers',
          params: {
            'artistId': _i1.ParameterDescription(
              name: 'artistId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['follower'] as _i4.FollowerEndpoint).getFollowers(
            session,
            params['artistId'],
          ),
        ),
        'followArtist': _i1.MethodConnector(
          name: 'followArtist',
          params: {
            'artistId': _i1.ParameterDescription(
              name: 'artistId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['follower'] as _i4.FollowerEndpoint).followArtist(
            session,
            params['artistId'],
          ),
        ),
        'unfollowArtist': _i1.MethodConnector(
          name: 'unfollowArtist',
          params: {
            'follower': _i1.ParameterDescription(
              name: 'follower',
              type: _i1.getType<_i7.Follower>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['follower'] as _i4.FollowerEndpoint).unfollowArtist(
            session,
            params['follower'],
          ),
        ),
      },
    );
    connectors['tracks'] = _i1.EndpointConnector(
      name: 'tracks',
      endpoint: endpoints['tracks']!,
      methodConnectors: {
        'getTrack': _i1.MethodConnector(
          name: 'getTrack',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tracks'] as _i5.TracksEndpoint).getTrack(session),
        ),
        'getTopsTracks': _i1.MethodConnector(
          name: 'getTopsTracks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tracks'] as _i5.TracksEndpoint)
                  .getTopsTracks(session),
        ),
        'getTracksByArtist': _i1.MethodConnector(
          name: 'getTracksByArtist',
          params: {
            'artistId': _i1.ParameterDescription(
              name: 'artistId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tracks'] as _i5.TracksEndpoint).getTracksByArtist(
            session,
            params['artistId'],
          ),
        ),
        'getTracksByCategory': _i1.MethodConnector(
          name: 'getTracksByCategory',
          params: {
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tracks'] as _i5.TracksEndpoint).getTracksByCategory(
            session,
            params['categoryId'],
          ),
        ),
        'createTrack': _i1.MethodConnector(
          name: 'createTrack',
          params: {
            'track': _i1.ParameterDescription(
              name: 'track',
              type: _i1.getType<_i8.Track>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tracks'] as _i5.TracksEndpoint).createTrack(
            session,
            params['track'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i9.Endpoints()..initializeEndpoints(server);
  }
}
