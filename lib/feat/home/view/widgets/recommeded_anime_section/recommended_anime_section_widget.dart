import 'package:anime_verse/feat/home/view_model/anime_suggestion_view_model/anime_suggestion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final animeSugBLoc = context.read<AnimeSuggestionBloc>();

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
        BlocBuilder<AnimeSuggestionBloc, AnimeSuggestionState>(
          bloc: animeSugBLoc,
          builder: (context, state) {
            return state.status.isLoading || state.status.isInitial
                ? Skeletonizer(
                    enabled: state.status.isInitial || state.status.isLoading,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return RecommendedAnimeItemWidget(
                          screenSize: screenSize,
                          txtTheme: txtTheme,
                          cardTitle: 'one Piece',
                          cardSubTitle: '12 Episodes (airing)',
                          cardDescription:
                              "rem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including vers",
                          imgUrl:
                              'https://m.media-amazon.com/images/I/610EOEUI5hL._SX300_SY300_QL70_FMwebp_.jpg',
                        );
                      },
                    ),
                  )
                : Skeletonizer(
                    enabled: false,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.animeSuggestionList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = state.animeSuggestionList[index];
                        return RecommendedAnimeItemWidget(
                          screenSize: screenSize,
                          txtTheme: txtTheme,
                          cardTitle: item.title ?? "",
                          cardSubTitle:
                              '${item.episodes} Episodes (${item.status})',
                          cardDescription: item.synopsis ?? "",
                          imgUrl: item.image ?? "",
                        );
                      },
                    ),
                  );
          },
        ),
      ],
    );
  }
}
