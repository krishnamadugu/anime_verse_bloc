import 'package:flutter/material.dart';

import '../../../../../../core/shared/shared_widgets/basic_widgets/text_widget.dart';

class BodyCardWidget extends StatelessWidget {
  const BodyCardWidget({
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
      spacing: 4.0,
      children: [
        /// card title name widget
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenSize.width * 0.5,
          ),
          child: TextWidget(
            txtVal: "One Piece",
            textStyle: txtTheme.labelLarge,
          ),
        ),

        /// card sub title name widget
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenSize.width * 0.6,
          ),
          child: TextWidget(
            txtVal: "12 Episodes (Finished Airing)",
            textStyle: txtTheme.labelMedium,
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
                txtVal:
                    "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                textStyle: txtTheme.labelSmall,
                maxLines: 5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
