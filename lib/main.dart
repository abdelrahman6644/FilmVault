import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Providers/search_provider.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/views/HomePage.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<FullMovieModel>(favoritesBox);
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(FullMovieModelAdapter());
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchProvider()),
      ],
      child: MovieApp(
        savedThemeMode: savedThemeMode,
      )));
}
