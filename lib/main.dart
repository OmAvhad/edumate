import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'providers/profile_provider.dart';
import 'screens/home.dart';
import 'screens/profile.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'utils/protected_route.dart';
import 'utils/jwt/verify_token.dart';
import 'utils/notifications/initialize_fcm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initFcm();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // check if there's a valid token stored
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('jwtToken');

  bool isValid = false;

  if (token != null) {
    isValid = await verifyToken(token);
  }

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ProfileProvider>(create: (context) {
      final profileProvider = ProfileProvider();
      profileProvider.loadProfile();
      return profileProvider;
    }),
  ], child: MyApp(isLoggedIn: isValid)));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edumate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 96, 189, 232)),
        useMaterial3: true,
      ),
      initialRoute: isLoggedIn ? '/home' : '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const MyHomePage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
