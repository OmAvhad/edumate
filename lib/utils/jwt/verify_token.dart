import 'package:jwt_decode/jwt_decode.dart'; // You can use this package for parsing JWT

Future<bool> verifyToken(String token) async {
  try {
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    DateTime expiryDate = DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);

    if (expiryDate.isAfter(DateTime.now())) {
      return true; // Token is still valid
    }
  } catch (e) {
    // Token is invalid or expired
  }

  return false;
}
