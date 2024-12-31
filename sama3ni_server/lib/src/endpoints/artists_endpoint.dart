import 'dart:typed_data';

import 'package:sama3ni_server/src/generated/protocol.dart';
import 'package:sama3ni_server/src/mixin/fileuploader.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class ArtistsEndpoint extends Endpoint with Fileuploader {
  Future<Artist> getLoggedArtist(Session session) async {
    if (!await session.isUserSignedIn) {
      throw AppException(
        message: "This endpoint requires authentication",
        errorType: ExceptionType.authenticationRequiredException,
      );
    }
    final AuthenticationInfo? authInfo = await session.authenticated;
    final artist = await Artist.db.findFirstRow(session,
        where: (x) => x.userInfoId.equals(authInfo!.userId),
        include: Artist.include(userInfo: UserInfo.include()));
    if (artist == null) {
      throw AppException(
        message: "Artist not found",
        errorType: ExceptionType.notFound,
      );
    }
    return artist;
  }

  Future<Artist> getArtistById(Session session, int id) async {
    final artist = await Artist.db.findById(session, id,
        include: Artist.include(userInfo: UserInfo.include()));
    if (artist == null) {
      throw AppException(
        message: "Artist not found",
        errorType: ExceptionType.notFound,
      );
    }
    return artist;
  }

  Future<List<Artist>> getArtists(Session session) async {
    if (await session.isUserSignedIn) {
      final authInfo = await session.authenticated;
      return await Artist.db.find(
        session,
        where: (p0) => p0.userInfo.id.notEquals(authInfo!.userId),
        include: Artist.include(userInfo: UserInfo.include()),
      );
    }
    return await Artist.db.find(
      session,
      include: Artist.include(
        userInfo: UserInfo.include(),
      ),
    );
  }

  Future<Artist> updateCoverPhoto(Session session, ByteData coverPhoto , fileName) async {
    final Uri? uri = await uploadByteData(session, coverPhoto , fileName);
    if (uri == null) {
      throw AppException(
        message: "Failed to upload cover photo",
        errorType: ExceptionType.forbidden,
      );
    }
    if (!await session.isUserSignedIn) {
      throw AppException(
        message: "This endpoint requires authentication",
        errorType: ExceptionType.authenticationRequiredException,
      );
    }
    final authinfo = await session.authenticated;
    final artist = await Artist.db.findFirstRow(session,
        where: (x) => x.userInfoId.equals(authinfo!.userId),
        include: Artist.include(userInfo: UserInfo.include()));
    if (artist == null) {
      throw AppException(
        message: "Artist not found",
        errorType: ExceptionType.notFound,
      );
    }
    artist.coverphoto = uri.toString();
    return Artist.db.updateRow(session, artist);
  }

  Future<Artist> updateLoggedArtist(
    Session session, {
    required String displayName,
    required String address,
    required String bio,
    required String ig,
    required String ytb,
    required String sc,
  }) async {
    if (!await session.isUserSignedIn) {
      throw AppException(
        message: "This endpoint requires authentication",
        errorType: ExceptionType.authenticationRequiredException,
      );
    }
    final authinfo = await session.authenticated;
    final artist = await Artist.db.findFirstRow(session,
        where: (x) => x.userInfoId.equals(authinfo!.userId),
        include: Artist.include(userInfo: UserInfo.include()));
    if (artist == null) {
      throw AppException(
        message: "Artist not found",
        errorType: ExceptionType.notFound,
      );
    }
    if (artist.displayName != displayName ||
        artist.userInfo!.userName != displayName) {
      artist.displayName = displayName;
      artist.userInfo!.userName = displayName;
      await UserInfo.db.updateRow(
        session,
        artist.userInfo!,
        columns: (p0) => [p0.userName],
      );
    }
    artist.address = address.isEmpty ? null : address;
    artist.bio = bio.isEmpty ? null : bio;
    artist.iglink = ig.isEmpty ? null : ig;
    artist.youtubelink = ytb.isEmpty ? null : ytb;
    artist.soundcloudlink = sc.isEmpty ? null : sc;
    return await Artist.db.updateRow(session, artist);
  }
}
