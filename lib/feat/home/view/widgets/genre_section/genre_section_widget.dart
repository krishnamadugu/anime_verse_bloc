import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/app_constants/ui_constants/text_values.dart';
import '../../../../../core/shared/shared_widgets/basic_widgets/text_widget.dart';
import '../../../view_model/genre_view_model/genre_bloc.dart';
import 'genre_item_widget.dart';

class GenreSectionWidget extends StatelessWidget {
  const GenreSectionWidget({
    super.key,
    required this.screenSize,
    required this.txtTheme,
  });

  final Size screenSize;
  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    /// genre bloc value
    final genreBloc = context.read<GenreBloc>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      spacing: 10.0,
      children: [
        /// Genre header widget
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenSize.width * 0.3,
          ),
          child: TextWidget(
            txtVal: AppTexts.kGenre,
            textStyle: txtTheme.labelLarge,
          ),
        ),

        /// Genre container widget with bloc builder
        BlocBuilder<GenreBloc, GenreState>(
          bloc: genreBloc,
          builder: (BuildContext context, GenreState state) {
            return Skeletonizer(
              enabled: state.status == GenreStatus.loading ||
                  state.status == GenreStatus.initial,
              ignoreContainers: true,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: screenSize.height * 0.045,
                  maxWidth: screenSize.width,
                ),

                /// loading & success state condition widgets
                child: state.status == GenreStatus.loading ||
                        state.status == GenreStatus.initial
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, int index) {
                          return GenreItemWidget(
                            txtTheme: txtTheme,
                            txtVal: "Loading...",
                          );
                        },
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.genres.length,
                        itemBuilder: (context, int index) {
                          var genreItem = state.genres[index];
                          return GenreItemWidget(
                            txtTheme: txtTheme,
                            txtVal: genreItem.id ?? "",
                          );
                        },
                      ),
              ),
            );
          },
        )
      ],
    );
  }
}
