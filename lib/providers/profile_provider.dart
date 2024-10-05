import 'package:flutter/material.dart';
import '../utils/jwt/get_token.dart';
import '../models/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../api/api.dart';

class ProfileProvider with ChangeNotifier {
  Profile? _profile;

  Profile? get profile => _profile;

  Future<void> loadProfile() async {
    if (_profile != null) {
      return;
    }

    // String token = await getToken();
    // var headers = {'Authorization': 'Bearer $token'};
    // var response =
    //     await http.get(Uri.parse('$apiUrl/user/profile'), headers: headers);

    // if (response.statusCode == 200) {
    //   _profile = Profile.fromJson(json.decode(response.body));

    //   notifyListeners();
    // } else {
    //   throw Exception('Failed to load profile');
    // }
  }
}
