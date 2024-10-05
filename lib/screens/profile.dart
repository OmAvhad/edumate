import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import '../utils/jwt/destroy_token.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context).profile;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: CircleAvatar(
                          radius: 50,
                          child: Icon(
                            Icons.person,
                            size: 50,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: profile == null
                            ? const Text('John Doe',
                                style: TextStyle(fontSize: 20))
                            : Text(profile.name,
                                style: const TextStyle(fontSize: 20))),
                    Expanded(
                        child: ListView(
                      children: [
                        const ListTile(
                          leading: Icon(
                            Icons.person,
                            size: 30,
                          ),
                          title: Text('Profile'),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.settings,
                            size: 30,
                          ),
                          title: Text('Settings'),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.help_outline,
                            size: 30,
                          ),
                          title: const Text('Help & Support'),
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.logout,
                            size: 30,
                          ),
                          title: const Text('Logout'),
                          onTap: () {
                            _logout();
                          },
                        ),
                      ],
                    )),
                  ],
                ))));
  }

  void _logout() {
    destroyToken();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
