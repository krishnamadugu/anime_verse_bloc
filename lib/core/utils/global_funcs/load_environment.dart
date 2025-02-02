import 'package:flutter/foundation.dart' hide Key;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../constants/app_constants/api_constants/api_urls.dart';

void loadAppEnvironment() {
  if (kReleaseMode) {
    /// release mode
    ApiUrls.baseUrl = dotenv.env['K_API_BASE_URL_PROD'] ?? "";
    ApiUrls.rapidApiHostVal = dotenv.env["K_RAPID_API_HOST"] ?? "";
    ApiUrls.rapidApiKeyVal = dotenv.env["K_RAPID_API_KEY"] ?? "";
  } else if (kDebugMode) {
    /// debug mode
    ApiUrls.baseUrl = dotenv.env['K_API_BASE_URL_DEV'] ?? "";
    ApiUrls.rapidApiHostVal = dotenv.env["K_RAPID_API_HOST"] ?? "";
    ApiUrls.rapidApiKeyVal = dotenv.env["K_RAPID_API_KEY"] ?? "";
  } else {
    /// test mode
    ApiUrls.baseUrl = dotenv.env['K_API_BASE_URL_TEST'] ?? "";
    ApiUrls.rapidApiHostVal = dotenv.env["K_RAPID_API_HOST"] ?? "";
    ApiUrls.rapidApiKeyVal = dotenv.env["K_RAPID_API_KEY"] ?? "";
  }
}
