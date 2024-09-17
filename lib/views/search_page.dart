import 'package:flutter/material.dart';
import 'package:movies_app/Widgets/customTextField.dart';
import 'package:movies_app/Widgets/movies_view_list.dart';
import 'package:movies_app/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(primaryColor),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.cyan,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            textField(
              hint: 'Search',
              onChanged: (String name) {},
              icon: Icons.search,
              onFieldSubmitted: (String text) {
                
              },
            ),
            MoviesList(),
          ],
        ),
      ),
    );
  }
}
