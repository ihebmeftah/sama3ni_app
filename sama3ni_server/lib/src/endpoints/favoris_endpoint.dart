import 'package:sama3ni_server/src/endpoints/artists_endpoint.dart';
import 'package:sama3ni_server/src/endpoints/tracks_endpoint.dart';
import 'package:sama3ni_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class FavorisEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Favoris>> getFavoris(Session session) async {
    final Artist loggedArtist =
        await ArtistsEndpoint().getLoggedArtist(session);
    return await Favoris.db.find(session,
        include: Favoris.include(
            track: Track.include(
                artist: Artist.include(), genre: Category.include())),
        where: (e) => e.artistId.equals(loggedArtist.id));
  }

  Future<Favoris> addFav(Session session, int trackId) async {
    final Artist loggedArtist =
        await ArtistsEndpoint().getLoggedArtist(session);
    final track = await TracksEndpoint().getTrackById(session, trackId);
    final favoris =
        Favoris(artistId: loggedArtist.id!, trackId: track.id ?? trackId);
    return await Favoris.db.insertRow(session, favoris);
  }

  Future<Favoris> removeFavByTrackId(Session session, int trackId) async {
    final fav = await Favoris.db.findFirstRow(session, where: (e) {
      return e.trackId.equals(trackId);
    });
    if (fav == null) {
      throw AppException(
        message: 'Favoris not found',
        errorType: ExceptionType.notFound,
      );
    }
    return await Favoris.db.deleteRow(session, fav);
  }

  Future<Favoris> removeFav(Session session, Favoris fav) async {
    return await Favoris.db.deleteRow(session, fav);
  }
}
