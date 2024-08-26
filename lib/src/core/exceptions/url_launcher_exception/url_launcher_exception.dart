import 'package:freezed_annotation/freezed_annotation.dart';

part 'url_launcher_exception.freezed.dart';

@freezed
class UrlLauncherException with _$UrlLauncherException {
  const factory UrlLauncherException.invalidUrl() =
  _UrlLauncherExceptionInvalidUrl;
  const factory UrlLauncherException.unableToLaunch() =
  _UrlLauncherExceptionUnableToLaunch;
}