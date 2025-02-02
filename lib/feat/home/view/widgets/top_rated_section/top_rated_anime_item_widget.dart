import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../../core/shared/shared_widgets/basic_widgets/cache_img_builder.dart';
import '../../../../../core/shared/shared_widgets/basic_widgets/no_img_found_widget.dart';
import '../../../../../core/shared/shared_widgets/basic_widgets/text_widget.dart';

class TopRatedAnimeItemWidget extends StatelessWidget {
  const TopRatedAnimeItemWidget({
    super.key,
    required this.screenSize,
    required this.txtTheme,
  });

  final Size screenSize;
  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        spacing: 6.0,
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: "https://shorturl.at/75jev",
              imageBuilder: (context, imageProvider) => CacheImgBuilder(
                imageProvider: imageProvider,
                heightVal: screenSize.height * 0.18,
                widthVal: screenSize.width * 0.27,
                borderRadiusVal: 6.0,
              ),
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.greyColor,
                ),
              ),
              errorWidget: (context, url, error) => NoImgFoundWidget(),
            ),
          ),
          TextWidget(
            txtVal: "One Piece",
            textStyle: txtTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
