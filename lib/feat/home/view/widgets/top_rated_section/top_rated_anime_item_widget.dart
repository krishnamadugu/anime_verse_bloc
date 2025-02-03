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
    required this.imgUrl,
    required this.name,
  });

  final Size screenSize;
  final TextTheme txtTheme;
  final String imgUrl;
  final String name;

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
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenSize.width * 0.27,
              maxHeight: screenSize.height * 0.2,
            ),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              imageBuilder: (context, imageProvider) => CacheImgBuilder(
                imageProvider: imageProvider,
                heightVal: screenSize.height * 0.2,
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
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenSize.width * 0.28,
            ),
            child: TextWidget(
              txtVal: name,
              textStyle: txtTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
