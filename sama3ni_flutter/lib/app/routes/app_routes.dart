// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const AUTHENTIFICATION = _Paths.AUTHENTIFICATION;
  static const ARTISTS = _Paths.ARTISTS;
  static const CATEGORIES = _Paths.CATEGORIES;
  static const PROFILE = _Paths.PROFILE;
  static const REGISTER = _Paths.AUTHENTIFICATION + _Paths.REGISTER;
  static const LOGIN = _Paths.AUTHENTIFICATION + _Paths.LOGIN;
  static const VERIFCATION = REGISTER + _Paths.VERIFCATION;
  static const UPLOAD = _Paths.UPLOAD;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const AUTHENTIFICATION = '/authentification';
  static const ARTISTS = '/artists';
  static const CATEGORIES = '/categories';
  static const PROFILE = '/profile';
  static const REGISTER = '/register';
  static const LOGIN = '/login';
  static const VERIFCATION = '/verifcation';
  static const UPLOAD = '/upload';
}
