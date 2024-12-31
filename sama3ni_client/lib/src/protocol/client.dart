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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
import 'protocol.dart' as _i7;

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

  _i2.Future<_i3.Artist> updateCoverPhoto(_i4.ByteData coverPhoto) =>
      caller.callServerEndpoint<_i3.Artist>(
        'artists',
        'updateCoverPhoto',
        {'coverPhoto': coverPhoto},
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
}

class Modules {
  Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
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
          _i7.Protocol(),
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
    modules = Modules(this);
  }

  late final EndpointArtists artists;

  late final EndpointCategories categories;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'artists': artists,
        'categories': categories,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
