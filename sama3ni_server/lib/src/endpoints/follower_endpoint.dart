import 'package:sama3ni_server/src/endpoints/artists_endpoint.dart';
import 'package:sama3ni_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class FollowerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
  Future<List<Follower>> getFollowers(Session session, [int? artistId]) async {
    if (artistId != null) {
      final artist = await ArtistsEndpoint().getArtistById(session, artistId);
      return await Follower.db
          .find(session, where: (x) => x.followerId.equals(artist.id!));
    }
    final artist = await ArtistsEndpoint().getLoggedArtist(session);
    return await Follower.db
        .find(session, where: (x) => x.followerId.equals(artist.id!));
  }

  Future<Follower> followArtist(Session session, int artistId) async {
    final followerArtist = await ArtistsEndpoint().getLoggedArtist(session);
    final followingArtist =
        await ArtistsEndpoint().getArtistById(session, artistId);
    final Follower follower = Follower(
      follower: followerArtist,
      followerId: followerArtist.id!,
      following: followingArtist,
      followingId: followingArtist.id!,
    );
    return await Follower.db.insertRow(session, follower);
  }

  Future<Follower> unfollowArtist(Session session, Follower follower) async {
    final f = await Follower.db.findById(session, follower.id!);
    if (f == null) {
      throw AppException(
          message: "follower not found", errorType: ExceptionType.notFound);
    }
    return await Follower.db.deleteRow(session, follower);
  }

  Future<List<Follower>> unfollowArtistByArtistId(
      Session session, int artistId) async {
    final f = await Follower.db
        .findFirstRow(session, where: (ww) => ww.followingId.equals(artistId));
    if (f == null) {
      throw AppException(
          message: "follower not found", errorType: ExceptionType.notFound);
    }
    return await Follower.db
        .deleteWhere(session, where: (ww) => ww.followingId.equals(artistId));
  }
}
