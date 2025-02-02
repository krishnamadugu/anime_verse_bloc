import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/app_constants/ui_constants/text_values.dart';
import '../../../../../core/shared/shared_widgets/basic_widgets/text_widget.dart';
import 'recommended_anime_item_widget.dart';

class RecommendedAnimeSectionWidget extends StatelessWidget {
  const RecommendedAnimeSectionWidget({
    super.key,
    required this.screenSize,
    required this.txtTheme,
  });

  final Size screenSize;
  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.0,
      children: [
        /// recommended header widget
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenSize.width * 0.5,
          ),
          child: TextWidget(
            txtVal: AppTexts.kRecommendedAnime,
            textStyle: txtTheme.labelLarge,
          ),
        ),

        /// recommended list tile widget
        Skeletonizer(
          enabled: false,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return RecommendedAnimeItemWidget(
                screenSize: screenSize,
                txtTheme: txtTheme,
              );
            },
          ),
        ),
      ],
    );
  }
}
