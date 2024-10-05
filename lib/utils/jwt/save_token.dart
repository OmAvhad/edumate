import 'package:shared_preferences/shared_preferences.dart';

void storeToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('jwtToken', token);
}
