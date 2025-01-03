import 'package:sama3ni_server/src/endpoints/artists_endpoint.dart';
import 'package:sama3ni_server/src/endpoints/categories_enpoint.dart';
import 'package:sama3ni_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

import '../mixin/fileuploader.dart';

class TracksEndpoint extends Endpoint with Fileuploader {
  Future<List<Track>> getTopsTracks(Session session) async {
    return await Track.db.find(
      session,
      include: Track.include(
        artist: Artist.include(),
        genre: Category.include(),
      ),
      orderBy: (p) => p.playtime,
      orderDescending: true,
    );
  }

  Future<List<Track>> getTracksByArtist(Session session,
      [int? artistId]) async {
    if (artistId == null) {
      final artist = await ArtistsEndpoint().getLoggedArtist(session);
      return await Track.db.find(session,
          include: Track.include(
              artist: Artist.include(), genre: Category.include()),
          where: (x) => x.artistId.equals(artist.id!));
    }
    return await Track.db.find(session,
        include: Track.include(genre: Category.include()),
        where: (x) => x.artistId.equals(artistId));
  }

  Future<List<Track>> getTracksByCategory(
      Session session, int categoryId) async {
    await CategoriesEndpoint().getCategoryById(session, categoryId);
    final tracks = await Track.db
        .find(session, where: (x) => x.genreId.equals(categoryId));
    return tracks;
  }

  Future<Track> createTrack(Session session, Track track) async {
    final artist = await ArtistsEndpoint().getLoggedArtist(session);
    track.artistId = artist.id!;
    final audioUrl =
        await uploadByteData(session, track.audioByte!, track.title);
    if (audioUrl == null) {
      throw AppException(
        message: 'Failed to upload track file',
        errorType: ExceptionType.internalServerError,
      );
    }
    track.audioUrl = audioUrl.toString();
    if (track.photoByte != null) {
      final photoUrl =
          await uploadByteData(session, track.photoByte!, track.title);
      if (photoUrl == null) {
        throw AppException(
          message: 'Failed to upload photo file',
          errorType: ExceptionType.internalServerError,
        );
      }
      track.photoUrl = photoUrl.toString();
    }
    final newTrack = await Track.db.insertRow(session, track);
    return newTrack;
  }
}
