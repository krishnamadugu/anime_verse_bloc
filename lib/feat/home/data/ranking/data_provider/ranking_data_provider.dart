import 'dart:convert';

import '../../../../../core/constants/app_constants/api_constants/api_urls.dart';
import '../../../../../core/constants/app_constants/global_constants/global_constants.dart';
import '../../../../../core/constants/app_constants/ui_constants/text_values.dart';
import '../../../../../core/services/network_service/rest_api_service.dart';

class RankingDataProvider {
  Future<String> fetchTop10RankingData() async {
    try {
      if (AppConstants.isNetworkConnected) {
        List<Map<String, dynamic>> animeList = [];
        for (int i = 1; i <= 10; i++) {
          final details = ApiServices(url: "${ApiUrls.byRanking}/$i");
          var response = await details.getRequest();
          animeList.add(jsonDecode(response.body));
        }

        return jsonEncode({"data": animeList});
      } else {
        throw AppTexts.kPlsInternetConnection;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
