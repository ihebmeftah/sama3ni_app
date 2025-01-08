import 'package:sama3ni_server/src/endpoints/tracks_endpoint.dart';
import 'package:sama3ni_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

import 'artists_endpoint.dart';

class CommetsEndpoint extends Endpoint {
  Future<List<Comments>> getCommetsByTrack(Session session, int trackId) async {
    TracksEndpoint().getTrackById(session, trackId);
    final comments = await Comments.db.find(
      session,
      where: (p0) => p0.trackId.equals(trackId),
      orderBy: (p) => p.createdAt,
      orderDescending: true,
      include: Comments.include(
        artist: Artist.include(userInfo: UserInfo.include()),
      ),
    );
    return comments;
  }

  Future<Comments> addComment(
      Session session, int trackId, String comment) async {
    final artist = await ArtistsEndpoint().getLoggedArtist(session);
    final track = await TracksEndpoint().getTrackById(session, trackId);
    final newComment = Comments(
      artistId: artist.id!,
      artist: artist,
      trackId: track.id!,
      comment: comment,
    );
    return await Comments.db.insertRow(session, newComment);
  }

  Future<Comments> removeComment(Session session, Comments c) async {
    final comment = await getCommentById(session, c.id!);
    return Comments.db.deleteRow(session, comment);
  }

  Future<Comments> getCommentById(Session session, int commentId) async {
    final comment = await Comments.db.findById(session, commentId);
    if (comment == null) {
      throw AppException(
          message: "Comment not found", errorType: ExceptionType.notFound);
    }
    return comment;
  }
}
