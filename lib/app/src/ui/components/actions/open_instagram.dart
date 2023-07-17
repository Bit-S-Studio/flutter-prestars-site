import 'package:url_launcher/url_launcher.dart';

class OpenInstagram {
  static void call() async {
    String instagramUrl;
    String fallbackUrl;
    instagramUrl =
        'https://www.instagram.com/prestars_/?igshid=MzRlODBiNWFlZA%3D%3D';
    fallbackUrl =
        'https://www.instagram.com/prestars_/?igshid=MzRlODBiNWFlZA%3D%3D';
    Uri instagramUri = Uri.parse(instagramUrl);
    Uri fallbackUri = Uri.parse(fallbackUrl);
    try {
      bool launched =
          await launchUrl(instagramUri, mode: LaunchMode.platformDefault);
      if (!launched) {
        await launchUrl(fallbackUri);
      }
    } catch (e) {
      await launchUrl(fallbackUri);
    }
  }
}
