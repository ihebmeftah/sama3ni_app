import 'package:sama3ni_server/src/endpoints/artists_endpoint.dart';
import 'package:sama3ni_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class FollowerEndpoint extends Endpoint {
  Future<List<Follower>> getFollowing(Session session, int artistId) async {
    final artist = await ArtistsEndpoint().getArtistById(session, artistId);
    return await Follower.db.find(session,
        include: Follower.include(
            following: Artist.include(userInfo: UserInfo.include()),
            follower: Artist.include(userInfo: UserInfo.include())),
        where: (x) => x.followingId.equals(artist.id!));
  }

  Future<List<Follower>> getFollowers(Session session, int artistId) async {
    final artist = await ArtistsEndpoint().getArtistById(session, artistId);
    return await Follower.db.find(session,
        include: Follower.include(
            following: Artist.include(userInfo: UserInfo.include()),
            follower: Artist.include(userInfo: UserInfo.include())),
        where: (x) => x.followerId.equals(artist.id!));
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
    await ArtistsEndpoint().getLoggedArtist(session);
    final f = await Follower.db.findById(session, follower.id!);
    if (f == null) {
      throw AppException(
          message: "follower not found", errorType: ExceptionType.notFound);
    }
    return await Follower.db.deleteRow(session, follower);
  }
}
