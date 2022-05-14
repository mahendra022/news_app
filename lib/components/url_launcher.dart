import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) async {
  final Uri _url = Uri.parse(url);
  await launchUrl(_url);
}
