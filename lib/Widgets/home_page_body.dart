import 'package:flutter/material.dart';
import 'package:movies_app/Widgets/customTextField.dart';
import 'package:movies_app/Widgets/show_movies_by_genere.dart';
import 'package:movies_app/Widgets/trending_view_builder.dart';
import 'package:movies_app/Widgets/upcoming_view_builder.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/views/search_page.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        slivers: [
          const SliverAppBar(
            iconTheme: IconThemeData(
              color: Colors.cyan,
            ),
            pinned: true,
            expandedHeight: 110.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                appName,
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              textField(
                hint: 'Search',
                onChanged: (String name) {},
                icon: Icons.search,
                onFieldSubmitted: (String value) {
                  if (value.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPage(
                                movieName: value,
                              )),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const TrendingRow(),
              const Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Upcoming',
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const UpcomingRow(),
              ShowMoviesByGenere(),
            ]),
          ),
        ]);
  }
}
