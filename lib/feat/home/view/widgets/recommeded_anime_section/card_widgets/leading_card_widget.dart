import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../../../core/shared/shared_widgets/basic_widgets/cache_img_builder.dart';
import '../../../../../../core/shared/shared_widgets/basic_widgets/no_img_found_widget.dart';

class LeadingCardWidget extends StatelessWidget {
  const LeadingCardWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "https://shorturl.at/75jev",
      imageBuilder: (context, imageProvider) => CacheImgBuilder(
        imageProvider: imageProvider,
        heightVal: screenSize.height * 0.15,
        widthVal: screenSize.width * 0.3,
        borderRadiusVal: 6.0,
      ),
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          color: AppColors.greyColor,
        ),
      ),
      errorWidget: (context, url, error) => NoImgFoundWidget(),
    );
  }
}
