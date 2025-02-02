import 'package:flutter/material.dart';

import '../widgets/genre_section/genre_section_widget.dart';
import '../widgets/misc_section/app_bar_widget.dart';
import '../widgets/recommeded_anime_section/recommended_anime_section_widget.dart';
import '../widgets/top_rated_section/top_rated_anime_section_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// adaptive ui properties
    final screenSize = MediaQuery.of(context).size;
    final TextTheme txtTheme = Theme.of(context).textTheme;
    final BoxConstraints defaultConstraints = BoxConstraints(
      maxHeight: screenSize.height * 0.28,
      maxWidth: screenSize.width * 0.8,
    );
    final BoxConstraints appBarDefConstraints = BoxConstraints(
      maxWidth: screenSize.width * 0.3,
    );

    return Scaffold(
      /// home screen app bar widget
      appBar: buildAppBarWidget(
        appBarDefConstraints,
        txtTheme,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 10.0,
        ),
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          /// top rated anime section
          ConstrainedBox(
            constraints: defaultConstraints,
            child: TopRatedAnimeSection(
              screenSize: screenSize,
              txtTheme: txtTheme,
            ),
          ),

          /// genre section
          GenreSectionWidget(
            screenSize: screenSize,
            txtTheme: txtTheme,
          ),

          const SizedBox(height: 20.0),

          /// recommended anime section
          RecommendedAnimeSectionWidget(
            screenSize: screenSize,
            txtTheme: txtTheme,
          ),
        ],
      ),
    );
  }
}
