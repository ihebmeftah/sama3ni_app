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
import 'dart:typed_data' as _i4;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i5;

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
        'updateCoverPhoto': _i1.MethodConnector(
          name: 'updateCoverPhoto',
          params: {
            'coverPhoto': _i1.ParameterDescription(
              name: 'coverPhoto',
              type: _i1.getType<_i4.ByteData>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artists'] as _i2.ArtistsEndpoint).updateCoverPhoto(
            session,
            params['coverPhoto'],
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
        )
      },
    );
    modules['serverpod_auth'] = _i5.Endpoints()..initializeEndpoints(server);
  }
}
