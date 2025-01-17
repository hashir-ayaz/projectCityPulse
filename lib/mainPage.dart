// ignore: file_names
import 'package:city_pulse/home.dart';
import 'package:flutter/material.dart';
import 'package:city_pulse/favorites.dart';
import 'package:city_pulse/settings.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  bool isGalleryView = true; // Whether to show the gallery view
  late bool isMessageSent = true; // testing

  final List<Widget> _pages = [
    const Home(),
    const Favorites(),
    const Settings(),
  ];

  final List<String> _appBarTitles = [
    "Home Page",
    "Favorites",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight + 30),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(145, 60, 240, 1),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: AppBar(
                title: Text(
                  _appBarTitles[_selectedIndex],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  if (_selectedIndex == 0)
                    IconButton(
                      icon: Image.asset(
                        isGalleryView
                            ? 'assets/listView.png'
                            : //gallaryviewicon
                            'assets/galleryView.png',
                            //'assets/galleryView.png',
                        scale: 0.7,
                      ),
                      onPressed: () {
                        setState(() {
                          isGalleryView = !isGalleryView;
                          isMessageSent = !isMessageSent;
                        });
                      },
                    ),
                ],
              ),
            ),
          ),
          body: _pages[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: const Color.fromRGBO(145, 60, 240, 1),
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/navigationbar/home.png',
                  scale: 0.8,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/navigationbar/notifications.png',
                  scale: 0.8,
                ),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/navigationbar/settings.png',
                  scale: 0.8,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      }),
      debugShowCheckedModeBanner: false,
    );
  }
}
