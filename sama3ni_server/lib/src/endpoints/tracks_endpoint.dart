import 'dart:typed_data';

import 'package:sama3ni_server/src/endpoints/artists_endpoint.dart';
import 'package:sama3ni_server/src/endpoints/categories_enpoint.dart';
import 'package:sama3ni_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

import '../mixin/fileuploader.dart';

class TracksEndpoint extends Endpoint with Fileuploader {
  Future<List<Track>> getMyTracks(Session session) async {
    final artist = await ArtistsEndpoint().getLoggedArtist(session);
    final tracks = await Track.db
        .find(session, where: (x) => x.artistId.equals(artist.id!));
    return tracks;
  }

  Future<List<Track>> getTracksByArtist(Session session, int artistId) async {
    final tracks =
        await Track.db.find(session, where: (x) => x.artistId.equals(artistId));
    return tracks;
  }

  Future<List<Track>> getTracksByCategory(
      Session session, int categoryId) async {
    await CategoriesEndpoint().getCategoryById(session, categoryId);
    final tracks = await Track.db
        .find(session, where: (x) => x.genreId.equals(categoryId));
    return tracks;
  }

  Future<Track> createTrack(
      Session session, Track track, ByteData trackFile) async {
    final artist = await ArtistsEndpoint().getLoggedArtist(session);
    track.artistId = artist.id!;
    final url = await uploadByteData(session, trackFile, track.audio);
    if (url == null) {
      throw AppException(
        message: 'Failed to upload track file',
        errorType: ExceptionType.internalServerError,
      );
    }
    track.audio = url.toString();
    final newTrack = await Track.db.insertRow(session, track);
    return newTrack;
  }
}
