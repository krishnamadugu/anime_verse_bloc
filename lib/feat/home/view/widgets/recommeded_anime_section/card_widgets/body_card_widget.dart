import 'package:flutter/material.dart';

import '../../../../../../core/shared/shared_widgets/basic_widgets/text_widget.dart';

class BodyCardWidget extends StatelessWidget {
  const BodyCardWidget({
    super.key,
    required this.screenSize,
    required this.txtTheme,
    required this.cardTitle,
    required this.cardSubTitle,
    required this.cardDescription,
  });

  final Size screenSize;
  final TextTheme txtTheme;
  final String cardTitle;
  final String cardSubTitle;
  final String cardDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      spacing: 4.0,
      children: [
        /// card title name widget
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenSize.width * 0.5,
          ),
          child: TextWidget(
            txtVal: cardTitle,
            textStyle: txtTheme.labelLarge,
          ),
        ),

        /// card sub title name widget
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenSize.width * 0.6,
          ),
          child: TextWidget(
            txtVal: cardSubTitle,
            textStyle: txtTheme.titleMedium,
          ),
        ),

        /// card description text widget

        Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenSize.width * 0.7,
              maxHeight: screenSize.height * 0.2,
            ),
            child: SingleChildScrollView(
              child: TextWidget(
                txtVal: cardDescription,
                textStyle: txtTheme.labelMedium,
                maxLines: 4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
