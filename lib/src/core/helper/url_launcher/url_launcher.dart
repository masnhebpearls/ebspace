import 'package:url_launcher/url_launcher.dart';

import '../../exceptions/url_launcher_exception/url_launcher_exception.dart';


abstract class UrlLauncher {
  static Future<void> launchUri({required Uri uri}) async {
    final canLunchUrl = await launchUrl(uri);
    
    if (!canLunchUrl) {
      throw const UrlLauncherException.unableToLaunch();
    }
  }
}





