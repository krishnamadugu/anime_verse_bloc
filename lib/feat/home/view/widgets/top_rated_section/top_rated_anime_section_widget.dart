import 'package:anime_verse/feat/home/view/widgets/top_rated_section/top_rated_anime_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/app_constants/ui_constants/text_values.dart';
import '../../../../../core/shared/shared_widgets/basic_widgets/text_widget.dart';

class TopRatedAnimeSection extends StatelessWidget {
  const TopRatedAnimeSection({
    super.key,
    required this.screenSize,
    required this.txtTheme,
  });

  final Size screenSize;
  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      spacing: 10.0,
      children: [
        /// Top Rated Anime header widget
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenSize.width * 0.3,
          ),
          child: TextWidget(
            txtVal: AppTexts.kTopRatedAnime,
            textStyle: txtTheme.labelLarge,
          ),
        ),

        /// Top Rated Anime Ranking widget
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: screenSize.height * 0.23,
            maxWidth: screenSize.width,
          ),
          child: Skeletonizer(
            enabled: false,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return TopRatedAnimeItemWidget(
                  screenSize: screenSize,
                  txtTheme: txtTheme,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
