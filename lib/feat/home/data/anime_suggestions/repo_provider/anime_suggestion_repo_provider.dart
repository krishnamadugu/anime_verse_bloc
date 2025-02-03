import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../model/recommended_model/recommended_model.dart';
import '../data_provider/anime_suggestion_data_provider.dart';

class AnimeSuggestionRepoProvider {
  AnimeSuggestionDataProvider animeSuggestionDataProvider;
  AnimeSuggestionRepoProvider({
    required this.animeSuggestionDataProvider,
  });

  Future<RecommendAnimationModel> onFetchGenreData() async {
    try {
      final String jsonBody = await animeSuggestionDataProvider
          .fetchAnimeSuggestionsData(pageCount: 1);
      final decodedJsonVal = jsonDecode(jsonBody);

      final repoModel = RecommendAnimationModel.fromJson(decodedJsonVal);
      return repoModel;
    } catch (e) {
      debugPrint("message $e");
      throw Exception(e.toString());
    }
  }
}
