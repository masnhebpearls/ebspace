import 'package:app_links/app_links.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../config/env_vars/env_vars.dart';
import '../../domain/repo/log_in_repo.dart';
import '../token_network/zoho_dio.dart';

class LogInRepoImpl extends LogInRepo {
  final AppLinks _appLinks = AppLinks();

  @override
  Future<void> launchZohoLogin() async {
    final Uri uri = Uri.parse(
      'https://accounts.zoho.com/oauth/v2/auth'
          '?scope=ZohoWriter.documentEditor.ALL'
          '&client_id=${EnvVars.zohoClientId}'
          '&response_type=code&access_type=offline'
          '&redirect_uri=${Uri.encodeComponent(EnvVars.redirectUrl)}',
    );

    // Launch the OAuth URL
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $uri';
    }

    // Listen for the redirect
    _appLinks.uriLinkStream.listen((Uri? uri) async {
      if (uri != null && uri.toString().startsWith(EnvVars.redirectUrl)) {
        // Extract the authorization code from the redirect URL
        final code = uri.queryParameters['code'];
        print(code);

        if (code != null) {
          print('Authorization code: $code');
          final Dio zohoDio = ZohoDio().zohoDio;

          final response = await zohoDio.post(
            'https://accounts.zoho.com/oauth/v2/token?code=$code&grant_type=authorization_code&client_id=1000.60088PO4H8F74YSBCOZ23TTHNPSHYA&client_secret=abef20ea9f4d256078384472d034ec20a132f3d5ef&redirect_uri=com.example.ebspace://oauth2redirect',
          );

          print('Response: $response');
        }
      }
    }, onError: (err) {
      // Handle error, such as not receiving a valid redirect
      print('Error: $err');
    });
  }

  void dispose() {
    // No specific cleanup is needed, but you can unsubscribe if you wish
  }
}
