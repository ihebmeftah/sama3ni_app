import 'package:sama3ni_server/src/endpoints/artists_endpoint.dart';
import 'package:sama3ni_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class FollowerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
  Future<List<Follower>> getFollowing(Session session, [int? artistId]) async {
    if (artistId != null) {
      final artist = await ArtistsEndpoint().getArtistById(session, artistId);
      return await Follower.db.find(session,
          include: Follower.include(
            following: Artist.include(
              userInfo: UserInfo.include(),
            ),
          ),
          where: (ww) => ww.followerId.equals(artist.id));
    } else {
      final artist = await ArtistsEndpoint().getLoggedArtist(session);
      return await Follower.db.find(session,
          include: Follower.include(following: Artist.include()),
          where: (ww) => ww.followerId.equals(artist.id));
    }
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
    final f = await Follower.db.findFirstRow(session,
        where: (ww) => ww.followingId.equals(follower.id));
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
