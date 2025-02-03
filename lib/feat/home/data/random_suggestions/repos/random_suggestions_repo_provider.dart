import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../model/recommended_model/recommended_model.dart';
import '../data_provider/random_suggestions_data_provider.dart';

class RandomSuggestionsRepoProvider {
  RandomSuggestionsDataProvider randomSuggestionsDataProvider;

  RandomSuggestionsRepoProvider({
    required this.randomSuggestionsDataProvider,
  });

  Future<RecommendAnimationModel> onFetchTopRatedData(
      {required int pageCountVal}) async {
    try {
      final String jsonBody = await randomSuggestionsDataProvider
          .fetchRandomAnimeData(pageCount: pageCountVal);
      final decodedJsonVal = jsonDecode(jsonBody);

      final repoModel = RecommendAnimationModel.fromJson(decodedJsonVal);
      return repoModel;
    } catch (e) {
      debugPrint("message $e");
      throw Exception(e.toString());
    }
  }
}
