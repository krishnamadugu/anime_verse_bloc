import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../model/genre_model/genre_model.dart';
import '../data_provider/genere_data_provider.dart';

class GenreRepoProvider {
  GenreDataProvider genreDataProvider;
  GenreRepoProvider({
    required this.genreDataProvider,
  });

  Future<GenreDataRepoModel> onFetchGenreData() async {
    try {
      final String jsonBody = await genreDataProvider.fetchGenreData();
      final Map<String, dynamic> decodedJsonVal = {
        "data": jsonDecode(jsonBody),
      };

      final repoModel = GenreDataRepoModel.fromJson(decodedJsonVal);
      return repoModel;
    } catch (e) {
      debugPrint("message $e");
      throw Exception(e.toString());
    }
  }
}
