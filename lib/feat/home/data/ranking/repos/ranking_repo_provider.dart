import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../model/top_rated_model/top_rated_model.dart';
import '../data_provider/ranking_data_provider.dart';

class RankingRepoProvider {
  RankingDataProvider rankingDataProvider;
  RankingRepoProvider({
    required this.rankingDataProvider,
  });

  Future<TopRatedAnimeModel> onFetchTopRatedData() async {
    try {
      final String jsonBody = await rankingDataProvider.fetchTop10RankingData();
      final decodedJsonVal = jsonDecode(jsonBody);

      final repoModel = TopRatedAnimeModel.fromJson(decodedJsonVal);
      return repoModel;
    } catch (e) {
      debugPrint("message $e");
      throw Exception(e.toString());
    }
  }
}
