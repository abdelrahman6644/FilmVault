import 'package:flutter/material.dart';
import 'package:movies_app/Providers/search_provider.dart';
import 'package:movies_app/views/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SearchProvider()),
    ],
    child: const Movieapp()
    ));
}
