import 'package:shared_preferences/shared_preferences.dart';

void destroyToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('jwtToken');
}