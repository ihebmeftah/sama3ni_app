import 'package:sama3ni_server/src/endpoints/artists_endpoint.dart';
import 'package:sama3ni_server/src/endpoints/categories_enpoint.dart';
import 'package:sama3ni_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

import '../mixin/fileuploader.dart';

class TracksEndpoint extends Endpoint with Fileuploader {
  /// Retrieves a list of tracks by a specific artist.
  ///
  /// If [artistId] is provided, it fetches tracks associated with the given artist ID.
  /// If [artistId] is not provided, it retrieves tracks for the currently logged-in artist.
  ///
  /// [session] is the current session used for database operations and authentication.
  ///
  /// Returns a [Future] containing a list of [Track] objects associated with the artist.

  Future<List<Track>> getTracksByArtist(Session session,
      [int? artistId]) async {
    if (artistId == null) {
      final artist = await ArtistsEndpoint().getLoggedArtist(session);
      return await Track.db.find(session,
          include: Track.include(genre: Category.include()),
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
