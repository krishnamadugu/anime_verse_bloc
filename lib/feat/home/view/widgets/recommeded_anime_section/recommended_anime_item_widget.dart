import 'package:flutter/material.dart';

import 'card_widgets/body_card_widget.dart';
import 'card_widgets/leading_card_widget.dart';

class RecommendedAnimeItemWidget extends StatelessWidget {
  const RecommendedAnimeItemWidget({
    super.key,
    required this.screenSize,
    required this.txtTheme,
    required this.cardTitle,
    required this.cardSubTitle,
    required this.cardDescription,
    required this.imgUrl,
  });

  final Size screenSize;
  final TextTheme txtTheme;
  final String cardTitle;
  final String cardSubTitle;
  final String cardDescription;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: screenSize.width,
          maxHeight: screenSize.height * 0.18,
        ),

        /// custom card widget for replicating list tile
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                /// leading img widget
                Expanded(
                  flex: 1,
                  child: LeadingCardWidget(
                    screenSize: screenSize,
                    imgUrl: imgUrl,
                  ),
                ),

                /// card body section
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: BodyCardWidget(
                      screenSize: screenSize,
                      txtTheme: txtTheme,
                      cardTitle: cardTitle,
                      cardSubTitle: cardSubTitle,
                      cardDescription: cardDescription,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
