import '../../../../../core/constants/app_constants/api_constants/api_urls.dart';
import '../../../../../core/constants/app_constants/global_constants/global_constants.dart';
import '../../../../../core/constants/app_constants/ui_constants/text_values.dart';
import '../../../../../core/services/network_service/rest_api_service.dart';

class RandomSuggestionsDataProvider {
  Future<String> fetchRandomAnimeData({required int pageCount}) async {
    try {
      if (AppConstants.isNetworkConnected) {
        final details =
            ApiServices(url: "${ApiUrls.getAllInfo}page=$pageCount&size=10");
        var response = await details.getRequest();
        return response.body;
      } else {
        throw AppTexts.kPlsInternetConnection;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
