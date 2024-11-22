import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Providers/search_provider.dart';
import 'package:movies_app/views/HomePage.dart';
import 'package:provider/provider.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchProvider()),
      ],
      child: MovieApp(
        savedThemeMode: savedThemeMode,
      )));
}
