import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Widgets/home_page_body.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/views/settings.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key, required this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;

  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  int positionOfPage = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return AdaptiveTheme(
          light: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorSchemeSeed: Colors.blue,
          ),
          dark: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: const Color(primaryColor),
          ),
          builder: (theme, darkTheme) => MaterialApp(
            theme: theme,
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              key: _scaffoldKey,
              drawer: Drawer(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: Colors.teal,
                  child: ListView(
                    children: [
                      const DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.teal,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Movies",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Enjoy with us",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.home, color: Colors.white),
                        title: const Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          setState(() {
                            positionOfPage = 0;
                          });
                          _scaffoldKey.currentState?.closeDrawer();
                        },
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.favorite, color: Colors.white),
                        title: const Text(
                          "Favorite",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          setState(() {
                            positionOfPage = 1;
                          });
                          _scaffoldKey.currentState?.closeDrawer();
                        },
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.settings, color: Colors.white),
                        title: const Text(
                          "Settings",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          setState(() {
                            positionOfPage = 2;
                          });
                          _scaffoldKey.currentState?.closeDrawer();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // backgroundColor: const Color(primaryColor),
              body: _getSelectedPage(),
            ),
          ),
          initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
        );
      },
    );
  }

  Widget _getSelectedPage() {
    switch (positionOfPage) {
      case 0:
        return HomeBody();
      case 1:
        return const Center(
          child: Text(
            "Favorites Page",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        );
      case 2:
        return const Settings();
      default:
        return HomeBody();
    }
  }
}
