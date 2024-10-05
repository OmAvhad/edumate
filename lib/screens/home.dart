import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Hello John 👋",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    iconSize: 30,
                    onPressed: () {
                      // Handle notification icon press
                    },
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 20, start: 20, end: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Recent Notifications',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // pull the ExpandableListView
                                  Navigator.pushNamed(context, '/profile');
                                },
                                child: const Text(
                                  'View all',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: ListView(
                          children: const [
                            ListTile(
                              title: Text('Holiday on 15th Oct'),
                              subtitle: Text(
                                  'School will remain close on 15th Oct on the occasion of Eid-e-Milad'),
                              trailing: Text(
                                '10th\nOct',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            ListTile(
                              title: Text('Holiday on 10th Oct'),
                              subtitle: Text(
                                  'School will remain close on 10th Oct on the occasion of Dussehra'),
                              trailing: Text(
                                '9th\nOct',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            ListTile(
                              title: Text('PTM on 5th Oct'),
                              subtitle: Text(
                                  'Parent-Teacher Meeting will be held on 5th Oct from 9:00 AM to 12:00 PM'),
                              trailing: Text(
                                '4th\nOct',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            ListTile(
                              title: Text('Holiday on 2nd Oct'),
                              subtitle: Text(
                                  'School will remain close on 2nd Oct on the occasion of Gandhi Jayanti'),
                              trailing: Text(
                                '1st\nOct',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        )),
                      ],
                    )))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (int index) {
          if (index == selectedIndex) return;

          setState(() {
            selectedIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/profile');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}
